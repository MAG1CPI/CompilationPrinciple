
test1:     file format elf64-x86-64


Disassembly of section .init:

00000000000005e0 <_init>:
 5e0:	48 83 ec 08          	sub    $0x8,%rsp
 5e4:	48 8b 05 fd 09 20 00 	mov    0x2009fd(%rip),%rax        # 200fe8 <__gmon_start__>
 5eb:	48 85 c0             	test   %rax,%rax
 5ee:	74 02                	je     5f2 <_init+0x12>
 5f0:	ff d0                	callq  *%rax
 5f2:	48 83 c4 08          	add    $0x8,%rsp
 5f6:	c3                   	retq   

Disassembly of section .plt:

0000000000000600 <.plt>:
 600:	ff 35 a2 09 20 00    	pushq  0x2009a2(%rip)        # 200fa8 <_GLOBAL_OFFSET_TABLE_+0x8>
 606:	ff 25 a4 09 20 00    	jmpq   *0x2009a4(%rip)        # 200fb0 <_GLOBAL_OFFSET_TABLE_+0x10>
 60c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000610 <puts@plt>:
 610:	ff 25 a2 09 20 00    	jmpq   *0x2009a2(%rip)        # 200fb8 <puts@GLIBC_2.2.5>
 616:	68 00 00 00 00       	pushq  $0x0
 61b:	e9 e0 ff ff ff       	jmpq   600 <.plt>

0000000000000620 <__stack_chk_fail@plt>:
 620:	ff 25 9a 09 20 00    	jmpq   *0x20099a(%rip)        # 200fc0 <__stack_chk_fail@GLIBC_2.4>
 626:	68 01 00 00 00       	pushq  $0x1
 62b:	e9 d0 ff ff ff       	jmpq   600 <.plt>

0000000000000630 <printf@plt>:
 630:	ff 25 92 09 20 00    	jmpq   *0x200992(%rip)        # 200fc8 <printf@GLIBC_2.2.5>
 636:	68 02 00 00 00       	pushq  $0x2
 63b:	e9 c0 ff ff ff       	jmpq   600 <.plt>

0000000000000640 <__isoc99_scanf@plt>:
 640:	ff 25 8a 09 20 00    	jmpq   *0x20098a(%rip)        # 200fd0 <__isoc99_scanf@GLIBC_2.7>
 646:	68 03 00 00 00       	pushq  $0x3
 64b:	e9 b0 ff ff ff       	jmpq   600 <.plt>

Disassembly of section .plt.got:

