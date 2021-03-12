;
; spi_atmega.asm
;
; Created: 11/03/2021 22:54:26
; Author : erika
;


; Replace with your application code

; ======================= DEFINIÇÕES ========================= ;

.org 0x0000 rjmp init_all

; ======================== INIT_ALL ========================== ;

init_all:

	ldi r16, (0<<PRSPI)
	sts PRR, r16

	;rcall init_SPI
	;rcall stack

	ldi r20, 0x00

	rjmp main

; ======================== FUNÇÕES =========================== ;

; ========================= STACK ============================ ;

stack:

	ldi r16, high(RAMEND)         
	out SPH, r16                  
	ldi r16, low(RAMEND)            
	out SPL, r16 

	ret

; =========================== SPI ============================ ;

; ================== MASTER ================== ;

init_SPI_Master:

	; Nesse modo o DS3234 é um Master ;

	; Definindo MOSI e SCK como output e o resto como input ;
	; PINB2 = CS/SS
	; PINB3 = MOSI/DIN
	; PINB4 = MISO/DOUT
	; PINB5 = SCLK

	ldi r16, 0b0010_1100
	out DDRB, r16

	ldi r16, 0b0001_0100
	out PORTB, r16

	; Habilita o SPI, Master e deixa o clock em clk/16		;
	ldi r16, (1<<SPE) | (1<<MSTR) | (1<<SPR0) | (1<<SPR1)
	out SPCR, r16

	ret

start_SPI_Master:

	; Aqui é pra inicializar a trsnsmissão ;
	; Irá transmitir o dado que está no r20;

	out SPDR, r20

	ret

wait_SPI_Master:

	; Aqui temos a função que irá esperar a transmissão acabar ;

	in r17, SPSR
	sbrs r17, SPIF
	rjmp wait_SPI_Master

	ret

transmit_from_atmega:

	; Nessa função iremos enviar os dados para o DS3234 ;

	rcall init_SPI_Master
	rcall start_SPI_Master
	rcall wait_SPI_Master

	ret

; ================== SLAVE ================== ;

init_SPI_Slave:

	; Nesse modo o DS3234 é um Escravo ;

	; Definindo MISO e CS como output e o resto como input ;
	; PINB2 = CS/SS
	; PINB3 = MOSI/DIN
	; PINB4 = MISO/DOUT
	; PINB5 = SCLK

	ldi r16, 0b0001_0000
	out DDRB, r16

	ldi r16, 0b0010_0100
	out PORTB, r16

	; Habilita o SPI, Master e deixa o clock em clk/16		;
	ldi r16, (1<<SPE)
	out SPCR, r16

	ret

wait_SPI_Slave:

	in r17, SPSR
	sbrs r17, SPIF
	rjmp wait_SPI_Slave

	in r21, SPDR
	
	ret

receive_to_atmega:

	; Nessa função iremos enviar os dados para o atmega328p ;

	rcall init_SPI_Slave
	rcall wait_SPI_Slave
	
	ret	

; ============================= MAIN ========================== ;

main:
    
	; Iremos enviar o valor no r20 para o DS3234 ;

	rcall transmit_from_atmega

	; Iremos receber o valor e armazenar no r21 do atmega ;
	;ldi r21, 0b0000_0000
	;rcall receive_to_atmega

    rjmp main
