#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp"
#pragma line 1 "<built-in>"
#pragma line 1 "<command-line>"
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp"
#pragma line 49 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp"
#pragma line 1 "/usr/include/stdlib.h" 1 3 4
#pragma line 25 "/usr/include/stdlib.h" 3 4
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/features.h" 1 3 4
#pragma line 339 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/features.h" 3 4
#pragma line 1 "/usr/include/sys/cdefs.h" 1 3 4
#pragma line 373 "/usr/include/sys/cdefs.h" 3 4
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 374 "/usr/include/sys/cdefs.h" 2 3 4
#pragma line 340 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/features.h" 2 3 4
#pragma line 362 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/features.h" 3 4
#pragma line 1 "/usr/include/gnu/stubs.h" 1 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 5 "/usr/include/gnu/stubs.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/gnu/stubs-64.h" 1 3 4
#pragma line 10 "/usr/include/gnu/stubs.h" 2 3 4
#pragma line 363 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/features.h" 2 3 4
#pragma line 26 "/usr/include/stdlib.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 212 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 3 4
typedef long unsigned int size_t;
#pragma line 34 "/usr/include/stdlib.h" 2 3 4
#pragma empty_line
extern "C" {
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/waitflags.h" 1 3 4
#pragma line 43 "/usr/include/stdlib.h" 2 3 4
#pragma line 1 "/usr/include/bits/waitstatus.h" 1 3 4
#pragma line 65 "/usr/include/bits/waitstatus.h" 3 4
#pragma line 1 "/usr/include/endian.h" 1 3 4
#pragma line 37 "/usr/include/endian.h" 3 4
#pragma line 1 "/usr/include/bits/endian.h" 1 3 4
#pragma line 38 "/usr/include/endian.h" 2 3 4
#pragma line 61 "/usr/include/endian.h" 3 4
#pragma line 1 "/usr/include/bits/byteswap.h" 1 3 4
#pragma line 28 "/usr/include/bits/byteswap.h" 3 4
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 29 "/usr/include/bits/byteswap.h" 2 3 4
#pragma line 62 "/usr/include/endian.h" 2 3 4
#pragma line 66 "/usr/include/bits/waitstatus.h" 2 3 4
#pragma empty_line
union wait
  {
    int w_status;
    struct
      {
#pragma empty_line
 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
      } __wait_terminated;
    struct
      {
#pragma empty_line
 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
      } __wait_stopped;
  };
#pragma line 44 "/usr/include/stdlib.h" 2 3 4
#pragma line 96 "/usr/include/stdlib.h" 3 4
#pragma empty_line
#pragma empty_line
typedef struct
  {
    int quot;
    int rem;
  } div_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
#pragma empty_line
#pragma empty_line
#pragma line 140 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double atof (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
extern int atoi (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
extern long int atol (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
__extension__ extern long long int atoll (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma line 236 "/usr/include/stdlib.h" 3 4
#pragma line 1 "/usr/include/xlocale.h" 1 3 4
#pragma line 28 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{
#pragma empty_line
  struct __locale_data *__locales[13];
#pragma empty_line
#pragma empty_line
  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;
#pragma empty_line
#pragma empty_line
  const char *__names[13];
} *__locale_t;
#pragma empty_line
#pragma empty_line
typedef __locale_t locale_t;
#pragma line 237 "/usr/include/stdlib.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int strtol_l (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) throw () __attribute__ ((__nonnull__ (1, 4))) ;
#pragma empty_line
extern unsigned long int strtoul_l (__const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4))) ;
#pragma empty_line
__extension__
extern long long int strtoll_l (__const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4))) ;
#pragma empty_line
__extension__
extern unsigned long long int strtoull_l (__const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4))) ;
#pragma empty_line
extern double strtod_l (__const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3))) ;
#pragma empty_line
extern float strtof_l (__const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3))) ;
#pragma empty_line
extern long double strtold_l (__const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3))) ;
#pragma line 311 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) throw () ;
#pragma empty_line
#pragma empty_line
extern long int a64l (__const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/sys/types.h" 1 3 4
#pragma line 28 "/usr/include/sys/types.h" 3 4
extern "C" {
#pragma empty_line
#pragma line 1 "/usr/include/bits/types.h" 1 3 4
#pragma line 28 "/usr/include/bits/types.h" 3 4
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 29 "/usr/include/bits/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
#pragma empty_line
#pragma empty_line
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
#pragma empty_line
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
#pragma line 131 "/usr/include/bits/types.h" 3 4
#pragma line 1 "/usr/include/bits/typesizes.h" 1 3 4
#pragma line 132 "/usr/include/bits/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
#pragma empty_line
typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;
#pragma empty_line
#pragma empty_line
typedef int __clockid_t;
#pragma empty_line
#pragma empty_line
typedef void * __timer_t;
#pragma empty_line
#pragma empty_line
typedef long int __blksize_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
#pragma empty_line
#pragma empty_line
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
#pragma empty_line
#pragma empty_line
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
#pragma empty_line
typedef long int __ssize_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;
#pragma empty_line
#pragma empty_line
typedef long int __intptr_t;
#pragma empty_line
#pragma empty_line
typedef unsigned int __socklen_t;
#pragma line 31 "/usr/include/sys/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __loff_t loff_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __ino_t ino_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __ino64_t ino64_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __dev_t dev_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __gid_t gid_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __mode_t mode_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __nlink_t nlink_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __uid_t uid_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __off_t off_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __off64_t off64_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __pid_t pid_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __id_t id_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __ssize_t ssize_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __key_t key_t;
#pragma line 133 "/usr/include/sys/types.h" 3 4
#pragma line 1 "/usr/include/time.h" 1 3 4
#pragma line 58 "/usr/include/time.h" 3 4
#pragma empty_line
#pragma empty_line
typedef __clock_t clock_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 74 "/usr/include/time.h" 3 4
#pragma empty_line
#pragma empty_line
typedef __time_t time_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 92 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
#pragma line 104 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
#pragma line 134 "/usr/include/sys/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __useconds_t useconds_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __suseconds_t suseconds_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 148 "/usr/include/sys/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
#pragma line 195 "/usr/include/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));
#pragma empty_line
#pragma empty_line
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));
#pragma empty_line
typedef int register_t __attribute__ ((__mode__ (__word__)));
#pragma line 220 "/usr/include/sys/types.h" 3 4
#pragma line 1 "/usr/include/sys/select.h" 1 3 4
#pragma line 31 "/usr/include/sys/select.h" 3 4
#pragma line 1 "/usr/include/bits/select.h" 1 3 4
#pragma line 23 "/usr/include/bits/select.h" 3 4
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 24 "/usr/include/bits/select.h" 2 3 4
#pragma line 32 "/usr/include/sys/select.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/sigset.h" 1 3 4
#pragma line 24 "/usr/include/bits/sigset.h" 3 4
typedef int __sig_atomic_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
#pragma line 35 "/usr/include/sys/select.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __sigset_t sigset_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/time.h" 1 3 4
#pragma line 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
#pragma line 45 "/usr/include/sys/select.h" 2 3 4
#pragma empty_line
#pragma line 1 "/usr/include/bits/time.h" 1 3 4
#pragma line 75 "/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
#pragma line 47 "/usr/include/sys/select.h" 2 3 4
#pragma line 55 "/usr/include/sys/select.h" 3 4
typedef long int __fd_mask;
#pragma line 67 "/usr/include/sys/select.h" 3 4
typedef struct
  {
#pragma empty_line
#pragma empty_line
#pragma empty_line
    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
  } fd_set;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __fd_mask fd_mask;
#pragma line 99 "/usr/include/sys/select.h" 3 4
extern "C" {
#pragma line 109 "/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
#pragma line 121 "/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
#pragma empty_line
#pragma empty_line
}
#pragma line 221 "/usr/include/sys/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/sys/sysmacros.h" 1 3 4
#pragma line 38 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/sys/sysmacros.h" 3 4
__extension__
extern __inline __attribute__ ((__gnu_inline__)) unsigned int gnu_dev_major (unsigned long long int __dev)
     throw ();
__extension__
extern __inline __attribute__ ((__gnu_inline__)) unsigned int gnu_dev_minor (unsigned long long int __dev)
     throw ();
__extension__
extern __inline __attribute__ ((__gnu_inline__)) unsigned long long int gnu_dev_makedev (unsigned int __major,
       unsigned int __minor)
     throw ();