0000000000000650 <__cxa_finalize@plt>:
 650:	ff 25 a2 09 20 00    	jmpq   *0x2009a2(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 656:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000660 <_start>:
 660:	31 ed                	xor    %ebp,%ebp
 662:	49 89 d1             	mov    %rdx,%r9
 665:	5e                   	pop    %rsi
 666:	48 89 e2             	mov    %rsp,%rdx
 669:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 66d:	50                   	push   %rax
 66e:	54                   	push   %rsp
 66f:	4c 8d 05 7a 03 00 00 	lea    0x37a(%rip),%r8        # 9f0 <__libc_csu_fini>
 676:	48 8d 0d 03 03 00 00 	lea    0x303(%rip),%rcx        # 980 <__libc_csu_init>
 67d:	48 8d 3d e6 00 00 00 	lea    0xe6(%rip),%rdi        # 76a <main>
 684:	ff 15 56 09 20 00    	callq  *0x200956(%rip)        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 68a:	f4                   	hlt    
 68b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000690 <deregister_tm_clones>:
 690:	48 8d 3d 79 09 20 00 	lea    0x200979(%rip),%rdi        # 201010 <__TMC_END__>
 697:	55                   	push   %rbp
 698:	48 8d 05 71 09 20 00 	lea    0x200971(%rip),%rax        # 201010 <__TMC_END__>
 69f:	48 39 f8             	cmp    %rdi,%rax
 6a2:	48 89 e5             	mov    %rsp,%rbp
 6a5:	74 19                	je     6c0 <deregister_tm_clones+0x30>
 6a7:	48 8b 05 2a 09 20 00 	mov    0x20092a(%rip),%rax        # 200fd8 <_ITM_deregisterTMCloneTable>
 6ae:	48 85 c0             	test   %rax,%rax
 6b1:	74 0d                	je     6c0 <deregister_tm_clones+0x30>
 6b3:	5d                   	pop    %rbp
 6b4:	ff e0                	jmpq   *%rax
 6b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 6bd:	00 00 00 
 6c0:	5d                   	pop    %rbp
 6c1:	c3                   	retq   
 6c2:	0f 1f 40 00          	nopl   0x0(%rax)
 6c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 6cd:	00 00 00 

00000000000006d0 <register_tm_clones>:
 6d0:	48 8d 3d 39 09 20 00 	lea    0x200939(%rip),%rdi        # 201010 <__TMC_END__>
 6d7:	48 8d 35 32 09 20 00 	lea    0x200932(%rip),%rsi        # 201010 <__TMC_END__>
 6de:	55                   	push   %rbp
 6df:	48 29 fe             	sub    %rdi,%rsi
 6e2:	48 89 e5             	mov    %rsp,%rbp
 6e5:	48 c1 fe 03          	sar    $0x3,%rsi
 6e9:	48 89 f0             	mov    %rsi,%rax
 6ec:	48 c1 e8 3f          	shr    $0x3f,%rax
 6f0:	48 01 c6             	add    %rax,%rsi
 6f3:	48 d1 fe             	sar    %rsi
 6f6:	74 18                	je     710 <register_tm_clones+0x40>
 6f8:	48 8b 05 f1 08 20 00 	mov    0x2008f1(%rip),%rax        # 200ff0 <_ITM_registerTMCloneTable>
 6ff:	48 85 c0             	test   %rax,%rax
 702:	74 0c                	je     710 <register_tm_clones+0x40>
 704:	5d                   	pop    %rbp
 705:	ff e0                	jmpq   *%rax
 707:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 70e:	00 00 
 710:	5d                   	pop    %rbp
 711:	c3                   	retq   
 712:	0f 1f 40 00          	nopl   0x0(%rax)
 716:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 71d:	00 00 00 

0000000000000720 <__do_global_dtors_aux>:
 720:	80 3d e9 08 20 00 00 	cmpb   $0x0,0x2008e9(%rip)        # 201010 <__TMC_END__>
 727:	75 2f                	jne    758 <__do_global_dtors_aux+0x38>
 729:	48 83 3d c7 08 20 00 	cmpq   $0x0,0x2008c7(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 730:	00 
 731:	55                   	push   %rbp
 732:	48 89 e5             	mov    %rsp,%rbp
 735:	74 0c                	je     743 <__do_global_dtors_aux+0x23>
 737:	48 8b 3d ca 08 20 00 	mov    0x2008ca(%rip),%rdi        # 201008 <__dso_handle>
 73e:	e8 0d ff ff ff       	callq  650 <__cxa_finalize@plt>
 743:	e8 48 ff ff ff       	callq  690 <deregister_tm_clones>
 748:	c6 05 c1 08 20 00 01 	movb   $0x1,0x2008c1(%rip)        # 201010 <__TMC_END__>
 74f:	5d                   	pop    %rbp
 750:	c3                   	retq   
 751:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 758:	f3 c3                	repz retq 
 75a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000760 <frame_dummy>:
 760:	55                   	push   %rbp
 761:	48 89 e5             	mov    %rsp,%rbp
 764:	5d                   	pop    %rbp
 765:	e9 66 ff ff ff       	jmpq   6d0 <register_tm_clones>

000000000000076a <main>:
 76a:	55                   	push   %rbp
 76b:	48 89 e5             	mov    %rsp,%rbp
 76e:	48 83 ec 30          	sub    $0x30,%rsp
 772:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 779:	00 00 
 77b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 77f:	31 c0                	xor    %eax,%eax
 781:	48 8d 3d 7c 02 00 00 	lea    0x27c(%rip),%rdi        # a04 <_IO_stdin_used+0x4>
 788:	e8 83 fe ff ff       	callq  610 <puts@plt>
 78d:	48 8d 0d 88 08 20 00 	lea    0x200888(%rip),%rcx        # 20101c <score2>
 794:	48 8d 15 7d 08 20 00 	lea    0x20087d(%rip),%rdx        # 201018 <score1>
 79b:	48 8d 35 7e 08 20 00 	lea    0x20087e(%rip),%rsi        # 201020 <s>
 7a2:	48 8d 3d 79 02 00 00 	lea    0x279(%rip),%rdi        # a22 <_IO_stdin_used+0x22>
 7a9:	b8 00 00 00 00       	mov    $0x0,%eax
 7ae:	e8 8d fe ff ff       	callq  640 <__isoc99_scanf@plt>
 7b3:	f3 0f 10 05 5d 08 20 	movss  0x20085d(%rip),%xmm0        # 201018 <score1>
 7ba:	00 
 7bb:	f3 0f 10 0d 59 08 20 	movss  0x200859(%rip),%xmm1        # 20101c <score2>
 7c2:	00 
 7c3:	0f 2e c1             	ucomiss %xmm1,%xmm0
 7c6:	76 0a                	jbe    7d2 <main+0x68>
 7c8:	f3 0f 10 05 48 08 20 	movss  0x200848(%rip),%xmm0        # 201018 <score1>
 7cf:	00 
 7d0:	eb 08                	jmp    7da <main+0x70>
 7d2:	f3 0f 10 05 42 08 20 	movss  0x200842(%rip),%xmm0        # 20101c <score2>
 7d9:	00 
 7da:	f3 0f 11 05 42 08 20 	movss  %xmm0,0x200842(%rip)        # 201024 <s+0x4>
 7e1:	00 
 7e2:	f3 0f 10 05 3a 08 20 	movss  0x20083a(%rip),%xmm0        # 201024 <s+0x4>
 7e9:	00 
 7ea:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
 7ee:	8b 05 2c 08 20 00    	mov    0x20082c(%rip),%eax        # 201020 <s>
 7f4:	89 c6                	mov    %eax,%esi
 7f6:	48 8d 3d 2c 02 00 00 	lea    0x22c(%rip),%rdi        # a29 <_IO_stdin_used+0x29>
 7fd:	b8 01 00 00 00       	mov    $0x1,%eax
 802:	e8 29 fe ff ff       	callq  630 <printf@plt>
 807:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%rbp)
 80e:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%rbp)
 815:	c7 45 e8 0a 00 00 00 	movl   $0xa,-0x18(%rbp)
 81c:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%rbp)
 823:	c7 45 f0 06 00 00 00 	movl   $0x6,-0x10(%rbp)
 82a:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%rbp)
 831:	8b 55 dc             	mov    -0x24(%rbp),%edx
 834:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 838:	89 d6                	mov    %edx,%esi
 83a:	48 89 c7             	mov    %rax,%rdi
 83d:	e8 4f 00 00 00       	callq  891 <sort>
 842:	8b 45 dc             	mov    -0x24(%rbp),%eax
 845:	83 e8 01             	sub    $0x1,%eax
 848:	89 45 d8             	mov    %eax,-0x28(%rbp)
 84b:	8b 45 d8             	mov    -0x28(%rbp),%eax
 84e:	8d 50 ff             	lea    -0x1(%rax),%edx
 851:	89 55 d8             	mov    %edx,-0x28(%rbp)
 854:	48 98                	cltq   
 856:	8b 44 85 e0          	mov    -0x20(%rbp,%rax,4),%eax
 85a:	89 c6                	mov    %eax,%esi
 85c:	48 8d 3d e2 01 00 00 	lea    0x1e2(%rip),%rdi        # a45 <_IO_stdin_used+0x45>
 863:	b8 00 00 00 00       	mov    $0x0,%eax
 868:	e8 c3 fd ff ff       	callq  630 <printf@plt>
 86d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 871:	78 02                	js     875 <main+0x10b>
 873:	eb d6                	jmp    84b <main+0xe1>
 875:	90                   	nop
 876:	b8 00 00 00 00       	mov    $0x0,%eax
 87b:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 87f:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 886:	00 00 
 888:	74 05                	je     88f <main+0x125>
 88a:	e8 91 fd ff ff       	callq  620 <__stack_chk_fail@plt>
 88f:	c9                   	leaveq 
 890:	c3                   	retq   

