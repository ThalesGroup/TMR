.section .text.init
.option norvc
.section .text.start, "ax", @progbits
.globl _start
_start:
  csrr a0, mhartid
  li t5, 0x50000080
  lw ra, 0(t5)
  lw sp, 4(t5)
  lw gp, 8(t5)
  lw tp, 12(t5)
  lw t0, 16(t5)
  lw t1, 20(t5)
  lw t2, 24(t5)
# lw fp, 28(t5)
  lw s1, 32(t5)
  lw a0, 36(t5)
  lw a1, 40(t5)
  lw a2, 44(t5)
  lw a3, 48(t5)
  lw a4, 52(t5)
  lw a5, 56(t5)
  lw a6, 60(t5)
  lw a7, 64(t5)
  lw s2, 68(t5)
  lw s3, 72(t5)
  lw s4, 76(t5)
  lw s5, 80(t5)
  lw s6, 84(t5)
  lw s7, 88(t5)
  lw s8, 92(t5)
  lw s9, 96(t5)
  lw s10, 100(t5)
  lw s11, 104(t5)
  lw t3, 108(t5)
  lw t4, 112(t5)
# lw t5, 116(t5)
  csrr t3, mstatus
  lw t6, 156(t5) //load mpp
  li t4, 11
  sll t6, t6, t4 //shift mpp 11 bits left
  or t3, t3, t6
  lw t6, 160(t5) //load spp
  li t4, 8
  sll t6, t6, t4 //shift spp 8 bits left
  or t3, t3, t6
  lw t6, 164(t5) //load mpie
  li t4, 7
  sll t6, t6, t4 //shift mpie 7 bits left
  or t3, t3, t6
  lw t6, 168(t5) //load mie
  li t4, 3
  sll t6, t6, t4 //shift mpie 3 bits left
  or t3, t3, t6
  csrw mstatus, t3
  lw t3, 108(t5) //restore t3
  lw t4, 112(t5) //restore t4
  #lw t6, 132(t5) // load mcause
  #csrw mcause, t6
  lw t6, 172(t5) // load tvec
  csrw mtvec, t6
  lw t6, 120(t5) // restore t6
  lw t5, 124(t5) // load PC
  jr t5

.section .text.test, "ax", @progbits

.globl _wait
_wait:

1:
# j 1b
  li a1, 0x11000000
  li a2, 0x41
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x42
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x43
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x44
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x45
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x46
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x47
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x48
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x49
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x4A
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x4B
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x4C
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x4D
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x4E
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x4F
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x50
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x51
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x52
  sb a2, 4(a1)
  li a1, 0x11000000
  li a2, 0x53
  sb a2, 4(a1)
