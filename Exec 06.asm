.data
    space: .asciiz " "
.text

.globl main

main:
     	li $v0, 5 # syscall para ler inteiro
     	syscall
     
     	move $t0, $v0 # armazena N em $t0
     	li $t1, 1 # armazena 1 em $t1 para imprimir o primeiro número ímpar
     	li $t2, 0 # armazena 0 em $t2 para contar quantos números ímpares foram impressos
     	
loop:
     	beq $t2, $t0, end # se o contador de números ímpares impressos == N, pule para o final
     	move $a0, $t1 # move o número ímpar atual para $a0 para imprimir
     	li $v0, 1 # syscall para imprimir inteiro
     	syscall
     
     	la $a0, space # carrega endereço de espaço em $a0
     	li $v0, 4 # syscall para imprimir string
     	syscall
     
     	addi $t1, $t1, 2 # incrementa o número ímpar atual em 2 para obter o próximo número ímpar
     	addi $t2, $t2, 1 # incrementa o contador de números ímpares impressos
     
     	j loop # pula para o início do loop
end:
     	li $v0, 10 # syscall para sair
     	syscall