0000000000000891 <sort>:
 891:	55                   	push   %rbp
 892:	48 89 e5             	mov    %rsp,%rbp
 895:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 899:	89 75 e4             	mov    %esi,-0x1c(%rbp)
 89c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 8a3:	e9 be 00 00 00       	jmpq   966 <sort+0xd5>
 8a8:	8b 45 f0             	mov    -0x10(%rbp),%eax
 8ab:	89 45 f4             	mov    %eax,-0xc(%rbp)
 8ae:	8b 45 f0             	mov    -0x10(%rbp),%eax
 8b1:	83 c0 01             	add    $0x1,%eax
 8b4:	89 45 f8             	mov    %eax,-0x8(%rbp)
 8b7:	eb 3a                	jmp    8f3 <sort+0x62>
 8b9:	8b 45 f4             	mov    -0xc(%rbp),%eax
 8bc:	48 98                	cltq   
 8be:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 8c5:	00 
 8c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 8ca:	48 01 d0             	add    %rdx,%rax
 8cd:	8b 10                	mov    (%rax),%edx
 8cf:	8b 45 f8             	mov    -0x8(%rbp),%eax
 8d2:	48 98                	cltq   
 8d4:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 8db:	00 
 8dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 8e0:	48 01 c8             	add    %rcx,%rax
 8e3:	8b 00                	mov    (%rax),%eax
 8e5:	39 c2                	cmp    %eax,%edx
 8e7:	7e 06                	jle    8ef <sort+0x5e>
 8e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
 8ec:	89 45 f4             	mov    %eax,-0xc(%rbp)
 8ef:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 8f3:	8b 45 f8             	mov    -0x8(%rbp),%eax
 8f6:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 8f9:	7c be                	jl     8b9 <sort+0x28>
 8fb:	8b 45 f4             	mov    -0xc(%rbp),%eax
 8fe:	3b 45 f0             	cmp    -0x10(%rbp),%eax
 901:	74 5f                	je     962 <sort+0xd1>
 903:	8b 45 f0             	mov    -0x10(%rbp),%eax
 906:	48 98                	cltq   
 908:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 90f:	00 
 910:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 914:	48 01 d0             	add    %rdx,%rax
 917:	8b 00                	mov    (%rax),%eax
 919:	89 45 fc             	mov    %eax,-0x4(%rbp)
 91c:	8b 45 f4             	mov    -0xc(%rbp),%eax
 91f:	48 98                	cltq   
 921:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 928:	00 
 929:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 92d:	48 01 d0             	add    %rdx,%rax
 930:	8b 55 f0             	mov    -0x10(%rbp),%edx
 933:	48 63 d2             	movslq %edx,%rdx
 936:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
 93d:	00 
 93e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 942:	48 01 ca             	add    %rcx,%rdx
 945:	8b 00                	mov    (%rax),%eax
 947:	89 02                	mov    %eax,(%rdx)
 949:	8b 45 f4             	mov    -0xc(%rbp),%eax
 94c:	48 98                	cltq   
 94e:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 955:	00 
 956:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 95a:	48 01 c2             	add    %rax,%rdx
 95d:	8b 45 fc             	mov    -0x4(%rbp),%eax
 960:	89 02                	mov    %eax,(%rdx)
 962:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
 966:	8b 45 f0             	mov    -0x10(%rbp),%eax
 969:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 96c:	0f 8c 36 ff ff ff    	jl     8a8 <sort+0x17>
 972:	90                   	nop
 973:	5d                   	pop    %rbp
 974:	c3                   	retq   
 975:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 97c:	00 00 00 
 97f:	90                   	nop