#pragma empty_line
#pragma empty_line
__extension__ extern __inline __attribute__ ((__gnu_inline__)) unsigned int
gnu_dev_major (unsigned long long int __dev) throw ()
{
  return ((__dev >> 8) & 0xfff) | ((unsigned int) (__dev >> 32) & ~0xfff);
}
#pragma empty_line
__extension__ extern __inline __attribute__ ((__gnu_inline__)) unsigned int
gnu_dev_minor (unsigned long long int __dev) throw ()
{
  return (__dev & 0xff) | ((unsigned int) (__dev >> 12) & ~0xff);
}
#pragma empty_line
__extension__ extern __inline __attribute__ ((__gnu_inline__)) unsigned long long int
gnu_dev_makedev (unsigned int __major, unsigned int __minor) throw ()
{
  return ((__minor & 0xff) | ((__major & 0xfff) << 8)
   | (((unsigned long long int) (__minor & ~0xff)) << 12)
   | (((unsigned long long int) (__major & ~0xfff)) << 32));
}
#pragma line 224 "/usr/include/sys/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __blksize_t blksize_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __blkcnt_t blkcnt_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __fsblkcnt_t fsblkcnt_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __fsfilcnt_t fsfilcnt_t;
#pragma line 263 "/usr/include/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/pthreadtypes.h" 1 3 4
#pragma line 23 "/usr/include/bits/pthreadtypes.h" 3 4
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 24 "/usr/include/bits/pthreadtypes.h" 2 3 4
#pragma line 50 "/usr/include/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;
#pragma empty_line
#pragma empty_line
typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
#pragma line 76 "/usr/include/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;
#pragma empty_line
    unsigned int __nusers;
#pragma empty_line
#pragma empty_line
#pragma empty_line
    int __kind;
#pragma empty_line
    int __spins;
    __pthread_list_t __list;
#pragma line 101 "/usr/include/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;
#pragma empty_line
typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;
#pragma empty_line
typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef unsigned int pthread_key_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef int pthread_once_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef union
{
#pragma empty_line
  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;
#pragma empty_line
#pragma empty_line
    unsigned int __flags;
  } __data;
#pragma line 187 "/usr/include/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;
#pragma empty_line
typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef volatile int pthread_spinlock_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;
#pragma empty_line
typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
#pragma line 272 "/usr/include/sys/types.h" 2 3 4
#pragma empty_line
#pragma empty_line
}
#pragma line 321 "/usr/include/stdlib.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int random (void) throw ();
#pragma empty_line
#pragma empty_line
extern void srandom (unsigned int __seed) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *setstate (char *__statebuf) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };
#pragma empty_line
extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (2, 4)));
#pragma empty_line
extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int rand (void) throw ();
#pragma empty_line
extern void srand (unsigned int __seed) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int rand_r (unsigned int *__seed) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double drand48 (void) throw ();
extern double erand48 (unsigned short int __xsubi[3]) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
extern long int lrand48 (void) throw ();
extern long int nrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
extern long int mrand48 (void) throw ();
extern long int jrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
extern void srand48 (long int __seedval) throw ();
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     throw () __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };
#pragma empty_line
#pragma empty_line
extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *malloc (size_t __size) throw () __attribute__ ((__malloc__)) ;
#pragma empty_line
extern void *calloc (size_t __nmemb, size_t __size)
     throw () __attribute__ ((__malloc__)) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *realloc (void *__ptr, size_t __size)
     throw () __attribute__ ((__warn_unused_result__));
#pragma empty_line
extern void free (void *__ptr) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void cfree (void *__ptr) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/alloca.h" 1 3 4
#pragma line 25 "/usr/include/alloca.h" 3 4
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 26 "/usr/include/alloca.h" 2 3 4
#pragma empty_line
extern "C" {
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *alloca (size_t __size) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
}
#pragma line 498 "/usr/include/stdlib.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *valloc (size_t __size) throw () __attribute__ ((__malloc__)) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void abort (void) throw () __attribute__ ((__noreturn__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int atexit (void (*__func) (void)) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++" int at_quick_exit (void (*__func) (void))
     throw () __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void exit (int __status) throw () __attribute__ ((__noreturn__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void quick_exit (int __status) throw () __attribute__ ((__noreturn__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void _Exit (int __status) throw () __attribute__ ((__noreturn__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *getenv (__const char *__name) throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *__secure_getenv (__const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int putenv (char *__string) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int setenv (__const char *__name, __const char *__value, int __replace)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
#pragma empty_line
extern int unsetenv (__const char *__name) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int clearenv (void) throw ();
#pragma line 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
#pragma line 620 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
#pragma line 630 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
#pragma line 642 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
#pragma line 652 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
#pragma line 663 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
#pragma line 674 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
#pragma line 684 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
#pragma line 694 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
#pragma line 706 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int system (__const char *__command) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *canonicalize_file_name (__const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;
#pragma line 734 "/usr/include/stdlib.h" 3 4
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef int (*__compar_fn_t) (__const void *, __const void *);
#pragma empty_line
#pragma empty_line
typedef __compar_fn_t comparison_fn_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef int (*__compar_d_fn_t) (__const void *, __const void *, void *);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
#pragma empty_line
extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int abs (int __x) throw () __attribute__ ((__const__)) ;
extern long int labs (long int __x) throw () __attribute__ ((__const__)) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
__extension__ extern long long int llabs (long long int __x)
     throw () __attribute__ ((__const__)) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern div_t div (int __numer, int __denom)
     throw () __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     throw () __attribute__ ((__const__)) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     throw () __attribute__ ((__const__)) ;
#pragma empty_line
#pragma line 808 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *gcvt (double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));
#pragma empty_line
extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int mblen (__const char *__s, size_t __n) throw () ;
#pragma empty_line
#pragma empty_line
extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) throw () ;
#pragma empty_line
#pragma empty_line
extern int wctomb (char *__s, wchar_t __wchar) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) throw ();
#pragma empty_line
extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int rpmatch (__const char *__response) throw () __attribute__ ((__nonnull__ (1))) ;
#pragma line 896 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *__const *__restrict __tokens,
        char **__restrict __valuep)
     throw () __attribute__ ((__nonnull__ (1, 2, 3))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void setkey (__const char *__key) throw () __attribute__ ((__nonnull__ (1)));
#pragma line 921 "/usr/include/stdlib.h" 3 4
extern int grantpt (int __fd) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int unlockpt (int __fd) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *ptsname (int __fd) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
#pragma empty_line
extern int getpt (void);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int getloadavg (double __loadavg[], int __nelem)
     throw () __attribute__ ((__nonnull__ (1)));
#pragma line 964 "/usr/include/stdlib.h" 3 4
}
#pragma line 50 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma line 1 "/usr/include/stdio.h" 1 3 4
#pragma line 30 "/usr/include/stdio.h" 3 4
extern "C" {
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 35 "/usr/include/stdio.h" 2 3 4
#pragma line 45 "/usr/include/stdio.h" 3 4
struct _IO_FILE;
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef struct _IO_FILE FILE;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 65 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
#pragma line 75 "/usr/include/stdio.h" 3 4
#pragma line 1 "/usr/include/libio.h" 1 3 4
#pragma line 32 "/usr/include/libio.h" 3 4
#pragma line 1 "/usr/include/_G_config.h" 1 3 4
#pragma line 15 "/usr/include/_G_config.h" 3 4
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 16 "/usr/include/_G_config.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/wchar.h" 1 3 4
#pragma line 57 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/wchar.h" 3 4
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 353 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 3 4
typedef unsigned int wint_t;
#pragma line 58 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/wchar.h" 2 3 4
#pragma empty_line
#pragma line 1 "/usr/include/bits/wchar.h" 1 3 4
#pragma line 60 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/wchar.h" 2 3 4
#pragma line 85 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
#pragma line 21 "/usr/include/_G_config.h" 2 3 4
#pragma empty_line
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
#pragma line 53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
#pragma line 33 "/usr/include/libio.h" 2 3 4
#pragma line 53 "/usr/include/libio.h" 3 4
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stdarg.h" 1 3 4
#pragma line 40 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
#pragma line 54 "/usr/include/libio.h" 2 3 4
#pragma line 170 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
#pragma line 180 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;
#pragma empty_line
#pragma empty_line
#pragma empty_line
  int _pos;
#pragma line 203 "/usr/include/libio.h" 3 4
};
#pragma empty_line
#pragma empty_line
enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
#pragma line 271 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;
#pragma empty_line
  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;
#pragma empty_line
  struct _IO_marker *_markers;
#pragma empty_line
  struct _IO_FILE *_chain;
#pragma empty_line
  int _fileno;
#pragma empty_line
#pragma empty_line
#pragma empty_line
  int _flags2;
#pragma empty_line
  __off_t _old_offset;
#pragma empty_line
#pragma empty_line
#pragma empty_line
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];
#pragma empty_line
#pragma empty_line
#pragma empty_line
  _IO_lock_t *_lock;
#pragma line 319 "/usr/include/libio.h" 3 4
  __off64_t _offset;
#pragma line 328 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;
#pragma empty_line
  int _mode;
#pragma empty_line
  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
#pragma empty_line
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct _IO_FILE_plus;
#pragma empty_line
extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
#pragma line 364 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);
#pragma empty_line
#pragma empty_line
typedef int __io_close_fn (void *__cookie);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;
#pragma empty_line
#pragma empty_line
typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;
#pragma empty_line
struct _IO_cookie_file;
#pragma empty_line
#pragma empty_line
extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C" {
#pragma empty_line
#pragma empty_line
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
#pragma line 460 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) throw ();
extern int _IO_ferror (_IO_FILE *__fp) throw ();
#pragma empty_line
extern int _IO_peekc_locked (_IO_FILE *__fp);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void _IO_flockfile (_IO_FILE *) throw ();
extern void _IO_funlockfile (_IO_FILE *) throw ();
extern int _IO_ftrylockfile (_IO_FILE *) throw ();
#pragma line 490 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);
#pragma empty_line
extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);
#pragma empty_line
extern void _IO_free_backup_area (_IO_FILE *) throw ();
#pragma line 552 "/usr/include/libio.h" 3 4
}
#pragma line 76 "/usr/include/stdio.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef __gnuc_va_list va_list;
#pragma line 109 "/usr/include/stdio.h" 3 4
#pragma empty_line
#pragma empty_line
typedef _G_fpos_t fpos_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef _G_fpos64_t fpos64_t;
#pragma line 161 "/usr/include/stdio.h" 3 4
#pragma line 1 "/usr/include/bits/stdio_lim.h" 1 3 4
#pragma line 162 "/usr/include/stdio.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int remove (__const char *__filename) throw ();
#pragma empty_line
extern int rename (__const char *__old, __const char *__new) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *tmpfile (void) ;
#pragma line 204 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *tmpnam (char *__s) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *tmpnam_r (char *__s) throw () ;
#pragma line 226 "/usr/include/stdio.h" 3 4
extern char *tempnam (__const char *__dir, __const char *__pfx)
     throw () __attribute__ ((__malloc__)) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fclose (FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fflush (FILE *__stream);
#pragma empty_line
#pragma line 251 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
#pragma line 261 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) ;
#pragma line 294 "/usr/include/stdio.h" 3 4
#pragma empty_line
#pragma empty_line
extern FILE *fopen64 (__const char *__restrict __filename,
        __const char *__restrict __modes) ;
extern FILE *freopen64 (__const char *__restrict __filename,
   __const char *__restrict __modes,
   FILE *__restrict __stream) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *fdopen (int __fd, __const char *__modes) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *fopencookie (void *__restrict __magic_cookie,
     __const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes)
  throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) throw ();
#pragma empty_line
#pragma empty_line
extern void setlinebuf (FILE *__stream) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int printf (__const char *__restrict __format, ...);
#pragma empty_line
extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);
#pragma empty_line
extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 3, 4)));
#pragma empty_line
extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 3, 0)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int vasprintf (char **__restrict __ptr, __const char *__restrict __f,
        __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         __const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       __const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
#pragma line 416 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int scanf (__const char *__restrict __format, ...) ;
#pragma empty_line
extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) throw ();
#pragma line 467 "/usr/include/stdio.h" 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
#pragma empty_line
#pragma empty_line
extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__scanf__, 2, 0)));
#pragma line 526 "/usr/include/stdio.h" 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int getchar (void);
#pragma empty_line
#pragma line 554 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
#pragma line 565 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int putchar (int __c);
#pragma empty_line
#pragma line 598 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int getw (FILE *__stream);
#pragma empty_line
#pragma empty_line
extern int putw (int __w, FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *gets (char *__s) ;
#pragma empty_line
#pragma line 644 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
#pragma line 660 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int puts (__const char *__s);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ungetc (int __c, FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;
#pragma empty_line
#pragma line 721 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (__const char *__restrict __s,
      FILE *__restrict __stream);
