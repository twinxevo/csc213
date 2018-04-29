.data
buzz_1:.asciiz "\nSee my person o, enter any number for (A):"
buzz_2:.asciiz "\nNor vex Abeg enter for (B):"
buzz_3:.asciiz "\nDo the samething for (C):"
buzz_error:.asciiz "\nOMO, That na complex root when go give person complication stories. Enter better number joor "
buzz_ans:.asciiz "\nSee better pikin\nYour answer na\n"
buzz_and:.asciiz "\nAnd\n"
buzz_question:.asciiz "\nYou go like RE-DO another Quadratic Equation?\nBut remember say i nor they like Complex Roots oo!!!\nOya make you press 1 to continue or any key to exit\n"
buzz_goodbye:.asciiz "\nI nor they like front o,but sha bye bye.\n Nor find trouble sha. I nor sabi fight for person!!!"
buzz_two: .float 2
buzz_four: .float 4

.text
Starting_starting:
lwc1 $f1,buzz_two                   #$f1 they hold 2.0
lwc1 $f2,buzz_four                  #$f2 they hold 4.0

la $a0,buzz_1                       #Tell user make e enter any number as A
li $v0,4
syscall
li $v0,6
syscall
mov.s $f4,$f0                       #Na $f4 i take hold A

la $a0,buzz_2                       #Tell user make e enter any number as B
li $v0,4
syscall
li $v0,6
syscall
mov.s $f5,$f0                       #Na $f5 i take hold B

la $a0,buzz_3                       #Tell user make e enter any number as C
li $v0,4
syscall
li $v0,6
syscall
mov.s $f6,$f0                       #Na $f6 i take hold C

#Na now i start to calculate my discriminant when be ## d = b^2-4*a*c
#And my 4=$f2, a=$f4, b=$f5, c=$f6

mul.s $f7,$f5,$f5                  #$f7 = b^2
mul.s $f8,$f2,$f4                  
mul.s $f8,$f8,$f6                  #$f8 = 4*a*c
sub.s $f8,$f7,$f8                  #$f8 = d = b^2-4*a*c#$f9 = d = b^2-4*a*c

sqrt.s $f10,$f8                    #$f10 they hold the square root of the discriminant
mfc1 $t1,$f8                      #i change $f8 to $t1 make i for fit check if my discriminat small pass zero(0)
blez $t1,error_label               #Na to check if the discriminant small pass zero or na zero

#roots_solver                      #Correct person. Oya make we start calculation when be ## -b+-sqrtd/2*a
neg.s $f9,$f5                      #For here i just change b to -b. like this $f9=-b
add.s $f23,$f9,$f10                #For here i just do small -b+sqrtd
sub.s $f25,$f9,$f10                #For here i just do small -b-sqrtd
mul.s $f1,$f1,$f4                  #Na just 2*a i write for here
div.s $f24,$f23,$f1                #I con divide -b+sqrtd by 2*a
div.s $f26,$f25,$f1                #I con divide -b-sqrtd by 2*a
la $a0,buzz_ans
li $v0,4
syscall

mov.s $f12,$f24                    #I carry the answer for -b+sqrtd by 2*a put for $f12 make i for fit print my answer
li $v0,2
syscall

la $a0,buzz_and
li $v0,4
syscall

mov.s $f12,$f26                   #I carry the answer for -b-sqrtd by 2*a put for $f12 make i for fit print my answer
li $v0,2
syscall

la $a0,buzz_question             #I use this one take ask user to continue or stop. No lay-lay
li $v0,4
syscall
li $v0,5
syscall
move $t4,$v0
li $t3,1
beq $t4,$t3,Starting_starting
b exit

error_label:
la $a0,buzz_error
li $v0,4
syscall

la $a0,buzz_question            #I use this one take ask user to continue or stop. No lay-lay
li $v0,4
syscall
li $v0,5
syscall
move $t4,$v0
li $t3,1
beq $t4,$t3,Starting_starting

b exit

exit:
la $a0,buzz_goodbye           #Body done broke make person rest.
li $v0,4
syscall

li $v0,10                    #Na here i end mata, i done match break. Go sleep joor
syscall