0000000000000980 <__libc_csu_init>:
 980:	41 57                	push   %r15
 982:	41 56                	push   %r14
 984:	49 89 d7             	mov    %rdx,%r15
 987:	41 55                	push   %r13
 989:	41 54                	push   %r12
 98b:	4c 8d 25 0e 04 20 00 	lea    0x20040e(%rip),%r12        # 200da0 <__frame_dummy_init_array_entry>
 992:	55                   	push   %rbp
 993:	48 8d 2d 0e 04 20 00 	lea    0x20040e(%rip),%rbp        # 200da8 <__init_array_end>
 99a:	53                   	push   %rbx
 99b:	41 89 fd             	mov    %edi,%r13d
 99e:	49 89 f6             	mov    %rsi,%r14
 9a1:	4c 29 e5             	sub    %r12,%rbp
 9a4:	48 83 ec 08          	sub    $0x8,%rsp
 9a8:	48 c1 fd 03          	sar    $0x3,%rbp
 9ac:	e8 2f fc ff ff       	callq  5e0 <_init>
 9b1:	48 85 ed             	test   %rbp,%rbp
 9b4:	74 20                	je     9d6 <__libc_csu_init+0x56>
 9b6:	31 db                	xor    %ebx,%ebx
 9b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 9bf:	00 
 9c0:	4c 89 fa             	mov    %r15,%rdx
 9c3:	4c 89 f6             	mov    %r14,%rsi
 9c6:	44 89 ef             	mov    %r13d,%edi
 9c9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 9cd:	48 83 c3 01          	add    $0x1,%rbx
 9d1:	48 39 dd             	cmp    %rbx,%rbp
 9d4:	75 ea                	jne    9c0 <__libc_csu_init+0x40>
 9d6:	48 83 c4 08          	add    $0x8,%rsp
 9da:	5b                   	pop    %rbx
 9db:	5d                   	pop    %rbp
 9dc:	41 5c                	pop    %r12
 9de:	41 5d                	pop    %r13
 9e0:	41 5e                	pop    %r14
 9e2:	41 5f                	pop    %r15
 9e4:	c3                   	retq   
 9e5:	90                   	nop
 9e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 9ed:	00 00 00 

00000000000009f0 <__libc_csu_fini>:
 9f0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000000009f4 <_fini>:
 9f4:	48 83 ec 08          	sub    $0x8,%rsp
 9f8:	48 83 c4 08          	add    $0x8,%rsp
 9fc:	c3                   	retq   