#pragma line 732 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fseek (FILE *__stream, long int __off, int __whence);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int ftell (FILE *__stream) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void rewind (FILE *__stream);
#pragma empty_line
#pragma line 768 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern __off_t ftello (FILE *__stream) ;
#pragma line 787 "/usr/include/stdio.h" 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
#pragma line 810 "/usr/include/stdio.h" 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, __const fpos64_t *__pos);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void clearerr (FILE *__stream) throw ();
#pragma empty_line
extern int feof (FILE *__stream) throw () ;
#pragma empty_line
extern int ferror (FILE *__stream) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void clearerr_unlocked (FILE *__stream) throw ();
extern int feof_unlocked (FILE *__stream) throw () ;
extern int ferror_unlocked (FILE *__stream) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void perror (__const char *__s);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/sys_errlist.h" 1 3 4
#pragma line 27 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern __const char *__const sys_errlist[];
#pragma empty_line
#pragma empty_line
extern int _sys_nerr;
extern __const char *__const _sys_errlist[];
#pragma line 849 "/usr/include/stdio.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fileno (FILE *__stream) throw () ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int fileno_unlocked (FILE *__stream) throw () ;
#pragma line 868 "/usr/include/stdio.h" 3 4
extern FILE *popen (__const char *__command, __const char *__modes) ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int pclose (FILE *__stream);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *ctermid (char *__s) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *cuserid (char *__s);
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct obstack;
#pragma empty_line
#pragma empty_line
extern int obstack_printf (struct obstack *__restrict __obstack,
      __const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       __const char *__restrict __format,
       __gnuc_va_list __args)
     throw () __attribute__ ((__format__ (__printf__, 2, 0)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void flockfile (FILE *__stream) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ftrylockfile (FILE *__stream) throw () ;
#pragma empty_line
#pragma empty_line
extern void funlockfile (FILE *__stream) throw ();
#pragma line 938 "/usr/include/stdio.h" 3 4
}
#pragma line 51 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma line 1 "/usr/include/string.h" 1 3 4
#pragma line 29 "/usr/include/string.h" 3 4
extern "C" {
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 35 "/usr/include/string.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern void *memmove (void *__dest, __const void *__src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *memset (void *__s, int __c, size_t __n) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const void *memchr (__const void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma line 93 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++" void *rawmemchr (void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" __const void *rawmemchr (__const void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" __const void *memrchr (__const void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern int strcmp (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern int strcoll (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
#pragma line 165 "/usr/include/string.h" 3 4
extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
#pragma empty_line
extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) throw () __attribute__ ((__nonnull__ (2, 4)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strdup (__const char *__s)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strndup (__const char *__string, size_t __n)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
#pragma line 210 "/usr/include/string.h" 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern char *strchr (char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *strchr (__const char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma line 233 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern char *strrchr (char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *strrchr (__const char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma line 260 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++" char *strchrnul (char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" __const char *strchrnul (__const char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern size_t strcspn (__const char *__s, __const char *__reject)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern size_t strspn (__const char *__s, __const char *__accept)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern char *strpbrk (char *__s, __const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern __const char *strpbrk (__const char *__s, __const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma line 312 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern char *strstr (char *__haystack, __const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern __const char *strstr (__const char *__haystack,
        __const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma line 340 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));
#pragma empty_line
extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++" char *strcasestr (char *__haystack, __const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" __const char *strcasestr (__const char *__haystack,
           __const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma line 382 "/usr/include/string.h" 3 4
extern void *memmem (__const void *__haystack, size_t __haystacklen,
       __const void *__needle, size_t __needlelen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void *__mempcpy (void *__restrict __dest,
   __const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        __const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern size_t strlen (__const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern size_t strnlen (__const char *__string, size_t __maxlen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strerror (int __errnum) throw ();
#pragma empty_line
#pragma line 438 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strerror_l (int __errnum, __locale_t __l) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void __bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void bcopy (__const void *__src, void *__dest, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern void bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern char *index (char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *index (__const char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma line 487 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++"
{
extern char *rindex (char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *rindex (__const char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
#pragma line 515 "/usr/include/string.h" 3 4
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ffs (int __i) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ffsl (long int __l) throw () __attribute__ ((__const__));
#pragma empty_line
__extension__ extern int ffsll (long long int __ll)
     throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int strcasecmp (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int strcasecmp_l (__const char *__s1, __const char *__s2,
    __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
#pragma empty_line
extern int strncasecmp_l (__const char *__s1, __const char *__s2,
     size_t __n, __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *strsignal (int __sig) throw ();
#pragma empty_line
#pragma empty_line
extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int strverscmp (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
#pragma empty_line
#pragma empty_line
extern char *strfry (char *__string) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
extern void *memfrob (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern "C++" char *basename (char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" __const char *basename (__const char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
#pragma line 646 "/usr/include/string.h" 3 4
}
#pragma line 52 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma line 1 "/usr/include/math.h" 1 3 4
#pragma line 30 "/usr/include/math.h" 3 4
extern "C" {
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/huge_val.h" 1 3 4
#pragma line 35 "/usr/include/math.h" 2 3 4
#pragma empty_line
#pragma line 1 "/usr/include/bits/huge_valf.h" 1 3 4
#pragma line 37 "/usr/include/math.h" 2 3 4
#pragma line 1 "/usr/include/bits/huge_vall.h" 1 3 4
#pragma line 38 "/usr/include/math.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/inf.h" 1 3 4
#pragma line 41 "/usr/include/math.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/nan.h" 1 3 4
#pragma line 44 "/usr/include/math.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/mathdef.h" 1 3 4
#pragma line 26 "/usr/include/bits/mathdef.h" 3 4
#pragma line 1 "/usr/include/bits/wordsize.h" 1 3 4
#pragma line 27 "/usr/include/bits/mathdef.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef float float_t;
typedef double double_t;
#pragma line 48 "/usr/include/math.h" 2 3 4
#pragma line 71 "/usr/include/math.h" 3 4
#pragma line 1 "/usr/include/bits/mathcalls.h" 1 3 4
#pragma line 53 "/usr/include/bits/mathcalls.h" 3 4
#pragma empty_line
#pragma empty_line
extern double acos (double __x) throw (); extern double __acos (double __x) throw ();
#pragma empty_line
extern double asin (double __x) throw (); extern double __asin (double __x) throw ();
#pragma empty_line
extern double atan (double __x) throw (); extern double __atan (double __x) throw ();
#pragma empty_line
extern double atan2 (double __y, double __x) throw (); extern double __atan2 (double __y, double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double cos (double __x) throw (); extern double __cos (double __x) throw ();
#pragma empty_line
extern double sin (double __x) throw (); extern double __sin (double __x) throw ();
#pragma empty_line
extern double tan (double __x) throw (); extern double __tan (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double cosh (double __x) throw (); extern double __cosh (double __x) throw ();
#pragma empty_line
extern double sinh (double __x) throw (); extern double __sinh (double __x) throw ();
#pragma empty_line
extern double tanh (double __x) throw (); extern double __tanh (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void sincos (double __x, double *__sinx, double *__cosx) throw (); extern void __sincos (double __x, double *__sinx, double *__cosx) throw ()
                                                           ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double acosh (double __x) throw (); extern double __acosh (double __x) throw ();
#pragma empty_line
extern double asinh (double __x) throw (); extern double __asinh (double __x) throw ();
#pragma empty_line
extern double atanh (double __x) throw (); extern double __atanh (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double exp (double __x) throw (); extern double __exp (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double frexp (double __x, int *__exponent) throw (); extern double __frexp (double __x, int *__exponent) throw ();
#pragma empty_line
#pragma empty_line
extern double ldexp (double __x, int __exponent) throw (); extern double __ldexp (double __x, int __exponent) throw ();
#pragma empty_line
#pragma empty_line
extern double log (double __x) throw (); extern double __log (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double log10 (double __x) throw (); extern double __log10 (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double modf (double __x, double *__iptr) throw (); extern double __modf (double __x, double *__iptr) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double exp10 (double __x) throw (); extern double __exp10 (double __x) throw ();
#pragma empty_line
extern double pow10 (double __x) throw (); extern double __pow10 (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double expm1 (double __x) throw (); extern double __expm1 (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double log1p (double __x) throw (); extern double __log1p (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double logb (double __x) throw (); extern double __logb (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double exp2 (double __x) throw (); extern double __exp2 (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double log2 (double __x) throw (); extern double __log2 (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double pow (double __x, double __y) throw (); extern double __pow (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
extern double sqrt (double __x) throw (); extern double __sqrt (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double hypot (double __x, double __y) throw (); extern double __hypot (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double cbrt (double __x) throw (); extern double __cbrt (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double ceil (double __x) throw () __attribute__ ((__const__)); extern double __ceil (double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern double fabs (double __x) throw () __attribute__ ((__const__)); extern double __fabs (double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern double floor (double __x) throw () __attribute__ ((__const__)); extern double __floor (double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern double fmod (double __x, double __y) throw (); extern double __fmod (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __isinf (double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int __finite (double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int isinf (double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int finite (double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern double drem (double __x, double __y) throw (); extern double __drem (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double significand (double __x) throw (); extern double __significand (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double copysign (double __x, double __y) throw () __attribute__ ((__const__)); extern double __copysign (double __x, double __y) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double nan (__const char *__tagb) throw () __attribute__ ((__const__)); extern double __nan (__const char *__tagb) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __isnan (double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int isnan (double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern double j0 (double) throw (); extern double __j0 (double) throw ();
extern double j1 (double) throw (); extern double __j1 (double) throw ();
extern double jn (int, double) throw (); extern double __jn (int, double) throw ();
extern double y0 (double) throw (); extern double __y0 (double) throw ();
extern double y1 (double) throw (); extern double __y1 (double) throw ();
extern double yn (int, double) throw (); extern double __yn (int, double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double erf (double) throw (); extern double __erf (double) throw ();
extern double erfc (double) throw (); extern double __erfc (double) throw ();
extern double lgamma (double) throw (); extern double __lgamma (double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double tgamma (double) throw (); extern double __tgamma (double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double gamma (double) throw (); extern double __gamma (double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double lgamma_r (double, int *__signgamp) throw (); extern double __lgamma_r (double, int *__signgamp) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double rint (double __x) throw (); extern double __rint (double __x) throw ();
#pragma empty_line
#pragma empty_line
extern double nextafter (double __x, double __y) throw () __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) throw () __attribute__ ((__const__));
#pragma empty_line
extern double nexttoward (double __x, long double __y) throw () __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double remainder (double __x, double __y) throw (); extern double __remainder (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double scalbn (double __x, int __n) throw (); extern double __scalbn (double __x, int __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ilogb (double __x) throw (); extern int __ilogb (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double scalbln (double __x, long int __n) throw (); extern double __scalbln (double __x, long int __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double nearbyint (double __x) throw (); extern double __nearbyint (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double round (double __x) throw () __attribute__ ((__const__)); extern double __round (double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double trunc (double __x) throw () __attribute__ ((__const__)); extern double __trunc (double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double remquo (double __x, double __y, int *__quo) throw (); extern double __remquo (double __x, double __y, int *__quo) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int lrint (double __x) throw (); extern long int __lrint (double __x) throw ();
extern long long int llrint (double __x) throw (); extern long long int __llrint (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int lround (double __x) throw (); extern long int __lround (double __x) throw ();
extern long long int llround (double __x) throw (); extern long long int __llround (double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double fdim (double __x, double __y) throw (); extern double __fdim (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
extern double fmax (double __x, double __y) throw (); extern double __fmax (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
extern double fmin (double __x, double __y) throw (); extern double __fmin (double __x, double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __fpclassify (double __value) throw ()
     __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int __signbit (double __value) throw ()
     __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double fma (double __x, double __y, double __z) throw (); extern double __fma (double __x, double __y, double __z) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern double scalb (double __x, double __n) throw (); extern double __scalb (double __x, double __n) throw ();
#pragma line 72 "/usr/include/math.h" 2 3 4
#pragma line 94 "/usr/include/math.h" 3 4
#pragma line 1 "/usr/include/bits/mathcalls.h" 1 3 4
#pragma line 53 "/usr/include/bits/mathcalls.h" 3 4
#pragma empty_line
#pragma empty_line
extern float acosf (float __x) throw (); extern float __acosf (float __x) throw ();
#pragma empty_line
extern float asinf (float __x) throw (); extern float __asinf (float __x) throw ();
#pragma empty_line
extern float atanf (float __x) throw (); extern float __atanf (float __x) throw ();
#pragma empty_line
extern float atan2f (float __y, float __x) throw (); extern float __atan2f (float __y, float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float cosf (float __x) throw (); extern float __cosf (float __x) throw ();
#pragma empty_line
extern float sinf (float __x) throw (); extern float __sinf (float __x) throw ();
#pragma empty_line
extern float tanf (float __x) throw (); extern float __tanf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float coshf (float __x) throw (); extern float __coshf (float __x) throw ();
#pragma empty_line
extern float sinhf (float __x) throw (); extern float __sinhf (float __x) throw ();
#pragma empty_line
extern float tanhf (float __x) throw (); extern float __tanhf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void
 sincosf
#pragma line 82 "/usr/include/bits/mathcalls.h" 3 4
 (float __x, float *__sinx, float *__cosx) throw (); extern void
 __sincosf
#pragma line 82 "/usr/include/bits/mathcalls.h" 3 4
 (float __x, float *__sinx, float *__cosx) throw ()
                                                           ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float acoshf (float __x) throw (); extern float __acoshf (float __x) throw ();
#pragma empty_line
extern float asinhf (float __x) throw (); extern float __asinhf (float __x) throw ();
#pragma empty_line
extern float atanhf (float __x) throw (); extern float __atanhf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float expf (float __x) throw (); extern float __expf (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float frexpf (float __x, int *__exponent) throw (); extern float __frexpf (float __x, int *__exponent) throw ();
#pragma empty_line
#pragma empty_line
extern float ldexpf (float __x, int __exponent) throw (); extern float __ldexpf (float __x, int __exponent) throw ();
#pragma empty_line
#pragma empty_line
extern float logf (float __x) throw (); extern float __logf (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float log10f (float __x) throw (); extern float __log10f (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float modff (float __x, float *__iptr) throw (); extern float __modff (float __x, float *__iptr) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float exp10f (float __x) throw (); extern float __exp10f (float __x) throw ();
#pragma empty_line
extern float pow10f (float __x) throw (); extern float __pow10f (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float expm1f (float __x) throw (); extern float __expm1f (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float log1pf (float __x) throw (); extern float __log1pf (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float logbf (float __x) throw (); extern float __logbf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float exp2f (float __x) throw (); extern float __exp2f (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float log2f (float __x) throw (); extern float __log2f (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float powf (float __x, float __y) throw (); extern float __powf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
extern float sqrtf (float __x) throw (); extern float __sqrtf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float hypotf (float __x, float __y) throw (); extern float __hypotf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float cbrtf (float __x) throw (); extern float __cbrtf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float ceilf (float __x) throw () __attribute__ ((__const__)); extern float __ceilf (float __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern float fabsf (float __x) throw () __attribute__ ((__const__)); extern float __fabsf (float __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern float floorf (float __x) throw () __attribute__ ((__const__)); extern float __floorf (float __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern float fmodf (float __x, float __y) throw (); extern float __fmodf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __isinff (float __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int __finitef (float __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int isinff (float __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int finitef (float __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern float dremf (float __x, float __y) throw (); extern float __dremf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float significandf (float __x) throw (); extern float __significandf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float copysignf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float nanf (__const char *__tagb) throw () __attribute__ ((__const__)); extern float __nanf (__const char *__tagb) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __isnanf (float __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int isnanf (float __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern float j0f (float) throw (); extern float __j0f (float) throw ();
extern float j1f (float) throw (); extern float __j1f (float) throw ();
extern float jnf (int, float) throw (); extern float __jnf (int, float) throw ();
extern float y0f (float) throw (); extern float __y0f (float) throw ();
extern float y1f (float) throw (); extern float __y1f (float) throw ();
extern float ynf (int, float) throw (); extern float __ynf (int, float) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float erff (float) throw (); extern float __erff (float) throw ();
extern float erfcf (float) throw (); extern float __erfcf (float) throw ();
extern float lgammaf (float) throw (); extern float __lgammaf (float) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float tgammaf (float) throw (); extern float __tgammaf (float) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float gammaf (float) throw (); extern float __gammaf (float) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float lgammaf_r (float, int *__signgamp) throw (); extern float __lgammaf_r (float, int *__signgamp) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float rintf (float __x) throw (); extern float __rintf (float __x) throw ();
#pragma empty_line
#pragma empty_line
extern float nextafterf (float __x, float __y) throw () __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) throw () __attribute__ ((__const__));
#pragma empty_line
extern float nexttowardf (float __x, long double __y) throw () __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float remainderf (float __x, float __y) throw (); extern float __remainderf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float scalbnf (float __x, int __n) throw (); extern float __scalbnf (float __x, int __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ilogbf (float __x) throw (); extern int __ilogbf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float scalblnf (float __x, long int __n) throw (); extern float __scalblnf (float __x, long int __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float nearbyintf (float __x) throw (); extern float __nearbyintf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float roundf (float __x) throw () __attribute__ ((__const__)); extern float __roundf (float __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float truncf (float __x) throw () __attribute__ ((__const__)); extern float __truncf (float __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float remquof (float __x, float __y, int *__quo) throw (); extern float __remquof (float __x, float __y, int *__quo) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int lrintf (float __x) throw (); extern long int __lrintf (float __x) throw ();
extern long long int llrintf (float __x) throw (); extern long long int __llrintf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int lroundf (float __x) throw (); extern long int __lroundf (float __x) throw ();
extern long long int llroundf (float __x) throw (); extern long long int __llroundf (float __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float fdimf (float __x, float __y) throw (); extern float __fdimf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
extern float fmaxf (float __x, float __y) throw (); extern float __fmaxf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
extern float fminf (float __x, float __y) throw (); extern float __fminf (float __x, float __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __fpclassifyf (float __value) throw ()
     __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int __signbitf (float __value) throw ()
     __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float fmaf (float __x, float __y, float __z) throw (); extern float __fmaf (float __x, float __y, float __z) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern float scalbf (float __x, float __n) throw (); extern float __scalbf (float __x, float __n) throw ();
#pragma line 95 "/usr/include/math.h" 2 3 4
#pragma line 141 "/usr/include/math.h" 3 4
#pragma line 1 "/usr/include/bits/mathcalls.h" 1 3 4
#pragma line 53 "/usr/include/bits/mathcalls.h" 3 4
#pragma empty_line
#pragma empty_line
extern long double acosl (long double __x) throw (); extern long double __acosl (long double __x) throw ();
#pragma empty_line
extern long double asinl (long double __x) throw (); extern long double __asinl (long double __x) throw ();
#pragma empty_line
extern long double atanl (long double __x) throw (); extern long double __atanl (long double __x) throw ();
#pragma empty_line
extern long double atan2l (long double __y, long double __x) throw (); extern long double __atan2l (long double __y, long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double cosl (long double __x) throw (); extern long double __cosl (long double __x) throw ();
#pragma empty_line
extern long double sinl (long double __x) throw (); extern long double __sinl (long double __x) throw ();
#pragma empty_line
extern long double tanl (long double __x) throw (); extern long double __tanl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double coshl (long double __x) throw (); extern long double __coshl (long double __x) throw ();
#pragma empty_line
extern long double sinhl (long double __x) throw (); extern long double __sinhl (long double __x) throw ();
#pragma empty_line
extern long double tanhl (long double __x) throw (); extern long double __tanhl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern void
 sincosl
#pragma line 82 "/usr/include/bits/mathcalls.h" 3 4
 (long double __x, long double *__sinx, long double *__cosx) throw (); extern void
 __sincosl
#pragma line 82 "/usr/include/bits/mathcalls.h" 3 4
 (long double __x, long double *__sinx, long double *__cosx) throw ()
                                                           ;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double acoshl (long double __x) throw (); extern long double __acoshl (long double __x) throw ();
#pragma empty_line
extern long double asinhl (long double __x) throw (); extern long double __asinhl (long double __x) throw ();
#pragma empty_line
extern long double atanhl (long double __x) throw (); extern long double __atanhl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double expl (long double __x) throw (); extern long double __expl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double frexpl (long double __x, int *__exponent) throw (); extern long double __frexpl (long double __x, int *__exponent) throw ();
#pragma empty_line
#pragma empty_line
extern long double ldexpl (long double __x, int __exponent) throw (); extern long double __ldexpl (long double __x, int __exponent) throw ();
#pragma empty_line
#pragma empty_line
extern long double logl (long double __x) throw (); extern long double __logl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double log10l (long double __x) throw (); extern long double __log10l (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double modfl (long double __x, long double *__iptr) throw (); extern long double __modfl (long double __x, long double *__iptr) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double exp10l (long double __x) throw (); extern long double __exp10l (long double __x) throw ();
#pragma empty_line
extern long double pow10l (long double __x) throw (); extern long double __pow10l (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double expm1l (long double __x) throw (); extern long double __expm1l (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double log1pl (long double __x) throw (); extern long double __log1pl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double logbl (long double __x) throw (); extern long double __logbl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double exp2l (long double __x) throw (); extern long double __exp2l (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double log2l (long double __x) throw (); extern long double __log2l (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double powl (long double __x, long double __y) throw (); extern long double __powl (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
extern long double sqrtl (long double __x) throw (); extern long double __sqrtl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double hypotl (long double __x, long double __y) throw (); extern long double __hypotl (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double cbrtl (long double __x) throw (); extern long double __cbrtl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double ceill (long double __x) throw () __attribute__ ((__const__)); extern long double __ceill (long double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern long double fabsl (long double __x) throw () __attribute__ ((__const__)); extern long double __fabsl (long double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern long double floorl (long double __x) throw () __attribute__ ((__const__)); extern long double __floorl (long double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern long double fmodl (long double __x, long double __y) throw (); extern long double __fmodl (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __isinfl (long double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int __finitel (long double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int isinfl (long double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int finitel (long double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern long double dreml (long double __x, long double __y) throw (); extern long double __dreml (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double significandl (long double __x) throw (); extern long double __significandl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double copysignl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double nanl (__const char *__tagb) throw () __attribute__ ((__const__)); extern long double __nanl (__const char *__tagb) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __isnanl (long double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int isnanl (long double __value) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern long double j0l (long double) throw (); extern long double __j0l (long double) throw ();
extern long double j1l (long double) throw (); extern long double __j1l (long double) throw ();
extern long double jnl (int, long double) throw (); extern long double __jnl (int, long double) throw ();
extern long double y0l (long double) throw (); extern long double __y0l (long double) throw ();
extern long double y1l (long double) throw (); extern long double __y1l (long double) throw ();
extern long double ynl (int, long double) throw (); extern long double __ynl (int, long double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double erfl (long double) throw (); extern long double __erfl (long double) throw ();
extern long double erfcl (long double) throw (); extern long double __erfcl (long double) throw ();
extern long double lgammal (long double) throw (); extern long double __lgammal (long double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double tgammal (long double) throw (); extern long double __tgammal (long double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double gammal (long double) throw (); extern long double __gammal (long double) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double lgammal_r (long double, int *__signgamp) throw (); extern long double __lgammal_r (long double, int *__signgamp) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double rintl (long double __x) throw (); extern long double __rintl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
extern long double nextafterl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) throw () __attribute__ ((__const__));
#pragma empty_line
extern long double nexttowardl (long double __x, long double __y) throw () __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double remainderl (long double __x, long double __y) throw (); extern long double __remainderl (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double scalbnl (long double __x, int __n) throw (); extern long double __scalbnl (long double __x, int __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int ilogbl (long double __x) throw (); extern int __ilogbl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double scalblnl (long double __x, long int __n) throw (); extern long double __scalblnl (long double __x, long int __n) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double nearbyintl (long double __x) throw (); extern long double __nearbyintl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double roundl (long double __x) throw () __attribute__ ((__const__)); extern long double __roundl (long double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double truncl (long double __x) throw () __attribute__ ((__const__)); extern long double __truncl (long double __x) throw () __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double remquol (long double __x, long double __y, int *__quo) throw (); extern long double __remquol (long double __x, long double __y, int *__quo) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int lrintl (long double __x) throw (); extern long int __lrintl (long double __x) throw ();
extern long long int llrintl (long double __x) throw (); extern long long int __llrintl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long int lroundl (long double __x) throw (); extern long int __lroundl (long double __x) throw ();
extern long long int llroundl (long double __x) throw (); extern long long int __llroundl (long double __x) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double fdiml (long double __x, long double __y) throw (); extern long double __fdiml (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
extern long double fmaxl (long double __x, long double __y) throw (); extern long double __fmaxl (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
extern long double fminl (long double __x, long double __y) throw (); extern long double __fminl (long double __x, long double __y) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern int __fpclassifyl (long double __value) throw ()
     __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
extern int __signbitl (long double __value) throw ()
     __attribute__ ((__const__));
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double fmal (long double __x, long double __y, long double __z) throw (); extern long double __fmal (long double __x, long double __y, long double __z) throw ();
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern long double scalbl (long double __x, long double __n) throw (); extern long double __scalbl (long double __x, long double __n) throw ();
#pragma line 142 "/usr/include/math.h" 2 3 4
#pragma line 157 "/usr/include/math.h" 3 4
extern int signgam;
#pragma line 198 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN,
#pragma empty_line
    FP_INFINITE,
#pragma empty_line
    FP_ZERO,
#pragma empty_line
    FP_SUBNORMAL,
#pragma empty_line
    FP_NORMAL
#pragma empty_line
  };
#pragma line 291 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
extern _LIB_VERSION_TYPE _LIB_VERSION;
#pragma line 314 "/usr/include/math.h" 3 4
struct __exception
#pragma empty_line
#pragma empty_line
#pragma empty_line
  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };
#pragma empty_line
#pragma empty_line
extern int matherr (struct __exception *__exc) throw ();
#pragma line 472 "/usr/include/math.h" 3 4
}
#pragma line 53 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/fcuda.h" 1
#pragma line 28 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/fcuda.h"
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h" 1
#pragma line 56 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h"
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/device_types.h" 1
#pragma line 60 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/device_types.h"
enum cudaRoundMode
{
  cudaRoundNearest,
  cudaRoundZero,
  cudaRoundPosInf,
  cudaRoundMinInf
};
#pragma line 57 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/driver_types.h" 1
#pragma line 60 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/driver_types.h"
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/limits.h" 1 3 4
#pragma line 34 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/limits.h" 3 4
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/syslimits.h" 1 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/limits.h" 1 3 4
#pragma line 169 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/limits.h" 3 4
#pragma line 1 "/usr/include/limits.h" 1 3 4
#pragma line 145 "/usr/include/limits.h" 3 4
#pragma line 1 "/usr/include/bits/posix1_lim.h" 1 3 4
#pragma line 157 "/usr/include/bits/posix1_lim.h" 3 4
#pragma line 1 "/usr/include/bits/local_lim.h" 1 3 4
#pragma line 39 "/usr/include/bits/local_lim.h" 3 4
#pragma line 1 "/usr/include/linux/limits.h" 1 3 4
#pragma line 40 "/usr/include/bits/local_lim.h" 2 3 4
#pragma line 158 "/usr/include/bits/posix1_lim.h" 2 3 4
#pragma line 146 "/usr/include/limits.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/posix2_lim.h" 1 3 4
#pragma line 150 "/usr/include/limits.h" 2 3 4
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma line 1 "/usr/include/bits/xopen_lim.h" 1 3 4
#pragma line 34 "/usr/include/bits/xopen_lim.h" 3 4
#pragma line 1 "/usr/include/bits/stdio_lim.h" 1 3 4
#pragma line 35 "/usr/include/bits/xopen_lim.h" 2 3 4
#pragma line 154 "/usr/include/limits.h" 2 3 4
#pragma line 170 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/limits.h" 2 3 4
#pragma line 8 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/syslimits.h" 2 3 4
#pragma line 35 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include-fixed/limits.h" 2 3 4
#pragma line 61 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/driver_types.h" 2
#pragma line 1 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 1 3 4
#pragma line 150 "/opt/xilinx/vivado/2016.2/Vivado_HLS/2016.2/lnx64/tools/gcc/bin/../lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/stddef.h" 3 4
typedef long int ptrdiff_t;
#pragma line 62 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/driver_types.h" 2
#pragma line 90 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/driver_types.h"
enum cudaError
{
  cudaSuccess = 0,
  cudaErrorMissingConfiguration = 1,
  cudaErrorMemoryAllocation = 2,
  cudaErrorInitializationError = 3,
  cudaErrorLaunchFailure = 4,
  cudaErrorPriorLaunchFailure = 5,
  cudaErrorLaunchTimeout = 6,
  cudaErrorLaunchOutOfResources = 7,
  cudaErrorInvalidDeviceFunction = 8,
  cudaErrorInvalidConfiguration = 9,
  cudaErrorInvalidDevice = 10,
  cudaErrorInvalidValue = 11,
  cudaErrorInvalidPitchValue = 12,
  cudaErrorInvalidSymbol = 13,
  cudaErrorMapBufferObjectFailed = 14,
  cudaErrorUnmapBufferObjectFailed = 15,
  cudaErrorInvalidHostPointer = 16,
  cudaErrorInvalidDevicePointer = 17,
  cudaErrorInvalidTexture = 18,
  cudaErrorInvalidTextureBinding = 19,
  cudaErrorInvalidChannelDescriptor = 20,
  cudaErrorInvalidMemcpyDirection = 21,
  cudaErrorAddressOfConstant = 22,
  cudaErrorTextureFetchFailed = 23,
  cudaErrorTextureNotBound = 24,
  cudaErrorSynchronizationError = 25,
  cudaErrorInvalidFilterSetting = 26,
  cudaErrorInvalidNormSetting = 27,
  cudaErrorMixedDeviceExecution = 28,
  cudaErrorCudartUnloading = 29,
  cudaErrorUnknown = 30,
  cudaErrorNotYetImplemented = 31,
  cudaErrorMemoryValueTooLarge = 32,
  cudaErrorInvalidResourceHandle = 33,
  cudaErrorNotReady = 34,
  cudaErrorInsufficientDriver = 35,
  cudaErrorSetOnActiveProcess = 36,
  cudaErrorNoDevice = 38,
  cudaErrorStartupFailure = 0x7f,
  cudaErrorApiFailureBase = 10000
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
enum cudaChannelFormatKind
{
  cudaChannelFormatKindSigned = 0,
  cudaChannelFormatKindUnsigned = 1,
  cudaChannelFormatKindFloat = 2,
  cudaChannelFormatKindNone = 3,
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaChannelFormatDesc
{
  int x;
  int y;
  int z;
  int w;
  enum cudaChannelFormatKind f;
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaArray;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
enum cudaMemcpyKind
{
  cudaMemcpyHostToHost = 0,
  cudaMemcpyHostToDevice = 1,
  cudaMemcpyDeviceToHost = 2,
  cudaMemcpyDeviceToDevice = 3
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaPitchedPtr
{
  void *ptr;
  size_t pitch;
  size_t xsize;
  size_t ysize;
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaExtent
{
  size_t width;
  size_t height;
  size_t depth;
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaPos
{
  size_t x;
  size_t y;
  size_t z;
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaMemcpy3DParms
{
  struct cudaArray *srcArray;
  struct cudaPos srcPos;
  struct cudaPitchedPtr srcPtr;
#pragma empty_line
  struct cudaArray *dstArray;
  struct cudaPos dstPos;
  struct cudaPitchedPtr dstPtr;
#pragma empty_line
  struct cudaExtent extent;
  enum cudaMemcpyKind kind;
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaFuncAttributes
{
   size_t sharedSizeBytes;
   size_t constSizeBytes;
   size_t localSizeBytes;
   int maxThreadsPerBlock;
   int numRegs;
   int __cudaReserved[8];
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
enum cudaComputeMode
{
  cudaComputeModeDefault = 0,
  cudaComputeModeExclusive = 1,
  cudaComputeModeProhibited = 2
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct cudaDeviceProp
{
  char name[256];
  size_t totalGlobalMem;
  size_t sharedMemPerBlock;
  int regsPerBlock;
  int warpSize;
  size_t memPitch;
  int maxThreadsPerBlock;
  int maxThreadsDim[3];
  int maxGridSize[3];
  int clockRate;
  size_t totalConstMem;
  int major;
  int minor;
  size_t textureAlignment;
  int deviceOverlap;
  int multiProcessorCount;
  int kernelExecTimeoutEnabled;
  int integrated;
  int canMapHostMemory;
  int computeMode;
  int __cudaReserved[36];
};
#pragma line 318 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/driver_types.h"
typedef enum cudaError cudaError_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef int cudaStream_t;
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef int cudaEvent_t;
#pragma line 58 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/surface_types.h" 1
#pragma line 77 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/surface_types.h"
enum cudaSurfaceBoundaryMode
{
  cudaBoundaryModeZero = 0,
  cudaBoundaryModeClamp = 1,
  cudaBoundaryModeTrap = 2
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
enum cudaSurfaceFormatMode
{
  cudaFormatModeForced = 0,
  cudaFormatModeAuto = 1
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
struct surfaceReference
{
#pragma empty_line
#pragma empty_line
#pragma empty_line
  struct cudaChannelFormatDesc channelDesc;
};
#pragma line 59 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/texture_types.h" 1
#pragma line 54 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/texture_types.h"
enum cudaTextureAddressMode
{
  cudaAddressModeWrap,
  cudaAddressModeClamp
};
#pragma empty_line
#pragma empty_line
enum cudaTextureFilterMode
{
  cudaFilterModePoint,
  cudaFilterModeLinear
};
#pragma empty_line
#pragma empty_line
enum cudaTextureReadMode
{
  cudaReadModeElementType,
  cudaReadModeNormalizedFloat
};
#pragma empty_line
#pragma empty_line
struct textureReference
{
  int normalized;
  enum cudaTextureFilterMode filterMode;
  enum cudaTextureAddressMode addressMode[3];
  struct cudaChannelFormatDesc channelDesc;
  int __cudaReserved[16];
};
#pragma line 60 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h" 1
#pragma line 45 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h"
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/host_defines.h" 1
#pragma line 46 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h" 2
#pragma line 54 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h"
struct char1
{
  signed char x;
};
#pragma empty_line
#pragma empty_line
struct uchar1
{
  unsigned char x;
};
#pragma empty_line
#pragma empty_line
struct char2
{
  signed char x, y;
};
#pragma empty_line
#pragma empty_line
struct uchar2
{
  unsigned char x, y;
};
#pragma empty_line
#pragma empty_line
struct char3
{
  signed char x, y, z;
};
#pragma empty_line
#pragma empty_line
struct uchar3
{
  unsigned char x, y, z;
};
#pragma empty_line
#pragma empty_line
struct char4
{
  signed char x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct uchar4
{
  unsigned char x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct short1
{
  short x;
};
#pragma empty_line
#pragma empty_line
struct ushort1
{
  unsigned short x;
};
#pragma empty_line
#pragma empty_line
struct short2
{
  short x, y;
};
#pragma empty_line
#pragma empty_line
struct ushort2
{
  unsigned short x, y;
};
#pragma empty_line
#pragma empty_line
struct short3
{
  short x, y, z;
};
#pragma empty_line
#pragma empty_line
struct ushort3
{
  unsigned short x, y, z;
};
#pragma empty_line
#pragma empty_line
struct short4
{
  short x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct ushort4
{
  unsigned short x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct int1
{
  int x;
};
#pragma empty_line
#pragma empty_line
struct uint1
{
  unsigned int x;
};
#pragma empty_line
#pragma empty_line
struct int2
{
  int x, y;
};
#pragma empty_line
#pragma empty_line
struct uint2
{
  unsigned int x, y;
};
#pragma empty_line
#pragma empty_line
struct int3
{
  int x, y, z;
};
#pragma empty_line
#pragma empty_line
struct uint3
{
  unsigned int x, y, z;
};
#pragma empty_line
#pragma empty_line
struct int4
{
  int x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct uint4
{
  unsigned int x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct long1
{
  long int x;
};
#pragma empty_line
#pragma empty_line
struct ulong1
{
  unsigned long x;
};
#pragma empty_line
#pragma empty_line
struct
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
                                             long2
{
  long int x, y;
};
#pragma empty_line
#pragma empty_line
struct
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
                                                      ulong2
{
  unsigned long int x, y;
};
#pragma line 262 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h"
struct float1
{
  float x;
};
#pragma empty_line
#pragma empty_line
struct float2
{
  float x, y;
};
#pragma empty_line
#pragma empty_line
struct float3
{
  float x, y, z;
};
#pragma empty_line
#pragma empty_line
struct float4
{
  float x, y, z, w;
};
#pragma empty_line
#pragma empty_line
struct longlong1
{
  long long int x;
};
#pragma empty_line
#pragma empty_line
struct ulonglong1
{
  unsigned long long int x;
};
#pragma empty_line
#pragma empty_line
struct longlong2
{
  long long int x, y;
};
#pragma empty_line
#pragma empty_line
struct ulonglong2
{
  unsigned long long int x, y;
};
#pragma empty_line
#pragma empty_line
struct double1
{
  double x;
};
#pragma empty_line
#pragma empty_line
struct double2
{
  double x, y;
};
#pragma empty_line
#pragma empty_line
struct double3
{
  double x, y, z;
};
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
typedef struct char1 char1;
#pragma empty_line
typedef struct uchar1 uchar1;
#pragma empty_line
typedef struct char2 char2;
#pragma empty_line
typedef struct uchar2 uchar2;
#pragma empty_line
typedef struct char3 char3;
#pragma empty_line
typedef struct uchar3 uchar3;
#pragma empty_line
typedef struct char4 char4;
#pragma empty_line
typedef struct uchar4 uchar4;
#pragma empty_line
typedef struct short1 short1;
#pragma empty_line
typedef struct ushort1 ushort1;
#pragma empty_line
typedef struct short2 short2;
#pragma empty_line
typedef struct ushort2 ushort2;
#pragma empty_line
typedef struct short3 short3;
#pragma empty_line
typedef struct ushort3 ushort3;
#pragma empty_line
typedef struct short4 short4;
#pragma empty_line
typedef struct ushort4 ushort4;
#pragma empty_line
typedef struct int1 int1;
#pragma empty_line
typedef struct uint1 uint1;
#pragma empty_line
typedef struct int2 int2;
#pragma empty_line
typedef struct uint2 uint2;
#pragma empty_line
typedef struct int3 int3;
#pragma empty_line
typedef struct uint3 uint3;
#pragma empty_line
typedef struct int4 int4;
#pragma empty_line
typedef struct uint4 uint4;
#pragma empty_line
typedef struct long1 long1;
#pragma empty_line
typedef struct ulong1 ulong1;
#pragma empty_line
typedef struct long2 long2;
#pragma empty_line
typedef struct ulong2 ulong2;
#pragma empty_line
typedef struct long3 long3;
#pragma empty_line
typedef struct ulong3 ulong3;
#pragma empty_line
typedef struct long4 long4;
#pragma empty_line
typedef struct ulong4 ulong4;
#pragma empty_line
typedef struct float1 float1;
#pragma empty_line
typedef struct float2 float2;
#pragma empty_line
typedef struct float3 float3;
#pragma empty_line
typedef struct float4 float4;
#pragma empty_line
typedef struct longlong1 longlong1;
#pragma empty_line
typedef struct ulonglong1 ulonglong1;
#pragma empty_line
typedef struct longlong2 longlong2;
#pragma empty_line
typedef struct ulonglong2 ulonglong2;
#pragma empty_line
typedef struct double1 double1;
#pragma empty_line
typedef struct double2 double2;
#pragma empty_line
typedef struct double3 double3;
#pragma line 426 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h"
typedef struct dim3 dim3;
#pragma empty_line
#pragma empty_line
struct dim3
{
    unsigned int x, y, z;
#pragma empty_line
    dim3(unsigned int x = 1, unsigned int y = 1, unsigned int z = 1) : x(x), y(y), z(z) {}
    dim3(uint3 v) : x(v.x), y(v.y), z(v.z) {}
    operator uint3(void) { uint3 t; t.x = x; t.y = y; t.z = z; return t; }
#pragma empty_line
};
#pragma line 60 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/builtin_types.h" 2
#pragma line 29 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/fcuda.h" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/fcutil.h" 1
#pragma line 34 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/fcutil.h"
extern "C" {
#pragma empty_line
#pragma empty_line
void cutCreateTimer(unsigned int* timer);
#pragma empty_line
void cutStartTimer(unsigned int timer);
#pragma empty_line
void cutStopTimer(unsigned int timer);
#pragma empty_line
float cutGetTimerValue(unsigned int timer);
#pragma empty_line
void cutDeleteTimer(unsigned int timer);
#pragma empty_line
void cudaMemcpy(void* dest, void* src, size_t size, int type);
void cudaMalloc(void** dest, size_t size);
void cudaFree(void* ptr);
void cudaMemcpyToSymbol(void* dst, void* src, size_t size, int type);
void cudaMemset(void* ptr, int i, size_t size);
void cudaThreadSynchronize();
#pragma empty_line
#pragma empty_line
}
#pragma line 30 "/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/fcuda.h" 2
#pragma line 54 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.h" 1
#pragma line 51 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.h"
typedef float DATATYPE;
#pragma empty_line
#pragma empty_line
#pragma empty_line
void matrixMul(float *h_C, float *h_A, float *h_B, int wa, int wb,
        dim3 grid, dim3 threads);
#pragma line 55 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma empty_line
#pragma empty_line
#pragma line 1 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul_gold.cpp" 1
#pragma line 38 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul_gold.cpp"
extern "C"
void computeGold( float*, const float*, const float*, unsigned int, unsigned int, unsigned int);
#pragma line 50 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul_gold.cpp"
  void
computeGold(float* C, const float* A, const float* B, unsigned int hA, unsigned int wA, unsigned int wB)
{
  for (unsigned int i = 0; i < hA; ++i)
    for (unsigned int j = 0; j < wB; ++j) {
      double sum = 0;
      for (unsigned int k = 0; k < wA; ++k) {
        double a = A[i * wA + k];
        double b = B[k * wB + j];
        sum += a * b;
      }
      C[i * wB + j] = (float)sum;
    }
}
#pragma line 58 "/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matrixMul.cpp" 2
#pragma empty_line
#pragma empty_line
void runTest(int argc, char** argv);
void randomInit(float*, int);
void printDiff(float*, float*, int, int);
#pragma empty_line
extern "C"
void computeGold(float*, const float*, const float*, unsigned int, unsigned int, unsigned int);
#pragma empty_line
#pragma empty_line
#pragma empty_line
int compareVectorFloats(float* out, float* ref, const int size, float errThreshld)
{
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
  double error_norm = 0;
  double ref_norm = 0;
#pragma empty_line
  for (int i=0; i<size; ++i) {
    const double diff = out[i] - ref[i];
    error_norm += diff * diff;
    ref_norm += ref[i]*ref[i];
  }
#pragma empty_line
  error_norm = sqrt((double)error_norm);
  ref_norm = sqrt((double)ref_norm);
#pragma empty_line
  if (fabs(ref_norm) < 1e-7) {
    fprintf (stderr, "!!!! reference norm is 0\n");
    return 1;
  }
#pragma empty_line
  double err = error_norm / ref_norm;
#pragma empty_line
  printf("error =  %.4lf\n", err);
  if (err < errThreshld)
    printf("PASSED.\n");
  else
    printf("FAILED.\n");
  return 0;
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
int main(int argc, char** argv)
{
  runTest(argc, argv);
}
#pragma empty_line
#pragma empty_line
#pragma empty_line
#pragma empty_line
void runTest(int argc, char** argv)
{
#pragma empty_line
  srand(2006);
#pragma empty_line
#pragma empty_line
  unsigned int size_A = (3 * 16) * (5 * 16);
  unsigned int mem_size_A = sizeof(float) * size_A;
  float* h_A = (float*) malloc(mem_size_A);
  unsigned int size_B = (8 * 16) * (3 * 16);
  unsigned int mem_size_B = sizeof(float) * size_B;
  float* h_B = (float*) malloc(mem_size_B);
#pragma empty_line
#pragma empty_line
  randomInit(h_A, size_A);
  randomInit(h_B, size_B);
#pragma empty_line
#pragma empty_line
  unsigned int size_C = (8 * 16) * (5 * 16);
  unsigned int mem_size_C = sizeof(float) * size_C;
  float* h_C = (float*) malloc(mem_size_C);
#pragma empty_line
#pragma empty_line
  dim3 threads(16, 16);
  dim3 grid((8 * 16) / threads.x, (5 * 16) / threads.y);
#pragma empty_line
#pragma empty_line
#pragma empty_line
  matrixMul(h_C, h_A, h_B, (3 * 16), (8 * 16), grid, threads);
#pragma empty_line
#pragma empty_line
  float* reference = (float*) malloc(mem_size_C);
  computeGold(reference, h_A, h_B, (5 * 16), (3 * 16), (8 * 16));
#pragma empty_line
  compareVectorFloats(h_C, reference, size_C, 1e-6f);
#pragma empty_line
  free(h_A);
  free(h_B);
  free(h_C);
  free(reference);
}
#pragma empty_line
#pragma empty_line
void randomInit(float* data, int size)
{
  for (int i = 0; i < size; ++i)
    data[i] = rand() / (float)2147483647;
}
#pragma empty_line
void printDiff(float *data1, float *data2, int width, int height)
{
  int i,j,k;
  int error_count=0;
  for (j=0; j<height; j++) {
    for (i=0; i<width; i++) {
      k = j*width+i;
      if (data1[k] != data2[k]) {
        printf("diff(%d,%d) CPU=%4.4f, GPU=%4.4f n", i,j, data1[k], data2[k]);
        error_count++;
      }
    }
  }
  printf(" nTotal Errors = %d n", error_count);
}
