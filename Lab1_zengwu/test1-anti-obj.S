
test1.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 30          	sub    $0x30,%rsp
   8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
   f:	00 00 
  11:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  15:	31 c0                	xor    %eax,%eax
  17:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 1e <main+0x1e>
  1e:	e8 00 00 00 00       	callq  23 <main+0x23>
  23:	48 8d 0d 00 00 00 00 	lea    0x0(%rip),%rcx        # 2a <main+0x2a>
  2a:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 31 <main+0x31>
  31:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 38 <main+0x38>
  38:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 3f <main+0x3f>
  3f:	b8 00 00 00 00       	mov    $0x0,%eax
  44:	e8 00 00 00 00       	callq  49 <main+0x49>
  49:	f3 0f 10 05 00 00 00 	movss  0x0(%rip),%xmm0        # 51 <main+0x51>
  50:	00 
  51:	f3 0f 10 0d 00 00 00 	movss  0x0(%rip),%xmm1        # 59 <main+0x59>
  58:	00 
  59:	0f 2e c1             	ucomiss %xmm1,%xmm0
  5c:	76 0a                	jbe    68 <main+0x68>
  5e:	f3 0f 10 05 00 00 00 	movss  0x0(%rip),%xmm0        # 66 <main+0x66>
  65:	00 
  66:	eb 08                	jmp    70 <main+0x70>
  68:	f3 0f 10 05 00 00 00 	movss  0x0(%rip),%xmm0        # 70 <main+0x70>
  6f:	00 
  70:	f3 0f 11 05 00 00 00 	movss  %xmm0,0x0(%rip)        # 78 <main+0x78>
  77:	00 
  78:	f3 0f 10 05 00 00 00 	movss  0x0(%rip),%xmm0        # 80 <main+0x80>
  7f:	00 
  80:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  84:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 8a <main+0x8a>
  8a:	89 c6                	mov    %eax,%esi
  8c:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 93 <main+0x93>
  93:	b8 01 00 00 00       	mov    $0x1,%eax
  98:	e8 00 00 00 00       	callq  9d <main+0x9d>
  9d:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%rbp)
  a4:	c7 45 e4 04 00 00 00 	movl   $0x4,-0x1c(%rbp)
  ab:	c7 45 e8 0a 00 00 00 	movl   $0xa,-0x18(%rbp)
  b2:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%rbp)
  b9:	c7 45 f0 06 00 00 00 	movl   $0x6,-0x10(%rbp)
  c0:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%rbp)
  c7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  ca:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  ce:	89 d6                	mov    %edx,%esi
  d0:	48 89 c7             	mov    %rax,%rdi
  d3:	e8 00 00 00 00       	callq  d8 <main+0xd8>
  d8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  db:	83 e8 01             	sub    $0x1,%eax
  de:	89 45 d8             	mov    %eax,-0x28(%rbp)
  e1:	8b 45 d8             	mov    -0x28(%rbp),%eax
  e4:	8d 50 ff             	lea    -0x1(%rax),%edx
  e7:	89 55 d8             	mov    %edx,-0x28(%rbp)
  ea:	48 98                	cltq   
  ec:	8b 44 85 e0          	mov    -0x20(%rbp,%rax,4),%eax
  f0:	89 c6                	mov    %eax,%esi
  f2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # f9 <main+0xf9>
  f9:	b8 00 00 00 00       	mov    $0x0,%eax
  fe:	e8 00 00 00 00       	callq  103 <main+0x103>
 103:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
 107:	78 02                	js     10b <main+0x10b>
 109:	eb d6                	jmp    e1 <main+0xe1>
 10b:	90                   	nop
 10c:	b8 00 00 00 00       	mov    $0x0,%eax
 111:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 115:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 11c:	00 00 
 11e:	74 05                	je     125 <main+0x125>
 120:	e8 00 00 00 00       	callq  125 <main+0x125>
 125:	c9                   	leaveq 
 126:	c3                   	retq   

0000000000000127 <sort>:
 127:	55                   	push   %rbp
 128:	48 89 e5             	mov    %rsp,%rbp
 12b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 12f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
 132:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
 139:	e9 be 00 00 00       	jmpq   1fc <sort+0xd5>
 13e:	8b 45 f0             	mov    -0x10(%rbp),%eax
 141:	89 45 f4             	mov    %eax,-0xc(%rbp)
 144:	8b 45 f0             	mov    -0x10(%rbp),%eax
 147:	83 c0 01             	add    $0x1,%eax
 14a:	89 45 f8             	mov    %eax,-0x8(%rbp)
 14d:	eb 3a                	jmp    189 <sort+0x62>
 14f:	8b 45 f4             	mov    -0xc(%rbp),%eax
 152:	48 98                	cltq   
 154:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 15b:	00 
 15c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 160:	48 01 d0             	add    %rdx,%rax
 163:	8b 10                	mov    (%rax),%edx
 165:	8b 45 f8             	mov    -0x8(%rbp),%eax
 168:	48 98                	cltq   
 16a:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
 171:	00 
 172:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 176:	48 01 c8             	add    %rcx,%rax
 179:	8b 00                	mov    (%rax),%eax
 17b:	39 c2                	cmp    %eax,%edx
 17d:	7e 06                	jle    185 <sort+0x5e>
 17f:	8b 45 f8             	mov    -0x8(%rbp),%eax
 182:	89 45 f4             	mov    %eax,-0xc(%rbp)
 185:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
 189:	8b 45 f8             	mov    -0x8(%rbp),%eax
 18c:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 18f:	7c be                	jl     14f <sort+0x28>
 191:	8b 45 f4             	mov    -0xc(%rbp),%eax
 194:	3b 45 f0             	cmp    -0x10(%rbp),%eax
 197:	74 5f                	je     1f8 <sort+0xd1>
 199:	8b 45 f0             	mov    -0x10(%rbp),%eax
 19c:	48 98                	cltq   
 19e:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 1a5:	00 
 1a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1aa:	48 01 d0             	add    %rdx,%rax
 1ad:	8b 00                	mov    (%rax),%eax
 1af:	89 45 fc             	mov    %eax,-0x4(%rbp)
 1b2:	8b 45 f4             	mov    -0xc(%rbp),%eax
 1b5:	48 98                	cltq   
 1b7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 1be:	00 
 1bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1c3:	48 01 d0             	add    %rdx,%rax
 1c6:	8b 55 f0             	mov    -0x10(%rbp),%edx
 1c9:	48 63 d2             	movslq %edx,%rdx
 1cc:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
 1d3:	00 
 1d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 1d8:	48 01 ca             	add    %rcx,%rdx
 1db:	8b 00                	mov    (%rax),%eax
 1dd:	89 02                	mov    %eax,(%rdx)
 1df:	8b 45 f4             	mov    -0xc(%rbp),%eax
 1e2:	48 98                	cltq   
 1e4:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
 1eb:	00 
 1ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 1f0:	48 01 c2             	add    %rax,%rdx
 1f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
 1f6:	89 02                	mov    %eax,(%rdx)
 1f8:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
 1fc:	8b 45 f0             	mov    -0x10(%rbp),%eax
 1ff:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
 202:	0f 8c 36 ff ff ff    	jl     13e <sort+0x17>
 208:	90                   	nop
 209:	5d                   	pop    %rbp
 20a:	c3                   	retq   
