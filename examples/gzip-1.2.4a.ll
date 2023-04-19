; ModuleID = 'gzip.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.config = type { i16, i16, i16, i16 }
%struct.ct_data = type { %union.anon, %union.anon }
%union.anon = type { i16 }
%struct.tree_desc = type { ptr, ptr, ptr, i32, i32, i32, i32 }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.huft = type { i8, i8, %union.anon.0 }
%union.anon.0 = type { ptr }

@ascii = dso_local global i32 0, align 4
@decompress = dso_local global i32 0, align 4
@force = dso_local global i32 0, align 4
@no_name = dso_local global i32 -1, align 4
@no_time = dso_local global i32 -1, align 4
@recursive = dso_local global i32 0, align 4
@list = dso_local global i32 0, align 4
@verbose = dso_local global i32 0, align 4
@do_lzw = dso_local global i32 0, align 4
@args = dso_local global ptr null, align 8
@total_in = dso_local global i64 0, align 8
@total_out = dso_local global i64 0, align 8
@remove_ofname = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [6 x i8] c"ascii\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"to-stdout\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"decompress\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"uncompress\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"force\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"list\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"license\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"no-name\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"quiet\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"silent\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"recursive\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"suffix\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"test\00", align 1
@.str.16 = private unnamed_addr constant [8 x i8] c"no-time\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"verbose\00", align 1
@.str.18 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"fast\00", align 1
@.str.20 = private unnamed_addr constant [5 x i8] c"best\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"lzw\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"bits\00", align 1
@longopts = dso_local global [24 x %struct.option] [%struct.option { ptr @.str, i32 0, ptr null, i32 97 }, %struct.option { ptr @.str.1, i32 0, ptr null, i32 99 }, %struct.option { ptr @.str.2, i32 0, ptr null, i32 99 }, %struct.option { ptr @.str.3, i32 0, ptr null, i32 100 }, %struct.option { ptr @.str.4, i32 0, ptr null, i32 100 }, %struct.option { ptr @.str.5, i32 0, ptr null, i32 102 }, %struct.option { ptr @.str.6, i32 0, ptr null, i32 104 }, %struct.option { ptr @.str.7, i32 0, ptr null, i32 108 }, %struct.option { ptr @.str.8, i32 0, ptr null, i32 76 }, %struct.option { ptr @.str.9, i32 0, ptr null, i32 110 }, %struct.option { ptr @.str.10, i32 0, ptr null, i32 78 }, %struct.option { ptr @.str.11, i32 0, ptr null, i32 113 }, %struct.option { ptr @.str.12, i32 0, ptr null, i32 113 }, %struct.option { ptr @.str.13, i32 0, ptr null, i32 114 }, %struct.option { ptr @.str.14, i32 1, ptr null, i32 83 }, %struct.option { ptr @.str.15, i32 0, ptr null, i32 116 }, %struct.option { ptr @.str.16, i32 0, ptr null, i32 84 }, %struct.option { ptr @.str.17, i32 0, ptr null, i32 118 }, %struct.option { ptr @.str.18, i32 0, ptr null, i32 86 }, %struct.option { ptr @.str.19, i32 0, ptr null, i32 49 }, %struct.option { ptr @.str.20, i32 0, ptr null, i32 57 }, %struct.option { ptr @.str.21, i32 0, ptr null, i32 90 }, %struct.option { ptr @.str.22, i32 1, ptr null, i32 98 }, %struct.option zeroinitializer], align 16
@work = dso_local global ptr @zip, align 8
@.str.23 = private unnamed_addr constant [5 x i8] c".exe\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"GZIP\00", align 1
@env = dso_local global ptr null, align 8
@foreground = dso_local global i32 0, align 4
@.str.25 = private unnamed_addr constant [3 x i8] c"un\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"gun\00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"cat\00", align 1
@.str.28 = private unnamed_addr constant [6 x i8] c"gzcat\00", align 1
@z_suffix = dso_local global [31 x i8] zeroinitializer, align 16
@.str.29 = private unnamed_addr constant [4 x i8] c".gz\00", align 1
@z_len = dso_local global i32 0, align 4
@.str.30 = private unnamed_addr constant [33 x i8] c"ab:cdfhH?lLmMnNqrS:tvVZ123456789\00", align 1
@optarg = external global ptr, align 8
@.str.31 = private unnamed_addr constant [38 x i8] c"%s: -Z not supported in this version\0A\00", align 1
@optind = external global i32, align 4
@.str.32 = private unnamed_addr constant [43 x i8] c"%s: option --ascii ignored on this system\0A\00", align 1
@.str.33 = private unnamed_addr constant [27 x i8] c"%s: incorrect suffix '%s'\0A\00", align 1
@last_member = dso_local global i32 0, align 4
@part_nb = dso_local global i32 0, align 4
@ifile_size = dso_local global i64 0, align 8
@istat = dso_local global %struct.stat zeroinitializer, align 8
@help.help_msg = internal global [18 x ptr] [ptr @.str.34, ptr @.str.35, ptr @.str.36, ptr @.str.37, ptr @.str.38, ptr @.str.39, ptr @.str.40, ptr @.str.41, ptr @.str.42, ptr @.str.43, ptr @.str.44, ptr @.str.45, ptr @.str.46, ptr @.str.47, ptr @.str.48, ptr @.str.49, ptr @.str.50, ptr null], align 16
@.str.34 = private unnamed_addr constant [74 x i8] c" -c --stdout      write on standard output, keep original files unchanged\00", align 1
@.str.35 = private unnamed_addr constant [29 x i8] c" -d --decompress  decompress\00", align 1
@.str.36 = private unnamed_addr constant [68 x i8] c" -f --force       force overwrite of output file and compress links\00", align 1
@.str.37 = private unnamed_addr constant [33 x i8] c" -h --help        give this help\00", align 1
@.str.38 = private unnamed_addr constant [48 x i8] c" -l --list        list compressed file contents\00", align 1
@.str.39 = private unnamed_addr constant [43 x i8] c" -L --license     display software license\00", align 1
@.str.40 = private unnamed_addr constant [74 x i8] c" -n --no-name     do not save or restore the original name and time stamp\00", align 1
@.str.41 = private unnamed_addr constant [67 x i8] c" -N --name        save or restore the original name and time stamp\00", align 1
@.str.42 = private unnamed_addr constant [40 x i8] c" -q --quiet       suppress all warnings\00", align 1
@.str.43 = private unnamed_addr constant [53 x i8] c" -r --recursive   operate recursively on directories\00", align 1
@.str.44 = private unnamed_addr constant [64 x i8] c" -S .suf  --suffix .suf     use suffix .suf on compressed files\00", align 1
@.str.45 = private unnamed_addr constant [49 x i8] c" -t --test        test compressed file integrity\00", align 1
@.str.46 = private unnamed_addr constant [31 x i8] c" -v --verbose     verbose mode\00", align 1
@.str.47 = private unnamed_addr constant [41 x i8] c" -V --version     display version number\00", align 1
@.str.48 = private unnamed_addr constant [34 x i8] c" -1 --fast        compress faster\00", align 1
@.str.49 = private unnamed_addr constant [34 x i8] c" -9 --best        compress better\00", align 1
@.str.50 = private unnamed_addr constant [76 x i8] c" file...          files to (de)compress. If none given, use standard input.\00", align 1
@.str.51 = private unnamed_addr constant [12 x i8] c"%s %s (%s)\0A\00", align 1
@.str.52 = private unnamed_addr constant [6 x i8] c"1.2.4\00", align 1
@.str.53 = private unnamed_addr constant [10 x i8] c"18 Aug 93\00", align 1
@.str.54 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@license_msg = internal global [15 x ptr] [ptr @.str.55, ptr @.str.56, ptr @.str.57, ptr @.str.58, ptr @.str.59, ptr @.str.60, ptr @.str.61, ptr @.str.62, ptr @.str.63, ptr @.str.64, ptr @.str.60, ptr @.str.65, ptr @.str.66, ptr @.str.67, ptr null], align 16
@.str.55 = private unnamed_addr constant [44 x i8] c"   Copyright (C) 1992-1993 Jean-loup Gailly\00", align 1
@.str.56 = private unnamed_addr constant [72 x i8] c"   This program is free software; you can redistribute it and/or modify\00", align 1
@.str.57 = private unnamed_addr constant [72 x i8] c"   it under the terms of the GNU General Public License as published by\00", align 1
@.str.58 = private unnamed_addr constant [71 x i8] c"   the Free Software Foundation; either version 2, or (at your option)\00", align 1
@.str.59 = private unnamed_addr constant [22 x i8] c"   any later version.\00", align 1
@.str.60 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.61 = private unnamed_addr constant [67 x i8] c"   This program is distributed in the hope that it will be useful,\00", align 1
@.str.62 = private unnamed_addr constant [66 x i8] c"   but WITHOUT ANY WARRANTY; without even the implied warranty of\00", align 1
@.str.63 = private unnamed_addr constant [65 x i8] c"   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\00", align 1
@.str.64 = private unnamed_addr constant [48 x i8] c"   GNU General Public License for more details.\00", align 1
@.str.65 = private unnamed_addr constant [69 x i8] c"   You should have received a copy of the GNU General Public License\00", align 1
@.str.66 = private unnamed_addr constant [63 x i8] c"   along with this program; if not, write to the Free Software\00", align 1
@.str.67 = private unnamed_addr constant [61 x i8] c"   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.\00", align 1
@.str.68 = private unnamed_addr constant [28 x i8] c"Compilation options:\0A%s %s \00", align 1
@.str.69 = private unnamed_addr constant [7 x i8] c"DIRENT\00", align 1
@.str.70 = private unnamed_addr constant [6 x i8] c"UTIME\00", align 1
@.str.71 = private unnamed_addr constant [14 x i8] c"STDC_HEADERS \00", align 1
@.str.72 = private unnamed_addr constant [15 x i8] c"HAVE_UNISTD_H \00", align 1
@.str.73 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.74 = private unnamed_addr constant [55 x i8] c"usage: %s [-%scdfhlLnN%stvV19] [-S suffix] [file ...]\0A\00", align 1
@.str.75 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stdin = external global ptr, align 8
@stdout = external global ptr, align 8
@.str.76 = private unnamed_addr constant [71 x i8] c"%s: compressed data not %s a terminal. Use -f to force %scompression.\0A\00", align 1
@.str.77 = private unnamed_addr constant [10 x i8] c"read from\00", align 1
@.str.78 = private unnamed_addr constant [11 x i8] c"written to\00", align 1
@.str.79 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str.80 = private unnamed_addr constant [23 x i8] c"For help, type: %s -h\0A\00", align 1
@.str.81 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str.82 = private unnamed_addr constant [13 x i8] c"fstat(stdin)\00", align 1
@.str.83 = private unnamed_addr constant [5 x i8] c" OK\0A\00", align 1
@.str.84 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@.str.85 = private unnamed_addr constant [3 x i8] c"\1F\9E\00", align 1
@.str.86 = private unnamed_addr constant [56 x i8] c"%s: %s: unknown method %d -- get newer version of gzip\0A\00", align 1
@.str.87 = private unnamed_addr constant [50 x i8] c"%s: %s is encrypted -- get newer version of gzip\0A\00", align 1
@.str.88 = private unnamed_addr constant [65 x i8] c"%s: %s is a a multi-part gzip file -- get newer version of gzip\0A\00", align 1
@.str.89 = private unnamed_addr constant [52 x i8] c"%s: %s has flags 0x%x -- get newer version of gzip\0A\00", align 1
@.str.90 = private unnamed_addr constant [24 x i8] c"%s: %s: part number %u\0A\00", align 1
@.str.91 = private unnamed_addr constant [41 x i8] c"%s: %s: extra field of %u bytes ignored\0A\00", align 1
@.str.92 = private unnamed_addr constant [39 x i8] c"corrupted input -- file name too large\00", align 1
@.str.93 = private unnamed_addr constant [5 x i8] c"PK\03\04\00", align 1
@.str.94 = private unnamed_addr constant [3 x i8] c"\1F\1E\00", align 1
@.str.95 = private unnamed_addr constant [3 x i8] c"\1F\9D\00", align 1
@.str.96 = private unnamed_addr constant [3 x i8] c"\1F\A0\00", align 1
@.str.97 = private unnamed_addr constant [29 x i8] c"\0A%s: %s: not in gzip format\0A\00", align 1
@.str.98 = private unnamed_addr constant [53 x i8] c"\0A%s: %s: decompression OK, trailing garbage ignored\0A\00", align 1
@.str.99 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.100 = private unnamed_addr constant [34 x i8] c"%s: %s is a directory -- ignored\0A\00", align 1
@.str.101 = private unnamed_addr constant [55 x i8] c"%s: %s is not a directory or a regular file - ignored\0A\00", align 1
@.str.102 = private unnamed_addr constant [41 x i8] c"%s: %s has %d other link%c -- unchanged\0A\00", align 1
@.str.103 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@.str.104 = private unnamed_addr constant [25 x i8] c"%s: %s compressed to %s\0A\00", align 1
@.str.105 = private unnamed_addr constant [7 x i8] c"%s:\09%s\00", align 1
@.str.106 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.107 = private unnamed_addr constant [3 x i8] c"\09\09\00", align 1
@.str.108 = private unnamed_addr constant [4 x i8] c" OK\00", align 1
@.str.109 = private unnamed_addr constant [21 x i8] c" -- replaced with %s\00", align 1
@get_istat.suffixes = internal global [6 x ptr] [ptr @z_suffix, ptr @.str.29, ptr @.str.110, ptr @.str.111, ptr @.str.112, ptr null], align 16
@.str.110 = private unnamed_addr constant [3 x i8] c".z\00", align 1
@.str.111 = private unnamed_addr constant [3 x i8] c"-z\00", align 1
@.str.112 = private unnamed_addr constant [3 x i8] c".Z\00", align 1
@get_suffix.known_suffixes = internal global [9 x ptr] [ptr @z_suffix, ptr @.str.29, ptr @.str.110, ptr @.str.113, ptr @.str.114, ptr @.str.115, ptr @.str.111, ptr @.str.116, ptr null], align 16
@.str.113 = private unnamed_addr constant [5 x i8] c".taz\00", align 1
@.str.114 = private unnamed_addr constant [5 x i8] c".tgz\00", align 1
@.str.115 = private unnamed_addr constant [4 x i8] c"-gz\00", align 1
@.str.116 = private unnamed_addr constant [3 x i8] c"_z\00", align 1
@.str.117 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@.str.118 = private unnamed_addr constant [19 x i8] c"%s: %s unreadable\0A\00", align 1
@.str.119 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.120 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.121 = private unnamed_addr constant [30 x i8] c"%s: %s/%s: pathname too long\0A\00", align 1
@.str.122 = private unnamed_addr constant [35 x i8] c"%s: %s: unknown suffix -- ignored\0A\00", align 1
@.str.123 = private unnamed_addr constant [5 x i8] c".tar\00", align 1
@.str.124 = private unnamed_addr constant [43 x i8] c"%s: %s already has %s suffix -- unchanged\0A\00", align 1
@.str.125 = private unnamed_addr constant [33 x i8] c"%s: %s: warning, name truncated\0A\00", align 1
@.str.126 = private unnamed_addr constant [39 x i8] c"%s: %s: cannot %scompress onto itself\0A\00", align 1
@.str.127 = private unnamed_addr constant [33 x i8] c"%s: %s and %s are the same file\0A\00", align 1
@.str.128 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.129 = private unnamed_addr constant [23 x i8] c"%s: %s already exists;\00", align 1
@.str.130 = private unnamed_addr constant [37 x i8] c" do you wish to overwrite (y or n)? \00", align 1
@.str.131 = private unnamed_addr constant [18 x i8] c"\09not overwritten\0A\00", align 1
@.str.132 = private unnamed_addr constant [15 x i8] c"name too short\00", align 1
@.str.133 = private unnamed_addr constant [22 x i8] c"can't recover suffix\0A\00", align 1
@.str.134 = private unnamed_addr constant [31 x i8] c"internal error in shorten_name\00", align 1
@.str.135 = private unnamed_addr constant [25 x i8] c"%s: time stamp restored\0A\00", align 1
@do_list.first_time = internal global i32 1, align 4
@do_list.methods = internal global [9 x ptr] [ptr @.str.136, ptr @.str.137, ptr @.str.138, ptr @.str.139, ptr @.str.60, ptr @.str.60, ptr @.str.60, ptr @.str.60, ptr @.str.140], align 16
@.str.136 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@.str.137 = private unnamed_addr constant [6 x i8] c"compr\00", align 1
@.str.138 = private unnamed_addr constant [6 x i8] c"pack \00", align 1
@.str.139 = private unnamed_addr constant [6 x i8] c"lzh  \00", align 1
@.str.140 = private unnamed_addr constant [6 x i8] c"defla\00", align 1
@.str.141 = private unnamed_addr constant [29 x i8] c"method  crc     date  time  \00", align 1
@.str.142 = private unnamed_addr constant [46 x i8] c"compressed  uncompr. ratio uncompressed_name\0A\00", align 1
@.str.143 = private unnamed_addr constant [39 x i8] c"                            %9lu %9lu \00", align 1
@.str.144 = private unnamed_addr constant [11 x i8] c"%9ld %9ld \00", align 1
@.str.145 = private unnamed_addr constant [11 x i8] c" (totals)\0A\00", align 1
@.str.146 = private unnamed_addr constant [16 x i8] c"%5s %08lx %11s \00", align 1
@.str.147 = private unnamed_addr constant [5 x i8] c" %s\0A\00", align 1
@do_exit.in_exit = internal global i32 0, align 4
@.str.148 = private unnamed_addr constant [3 x i8] c"\1F\8B\00", align 1
@save_orig_name = dso_local global i32 0, align 4
@time_stamp = dso_local global i64 0, align 8
@crc = internal global i64 0, align 8
@header_bytes = dso_local global i64 0, align 8
@window_size = dso_local global i64 65536, align 8
@.str.151 = private unnamed_addr constant [15 x i8] c"bad pack level\00", align 1
@compr_level = internal global i32 0, align 4
@configuration_table = internal global [10 x %struct.config] [%struct.config zeroinitializer, %struct.config { i16 4, i16 4, i16 8, i16 4 }, %struct.config { i16 4, i16 5, i16 16, i16 8 }, %struct.config { i16 4, i16 6, i16 32, i16 32 }, %struct.config { i16 4, i16 4, i16 16, i16 16 }, %struct.config { i16 8, i16 16, i16 32, i16 32 }, %struct.config { i16 8, i16 16, i16 128, i16 128 }, %struct.config { i16 8, i16 32, i16 128, i16 256 }, %struct.config { i16 32, i16 128, i16 258, i16 1024 }, %struct.config { i16 32, i16 258, i16 258, i16 4096 }], align 16
@max_lazy_match = internal global i32 0, align 4
@good_match = dso_local global i32 0, align 4
@nice_match = dso_local global i32 0, align 4
@max_chain_length = dso_local global i32 0, align 4
@lookahead = internal global i32 0, align 4
@eofile = internal global i32 0, align 4
@ins_h = internal global i32 0, align 4
@prev_length = dso_local global i32 0, align 4
@match_start = dso_local global i32 0, align 4
@file_type = dso_local global ptr null, align 8
@file_method = dso_local global ptr null, align 8
@input_len = internal global i64 0, align 8
@compressed_len = internal global i64 0, align 8
@static_dtree = internal global [30 x %struct.ct_data] zeroinitializer, align 16
@base_length = internal global [29 x i32] zeroinitializer, align 16
@extra_lbits = internal global [29 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 4, i32 5, i32 5, i32 5, i32 5, i32 0], align 16
@length_code = internal global [256 x i8] zeroinitializer, align 16
@base_dist = internal global [30 x i32] zeroinitializer, align 16
@extra_dbits = internal global [30 x i32] [i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 2, i32 2, i32 3, i32 3, i32 4, i32 4, i32 5, i32 5, i32 6, i32 6, i32 7, i32 7, i32 8, i32 8, i32 9, i32 9, i32 10, i32 10, i32 11, i32 11, i32 12, i32 12, i32 13, i32 13], align 16
@dist_code = internal global [512 x i8] zeroinitializer, align 16
@bl_count = internal global [16 x i16] zeroinitializer, align 16
@static_ltree = internal global [288 x %struct.ct_data] zeroinitializer, align 16
@flags = internal global i8 0, align 1
@flag_buf = internal global [4096 x i8] zeroinitializer, align 16
@last_flags = internal global i32 0, align 4
@l_desc = internal global %struct.tree_desc { ptr @dyn_ltree, ptr @static_ltree, ptr @extra_lbits, i32 257, i32 286, i32 15, i32 0 }, align 8
@d_desc = internal global %struct.tree_desc { ptr @dyn_dtree, ptr @static_dtree, ptr @extra_dbits, i32 0, i32 30, i32 15, i32 0 }, align 8
@opt_len = internal global i64 0, align 8
@static_len = internal global i64 0, align 8
@.str.158 = private unnamed_addr constant [15 x i8] c"block vanished\00", align 1
@dyn_ltree = internal global [573 x %struct.ct_data] zeroinitializer, align 16
@dyn_dtree = internal global [61 x %struct.ct_data] zeroinitializer, align 16
@last_lit = internal global i32 0, align 4
@last_dist = internal global i32 0, align 4
@flag_bit = internal global i8 0, align 1
@level = dso_local global i32 6, align 4
@strstart = dso_local global i32 0, align 4
@block_start = dso_local global i64 0, align 8
@bl_tree = internal global [39 x %struct.ct_data] zeroinitializer, align 16
@heap_len = internal global i32 0, align 4
@heap_max = internal global i32 0, align 4
@heap = internal global [573 x i32] zeroinitializer, align 16
@depth = internal global [573 x i8] zeroinitializer, align 16
@bl_desc = internal global %struct.tree_desc { ptr @bl_tree, ptr null, ptr @extra_blbits, i32 0, i32 19, i32 7, i32 0 }, align 8
@bl_order = internal global [19 x i8] c"\10\11\12\00\08\07\09\06\0A\05\0B\04\0C\03\0D\02\0E\01\0F", align 16
@extra_blbits = internal global [19 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2, i32 3, i32 7], align 16
@.str.1.159 = private unnamed_addr constant [23 x i8] c"-l used on binary file\00", align 1
@.str.2.160 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@zfile = internal global i32 0, align 4
@bi_buf = internal global i16 0, align 2
@bi_valid = internal global i32 0, align 4
@read_buf = dso_local global ptr null, align 8
@pkzip = dso_local global i32 0, align 4
@ext_header = dso_local global i32 0, align 4
@.str.177 = private unnamed_addr constant [31 x i8] c"\0A%s: %s: not a valid zip file\0A\00", align 1
@method = dso_local global i32 8, align 4
@.str.1.178 = private unnamed_addr constant [58 x i8] c"\0A%s: %s: first entry not deflated or stored -- use unzip\0A\00", align 1
@decrypt = dso_local global i32 0, align 4
@.str.2.179 = private unnamed_addr constant [38 x i8] c"\0A%s: %s: encrypted file -- use unzip\0A\00", align 1
@.str.3.182 = private unnamed_addr constant [14 x i8] c"out of memory\00", align 1
@.str.4.183 = private unnamed_addr constant [41 x i8] c"invalid compressed data--format violated\00", align 1
@.str.5.184 = private unnamed_addr constant [18 x i8] c"len %ld, siz %ld\0A\00", align 1
@.str.6.185 = private unnamed_addr constant [41 x i8] c"invalid compressed data--length mismatch\00", align 1
@.str.7.186 = private unnamed_addr constant [31 x i8] c"internal error, invalid method\00", align 1
@.str.8.187 = private unnamed_addr constant [35 x i8] c"invalid compressed data--crc error\00", align 1
@.str.9.188 = private unnamed_addr constant [38 x i8] c"invalid compressed data--length error\00", align 1
@.str.10.189 = private unnamed_addr constant [46 x i8] c"%s: %s has more than one entry--rest ignored\0A\00", align 1
@.str.11.190 = private unnamed_addr constant [45 x i8] c"%s: %s has more than one entry -- unchanged\0A\00", align 1
@key = dso_local global ptr null, align 8
@mask_bits = dso_local global [17 x i16] [i16 0, i16 1, i16 3, i16 7, i16 15, i16 31, i16 63, i16 127, i16 255, i16 511, i16 1023, i16 2047, i16 4095, i16 8191, i16 16383, i16 32767, i16 -1], align 16
@lbits = dso_local global i32 9, align 4
@dbits = dso_local global i32 6, align 4
@hufts = dso_local global i32 0, align 4
@bb = dso_local global i64 0, align 8
@bk = dso_local global i32 0, align 4
@cplens = internal global [31 x i16] [i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 13, i16 15, i16 17, i16 19, i16 23, i16 27, i16 31, i16 35, i16 43, i16 51, i16 59, i16 67, i16 83, i16 99, i16 115, i16 131, i16 163, i16 195, i16 227, i16 258, i16 0, i16 0], align 16
@cplext = internal global [31 x i16] [i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 1, i16 1, i16 1, i16 1, i16 2, i16 2, i16 2, i16 2, i16 3, i16 3, i16 3, i16 3, i16 4, i16 4, i16 4, i16 4, i16 5, i16 5, i16 5, i16 5, i16 0, i16 99, i16 99], align 16
@cpdist = internal global [30 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 7, i16 9, i16 13, i16 17, i16 25, i16 33, i16 49, i16 65, i16 97, i16 129, i16 193, i16 257, i16 385, i16 513, i16 769, i16 1025, i16 1537, i16 2049, i16 3073, i16 4097, i16 6145, i16 8193, i16 12289, i16 16385, i16 24577], align 16
@cpdext = internal global [30 x i16] [i16 0, i16 0, i16 0, i16 0, i16 1, i16 1, i16 2, i16 2, i16 3, i16 3, i16 4, i16 4, i16 5, i16 5, i16 6, i16 6, i16 7, i16 7, i16 8, i16 8, i16 9, i16 9, i16 10, i16 10, i16 11, i16 11, i16 12, i16 12, i16 13, i16 13], align 16
@border = internal global [19 x i32] [i32 16, i32 17, i32 18, i32 0, i32 8, i32 7, i32 9, i32 6, i32 10, i32 5, i32 11, i32 4, i32 12, i32 3, i32 13, i32 2, i32 14, i32 1, i32 15], align 16
@.str.191 = private unnamed_addr constant [26 x i8] c" incomplete literal tree\0A\00", align 1
@.str.1.192 = private unnamed_addr constant [27 x i8] c" incomplete distance tree\0A\00", align 1
@updcrc.crc = internal global i64 4294967295, align 8
@.str.219 = private unnamed_addr constant [3 x i8] c" \09\00", align 1
@.str.1.220 = private unnamed_addr constant [14 x i8] c"out of memory\00", align 1
@.str.2.223 = private unnamed_addr constant [8 x i8] c"argc<=0\00", align 1
@.str.3.224 = private unnamed_addr constant [13 x i8] c"\0A%s: %s: %s\0A\00", align 1
@.str.4.227 = private unnamed_addr constant [23 x i8] c"%s: %s: warning: %s%s\0A\00", align 1
@.str.5.199 = private unnamed_addr constant [6 x i8] c"\0A%s: \00", align 1
@.str.6.200 = private unnamed_addr constant [28 x i8] c"%s: unexpected end of file\0A\00", align 1
@ofname = dso_local global [1024 x i8] zeroinitializer, align 16
@.str.7.230 = private unnamed_addr constant [12 x i8] c"%2ld.%1ld%%\00", align 1
@crc_32_tab = dso_local global [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 16
@msg_done = internal global i32 0, align 4
@.str.233 = private unnamed_addr constant [44 x i8] c"output in compress .Z format not supported\0A\00", align 1
@block_mode = dso_local global i32 128, align 4
@maxbits = dso_local global i32 16, align 4
@quiet = dso_local global i32 0, align 4
@stderr = external global ptr, align 8
@.str.236 = private unnamed_addr constant [38 x i8] c"\0A%s: %s: warning, unknown flags 0x%x\0A\00", align 1
@progname = dso_local global ptr null, align 8
@ifname = dso_local global [1024 x i8] zeroinitializer, align 16
@exit_code = dso_local global i32 0, align 4
@.str.1.237 = private unnamed_addr constant [59 x i8] c"\0A%s: %s: compressed with %d bits, can only handle %d bits\0A\00", align 1
@bytes_in = dso_local global i64 0, align 8
@.str.2.238 = private unnamed_addr constant [15 x i8] c"corrupt input.\00", align 1
@to_stdout = dso_local global i32 0, align 4
@.str.3.239 = private unnamed_addr constant [46 x i8] c"corrupt input. Use zcat to recover some data.\00", align 1
@valid = internal global i32 0, align 4
@bitbuf = internal global i64 0, align 8
@peek_bits = internal global i32 0, align 4
@leaves = internal global [26 x i32] zeroinitializer, align 16
@max_len = internal global i32 0, align 4
@parents = internal global [26 x i32] zeroinitializer, align 16
@literal = internal global [256 x i8] zeroinitializer, align 16
@lit_base = internal global [26 x i32] zeroinitializer, align 16
@outcnt = dso_local global i32 0, align 4
@orig_len = internal global i64 0, align 8
@bytes_out = dso_local global i64 0, align 8
@.str.243 = private unnamed_addr constant [38 x i8] c"invalid compressed data--length error\00", align 1
@.str.1.244 = private unnamed_addr constant [50 x i8] c"invalid compressed data -- Huffman code > 32 bits\00", align 1
@.str.2.245 = private unnamed_addr constant [32 x i8] c"too many leaves in Huffman tree\00", align 1
@ifd = dso_local global i32 0, align 4
@ofd = dso_local global i32 0, align 4
@done = internal global i32 0, align 4
@window = dso_local global [65536 x i8] zeroinitializer, align 16
@test = dso_local global i32 0, align 4
@j = internal global i32 0, align 4
@blocksize = internal global i32 0, align 4
@bitbuf.248 = internal global i16 0, align 2
@subbitbuf = internal global i32 0, align 4
@bitcount = internal global i32 0, align 4
@inptr = dso_local global i32 0, align 4
@insize = dso_local global i32 0, align 4
@inbuf = dso_local global [32832 x i8] zeroinitializer, align 16
@decode.i = internal global i32 0, align 4
@d_buf = dso_local global [32768 x i16] zeroinitializer, align 16
@prev = dso_local global [65536 x i16] zeroinitializer, align 16
@outbuf = dso_local global [18432 x i8] zeroinitializer, align 16
@pt_len = internal global [19 x i8] zeroinitializer, align 16
@pt_table = internal global [256 x i16] zeroinitializer, align 16
@.str.249 = private unnamed_addr constant [11 x i8] c"Bad table\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %file_count = alloca i32, align 4
  %proglen = alloca i32, align 4
  %optc = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  %0 = load ptr, ptr %argv.addr, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %0, i64 0
  %1 = load ptr, ptr %arrayidx, align 8
  %call = call ptr @basename(ptr noundef %1)
  store ptr %call, ptr @progname, align 8
  %2 = load ptr, ptr @progname, align 8
  %call1 = call i64 @strlen(ptr noundef %2) #10
  %conv = trunc i64 %call1 to i32
  store i32 %conv, ptr %proglen, align 4
  %3 = load i32, ptr %proglen, align 4
  %cmp = icmp sgt i32 %3, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load ptr, ptr @progname, align 8
  %5 = load i32, ptr %proglen, align 4
  %idx.ext = sext i32 %5 to i64
  %add.ptr = getelementptr inbounds i8, ptr %4, i64 %idx.ext
  %add.ptr3 = getelementptr inbounds i8, ptr %add.ptr, i64 -4
  %call4 = call i32 @strcmp(ptr noundef %add.ptr3, ptr noundef @.str.23) #10
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = load ptr, ptr @progname, align 8
  %7 = load i32, ptr %proglen, align 4
  %sub = sub nsw i32 %7, 4
  %idxprom = sext i32 %sub to i64
  %arrayidx7 = getelementptr inbounds i8, ptr %6, i64 %idxprom
  store i8 0, ptr %arrayidx7, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %call8 = call ptr @add_envopt(ptr noundef %argc.addr, ptr noundef %argv.addr, ptr noundef @.str.24)
  store ptr %call8, ptr @env, align 8
  %8 = load ptr, ptr @env, align 8
  %cmp9 = icmp ne ptr %8, null
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  %9 = load ptr, ptr %argv.addr, align 8
  store ptr %9, ptr @args, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end
  %call13 = call ptr @signal(i32 noundef 2, ptr noundef inttoptr (i64 1 to ptr)) #11
  %cmp14 = icmp ne ptr %call13, inttoptr (i64 1 to ptr)
  %conv15 = zext i1 %cmp14 to i32
  store i32 %conv15, ptr @foreground, align 4
  %10 = load i32, ptr @foreground, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end12
  %call17 = call ptr @signal(i32 noundef 2, ptr noundef @abort_gzip) #11
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end12
  %call19 = call ptr @signal(i32 noundef 15, ptr noundef inttoptr (i64 1 to ptr)) #11
  %cmp20 = icmp ne ptr %call19, inttoptr (i64 1 to ptr)
  br i1 %cmp20, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.end18
  %call23 = call ptr @signal(i32 noundef 15, ptr noundef @abort_gzip) #11
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.end18
  %call25 = call ptr @signal(i32 noundef 1, ptr noundef inttoptr (i64 1 to ptr)) #11
  %cmp26 = icmp ne ptr %call25, inttoptr (i64 1 to ptr)
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end24
  %call29 = call ptr @signal(i32 noundef 1, ptr noundef @abort_gzip) #11
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end24
  %11 = load ptr, ptr @progname, align 8
  %call31 = call i32 @strncmp(ptr noundef %11, ptr noundef @.str.25, i64 noundef 2) #10
  %cmp32 = icmp eq i32 %call31, 0
  br i1 %cmp32, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end30
  %12 = load ptr, ptr @progname, align 8
  %call34 = call i32 @strncmp(ptr noundef %12, ptr noundef @.str.26, i64 noundef 3) #10
  %cmp35 = icmp eq i32 %call34, 0
  br i1 %cmp35, label %if.then37, label %if.else

if.then37:                                        ; preds = %lor.lhs.false, %if.end30
  store i32 1, ptr @decompress, align 4
  br label %if.end48

if.else:                                          ; preds = %lor.lhs.false
  %13 = load ptr, ptr @progname, align 8
  %add.ptr38 = getelementptr inbounds i8, ptr %13, i64 1
  %call39 = call i32 @strcmp(ptr noundef %add.ptr38, ptr noundef @.str.27) #10
  %cmp40 = icmp eq i32 %call39, 0
  br i1 %cmp40, label %if.then46, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %if.else
  %14 = load ptr, ptr @progname, align 8
  %call43 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.28) #10
  %cmp44 = icmp eq i32 %call43, 0
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %lor.lhs.false42, %if.else
  store i32 1, ptr @to_stdout, align 4
  store i32 1, ptr @decompress, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %lor.lhs.false42
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then37
  %call49 = call ptr @strncpy(ptr noundef @z_suffix, ptr noundef @.str.29, i64 noundef 30) #11
  %call50 = call i64 @strlen(ptr noundef @z_suffix) #10
  %conv51 = trunc i64 %call50 to i32
  store i32 %conv51, ptr @z_len, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end48
  %15 = load i32, ptr %argc.addr, align 4
  %16 = load ptr, ptr %argv.addr, align 8
  %call52 = call i32 @getopt_long(i32 noundef %15, ptr noundef %16, ptr noundef @.str.30, ptr noundef @longopts, ptr noundef null)
  store i32 %call52, ptr %optc, align 4
  %cmp53 = icmp ne i32 %call52, -1
  br i1 %cmp53, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %17 = load i32, ptr %optc, align 4
  switch i32 %17, label %sw.default [
    i32 97, label %sw.bb
    i32 98, label %sw.bb55
    i32 99, label %sw.bb57
    i32 100, label %sw.bb58
    i32 102, label %sw.bb59
    i32 104, label %sw.bb60
    i32 72, label %sw.bb60
    i32 63, label %sw.bb60
    i32 108, label %sw.bb61
    i32 76, label %sw.bb62
    i32 109, label %sw.bb63
    i32 77, label %sw.bb64
    i32 110, label %sw.bb65
    i32 78, label %sw.bb66
    i32 113, label %sw.bb67
    i32 114, label %sw.bb68
    i32 83, label %sw.bb69
    i32 116, label %sw.bb73
    i32 118, label %sw.bb74
    i32 86, label %sw.bb76
    i32 90, label %sw.bb77
    i32 49, label %sw.bb79
    i32 50, label %sw.bb79
    i32 51, label %sw.bb79
    i32 52, label %sw.bb79
    i32 53, label %sw.bb79
    i32 54, label %sw.bb79
    i32 55, label %sw.bb79
    i32 56, label %sw.bb79
    i32 57, label %sw.bb79
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, ptr @ascii, align 4
  br label %sw.epilog

sw.bb55:                                          ; preds = %while.body
  %18 = load ptr, ptr @optarg, align 8
  %call56 = call i32 @atoi(ptr noundef %18) #10
  store i32 %call56, ptr @maxbits, align 4
  br label %sw.epilog

sw.bb57:                                          ; preds = %while.body
  store i32 1, ptr @to_stdout, align 4
  br label %sw.epilog

sw.bb58:                                          ; preds = %while.body
  store i32 1, ptr @decompress, align 4
  br label %sw.epilog

sw.bb59:                                          ; preds = %while.body
  %19 = load i32, ptr @force, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, ptr @force, align 4
  br label %sw.epilog

sw.bb60:                                          ; preds = %while.body, %while.body, %while.body
  call void @help()
  call void @do_exit(i32 noundef 0)
  br label %sw.epilog

sw.bb61:                                          ; preds = %while.body
  store i32 1, ptr @to_stdout, align 4
  store i32 1, ptr @decompress, align 4
  store i32 1, ptr @list, align 4
  br label %sw.epilog

sw.bb62:                                          ; preds = %while.body
  call void @license()
  call void @do_exit(i32 noundef 0)
  br label %sw.epilog

sw.bb63:                                          ; preds = %while.body
  store i32 1, ptr @no_time, align 4
  br label %sw.epilog

sw.bb64:                                          ; preds = %while.body
  store i32 0, ptr @no_time, align 4
  br label %sw.epilog

sw.bb65:                                          ; preds = %while.body
  store i32 1, ptr @no_time, align 4
  store i32 1, ptr @no_name, align 4
  br label %sw.epilog

sw.bb66:                                          ; preds = %while.body
  store i32 0, ptr @no_time, align 4
  store i32 0, ptr @no_name, align 4
  br label %sw.epilog

sw.bb67:                                          ; preds = %while.body
  store i32 1, ptr @quiet, align 4
  store i32 0, ptr @verbose, align 4
  br label %sw.epilog

sw.bb68:                                          ; preds = %while.body
  store i32 1, ptr @recursive, align 4
  br label %sw.epilog

sw.bb69:                                          ; preds = %while.body
  %20 = load ptr, ptr @optarg, align 8
  %call70 = call i64 @strlen(ptr noundef %20) #10
  %conv71 = trunc i64 %call70 to i32
  store i32 %conv71, ptr @z_len, align 4
  %21 = load ptr, ptr @optarg, align 8
  %call72 = call ptr @strcpy(ptr noundef @z_suffix, ptr noundef %21) #11
  br label %sw.epilog

sw.bb73:                                          ; preds = %while.body
  store i32 1, ptr @to_stdout, align 4
  store i32 1, ptr @decompress, align 4
  store i32 1, ptr @test, align 4
  br label %sw.epilog

sw.bb74:                                          ; preds = %while.body
  %22 = load i32, ptr @verbose, align 4
  %inc75 = add nsw i32 %22, 1
  store i32 %inc75, ptr @verbose, align 4
  store i32 0, ptr @quiet, align 4
  br label %sw.epilog

sw.bb76:                                          ; preds = %while.body
  call void @version()
  call void @do_exit(i32 noundef 0)
  br label %sw.epilog

sw.bb77:                                          ; preds = %while.body
  %23 = load ptr, ptr @stderr, align 8
  %24 = load ptr, ptr @progname, align 8
  %call78 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.31, ptr noundef %24)
  call void @usage()
  call void @do_exit(i32 noundef 1)
  br label %sw.epilog

sw.bb79:                                          ; preds = %while.body, %while.body, %while.body, %while.body, %while.body, %while.body, %while.body, %while.body, %while.body
  %25 = load i32, ptr %optc, align 4
  %sub80 = sub nsw i32 %25, 48
  store i32 %sub80, ptr @level, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %while.body
  call void @usage()
  call void @do_exit(i32 noundef 1)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb79, %sw.bb77, %sw.bb76, %sw.bb74, %sw.bb73, %sw.bb69, %sw.bb68, %sw.bb67, %sw.bb66, %sw.bb65, %sw.bb64, %sw.bb63, %sw.bb62, %sw.bb61, %sw.bb60, %sw.bb59, %sw.bb58, %sw.bb57, %sw.bb55, %sw.bb
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %26 = load i32, ptr @no_time, align 4
  %cmp81 = icmp slt i32 %26, 0
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %while.end
  %27 = load i32, ptr @decompress, align 4
  store i32 %27, ptr @no_time, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %while.end
  %28 = load i32, ptr @no_name, align 4
  %cmp85 = icmp slt i32 %28, 0
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  %29 = load i32, ptr @decompress, align 4
  store i32 %29, ptr @no_name, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.end84
  %30 = load i32, ptr %argc.addr, align 4
  %31 = load i32, ptr @optind, align 4
  %sub89 = sub nsw i32 %30, %31
  store i32 %sub89, ptr %file_count, align 4
  %32 = load i32, ptr @ascii, align 4
  %tobool90 = icmp ne i32 %32, 0
  br i1 %tobool90, label %land.lhs.true91, label %if.end95

land.lhs.true91:                                  ; preds = %if.end88
  %33 = load i32, ptr @quiet, align 4
  %tobool92 = icmp ne i32 %33, 0
  br i1 %tobool92, label %if.end95, label %if.then93

if.then93:                                        ; preds = %land.lhs.true91
  %34 = load ptr, ptr @stderr, align 8
  %35 = load ptr, ptr @progname, align 8
  %call94 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %34, ptr noundef @.str.32, ptr noundef %35)
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %land.lhs.true91, %if.end88
  %36 = load i32, ptr @z_len, align 4
  %cmp96 = icmp eq i32 %36, 0
  br i1 %cmp96, label %land.lhs.true98, label %lor.lhs.false100

land.lhs.true98:                                  ; preds = %if.end95
  %37 = load i32, ptr @decompress, align 4
  %tobool99 = icmp ne i32 %37, 0
  br i1 %tobool99, label %lor.lhs.false100, label %if.then103

lor.lhs.false100:                                 ; preds = %land.lhs.true98, %if.end95
  %38 = load i32, ptr @z_len, align 4
  %cmp101 = icmp sgt i32 %38, 30
  br i1 %cmp101, label %if.then103, label %if.end105

if.then103:                                       ; preds = %lor.lhs.false100, %land.lhs.true98
  %39 = load ptr, ptr @stderr, align 8
  %40 = load ptr, ptr @progname, align 8
  %41 = load ptr, ptr @optarg, align 8
  %call104 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.33, ptr noundef %40, ptr noundef %41)
  call void @do_exit(i32 noundef 1)
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %lor.lhs.false100
  %42 = load i32, ptr @do_lzw, align 4
  %tobool106 = icmp ne i32 %42, 0
  br i1 %tobool106, label %land.lhs.true107, label %if.end110

land.lhs.true107:                                 ; preds = %if.end105
  %43 = load i32, ptr @decompress, align 4
  %tobool108 = icmp ne i32 %43, 0
  br i1 %tobool108, label %if.end110, label %if.then109

if.then109:                                       ; preds = %land.lhs.true107
  store ptr @lzw, ptr @work, align 8
  br label %if.end110

if.end110:                                        ; preds = %if.then109, %land.lhs.true107, %if.end105
  %44 = load i32, ptr %file_count, align 4
  %cmp111 = icmp ne i32 %44, 0
  br i1 %cmp111, label %if.then113, label %if.else133

if.then113:                                       ; preds = %if.end110
  %45 = load i32, ptr @to_stdout, align 4
  %tobool114 = icmp ne i32 %45, 0
  br i1 %tobool114, label %land.lhs.true115, label %if.end124

land.lhs.true115:                                 ; preds = %if.then113
  %46 = load i32, ptr @test, align 4
  %tobool116 = icmp ne i32 %46, 0
  br i1 %tobool116, label %if.end124, label %land.lhs.true117

land.lhs.true117:                                 ; preds = %land.lhs.true115
  %47 = load i32, ptr @list, align 4
  %tobool118 = icmp ne i32 %47, 0
  br i1 %tobool118, label %if.end124, label %land.lhs.true119

land.lhs.true119:                                 ; preds = %land.lhs.true117
  %48 = load i32, ptr @decompress, align 4
  %tobool120 = icmp ne i32 %48, 0
  br i1 %tobool120, label %lor.lhs.false121, label %if.then123

lor.lhs.false121:                                 ; preds = %land.lhs.true119
  %49 = load i32, ptr @ascii, align 4
  %tobool122 = icmp ne i32 %49, 0
  br i1 %tobool122, label %if.end124, label %if.then123

if.then123:                                       ; preds = %lor.lhs.false121, %land.lhs.true119
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %lor.lhs.false121, %land.lhs.true117, %land.lhs.true115, %if.then113
  br label %while.cond125

while.cond125:                                    ; preds = %while.body128, %if.end124
  %50 = load i32, ptr @optind, align 4
  %51 = load i32, ptr %argc.addr, align 4
  %cmp126 = icmp slt i32 %50, %51
  br i1 %cmp126, label %while.body128, label %while.end132

while.body128:                                    ; preds = %while.cond125
  %52 = load ptr, ptr %argv.addr, align 8
  %53 = load i32, ptr @optind, align 4
  %inc129 = add nsw i32 %53, 1
  store i32 %inc129, ptr @optind, align 4
  %idxprom130 = sext i32 %53 to i64
  %arrayidx131 = getelementptr inbounds ptr, ptr %52, i64 %idxprom130
  %54 = load ptr, ptr %arrayidx131, align 8
  call void @treat_file(ptr noundef %54)
  br label %while.cond125, !llvm.loop !8

while.end132:                                     ; preds = %while.cond125
  br label %if.end134

if.else133:                                       ; preds = %if.end110
  call void @treat_stdin()
  br label %if.end134

if.end134:                                        ; preds = %if.else133, %while.end132
  %55 = load i32, ptr @list, align 4
  %tobool135 = icmp ne i32 %55, 0
  br i1 %tobool135, label %land.lhs.true136, label %if.end142

land.lhs.true136:                                 ; preds = %if.end134
  %56 = load i32, ptr @quiet, align 4
  %tobool137 = icmp ne i32 %56, 0
  br i1 %tobool137, label %if.end142, label %land.lhs.true138

land.lhs.true138:                                 ; preds = %land.lhs.true136
  %57 = load i32, ptr %file_count, align 4
  %cmp139 = icmp sgt i32 %57, 1
  br i1 %cmp139, label %if.then141, label %if.end142

if.then141:                                       ; preds = %land.lhs.true138
  call void @do_list(i32 noundef -1, i32 noundef -1)
  br label %if.end142

if.end142:                                        ; preds = %if.then141, %land.lhs.true138, %land.lhs.true136, %if.end134
  %58 = load i32, ptr @exit_code, align 4
  call void @do_exit(i32 noundef %58)
  %59 = load i32, ptr @exit_code, align 4
  ret i32 %59
}

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @signal(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @abort_gzip() #0 {
entry:
  %0 = load i32, ptr @remove_ofname, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, ptr @ofd, align 4
  %call = call i32 @close(i32 noundef %1)
  %call1 = call i32 @unlink(ptr noundef @ofname) #11
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @do_exit(i32 noundef 1)
  ret void
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

declare i32 @getopt_long(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @help() #0 {
entry:
  %p = alloca ptr, align 8
  store ptr @help.help_msg, ptr %p, align 8
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.51, ptr noundef %1, ptr noundef @.str.52, ptr noundef @.str.53)
  call void @usage()
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load ptr, ptr %p, align 8
  %3 = load ptr, ptr %2, align 8
  %tobool = icmp ne ptr %3, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load ptr, ptr @stderr, align 8
  %5 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds ptr, ptr %5, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %6 = load ptr, ptr %5, align 8
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str.54, ptr noundef %6)
  br label %while.cond, !llvm.loop !9

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @do_exit(i32 noundef %exitcode) #0 {
entry:
  %exitcode.addr = alloca i32, align 4
  store i32 %exitcode, ptr %exitcode.addr, align 4
  %0 = load i32, ptr @do_exit.in_exit, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %exitcode.addr, align 4
  call void @exit(i32 noundef %1) #12
  unreachable

if.end:                                           ; preds = %entry
  store i32 1, ptr @do_exit.in_exit, align 4
  %2 = load ptr, ptr @env, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %3 = load ptr, ptr @env, align 8
  call void @free(ptr noundef %3) #11
  store ptr null, ptr @env, align 8
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %4 = load ptr, ptr @args, align 8
  %cmp3 = icmp ne ptr %4, null
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  %5 = load ptr, ptr @args, align 8
  call void @free(ptr noundef %5) #11
  store ptr null, ptr @args, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end2
  %6 = load i32, ptr %exitcode.addr, align 4
  call void @exit(i32 noundef %6) #12
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @license() #0 {
entry:
  %p = alloca ptr, align 8
  store ptr @license_msg, ptr %p, align 8
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.51, ptr noundef %1, ptr noundef @.str.52, ptr noundef @.str.53)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load ptr, ptr %p, align 8
  %3 = load ptr, ptr %2, align 8
  %tobool = icmp ne ptr %3, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load ptr, ptr @stderr, align 8
  %5 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds ptr, ptr %5, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %6 = load ptr, ptr %5, align 8
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str.54, ptr noundef %6)
  br label %while.cond, !llvm.loop !10

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @version() #0 {
entry:
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.51, ptr noundef %1, ptr noundef @.str.52, ptr noundef @.str.53)
  %2 = load ptr, ptr @stderr, align 8
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.68, ptr noundef @.str.69, ptr noundef @.str.70)
  %3 = load ptr, ptr @stderr, align 8
  %call2 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.71)
  %4 = load ptr, ptr @stderr, align 8
  %call3 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str.72)
  %5 = load ptr, ptr @stderr, align 8
  %call4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.73)
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @usage() #0 {
entry:
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.74, ptr noundef %1, ptr noundef @.str.60, ptr noundef @.str.75)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @treat_file(ptr noundef %iname) #0 {
entry:
  %iname.addr = alloca ptr, align 8
  %cflag = alloca i32, align 4
  %st = alloca %struct.stat, align 8
  store ptr %iname, ptr %iname.addr, align 8
  %0 = load ptr, ptr %iname.addr, align 8
  %call = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.99) #10
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, ptr @to_stdout, align 4
  store i32 %1, ptr %cflag, align 4
  call void @treat_stdin()
  %2 = load i32, ptr %cflag, align 4
  store i32 %2, ptr @to_stdout, align 4
  br label %if.end183

if.end:                                           ; preds = %entry
  %3 = load ptr, ptr %iname.addr, align 8
  %call1 = call i32 @get_istat(ptr noundef %3, ptr noundef @istat)
  %cmp2 = icmp ne i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %if.end183

if.end4:                                          ; preds = %if.end
  %4 = load i32, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 3), align 8
  %and = and i32 %4, 61440
  %cmp5 = icmp eq i32 %and, 16384
  br i1 %cmp5, label %if.then6, label %if.end16

if.then6:                                         ; preds = %if.end4
  %5 = load i32, ptr @recursive, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %st, ptr align 8 @istat, i64 144, i1 false)
  %6 = load ptr, ptr %iname.addr, align 8
  call void @treat_dir(ptr noundef %6)
  %7 = load ptr, ptr %iname.addr, align 8
  call void @reset_times(ptr noundef %7, ptr noundef %st)
  br label %if.end15

if.else:                                          ; preds = %if.then6
  %8 = load i32, ptr @quiet, align 4
  %tobool8 = icmp ne i32 %8, 0
  br i1 %tobool8, label %if.end11, label %if.then9

if.then9:                                         ; preds = %if.else
  %9 = load ptr, ptr @stderr, align 8
  %10 = load ptr, ptr @progname, align 8
  %call10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.100, ptr noundef %10, ptr noundef @ifname)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.else
  %11 = load i32, ptr @exit_code, align 4
  %cmp12 = icmp eq i32 %11, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end11
  store i32 2, ptr @exit_code, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end11
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then7
  br label %if.end183

if.end16:                                         ; preds = %if.end4
  %12 = load i32, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 3), align 8
  %and17 = and i32 %12, 61440
  %cmp18 = icmp eq i32 %and17, 32768
  br i1 %cmp18, label %if.end27, label %if.then19

if.then19:                                        ; preds = %if.end16
  %13 = load i32, ptr @quiet, align 4
  %tobool20 = icmp ne i32 %13, 0
  br i1 %tobool20, label %if.end23, label %if.then21

if.then21:                                        ; preds = %if.then19
  %14 = load ptr, ptr @stderr, align 8
  %15 = load ptr, ptr @progname, align 8
  %call22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.101, ptr noundef %15, ptr noundef @ifname)
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.then19
  %16 = load i32, ptr @exit_code, align 4
  %cmp24 = icmp eq i32 %16, 0
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  store i32 2, ptr @exit_code, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  br label %if.end183

if.end27:                                         ; preds = %if.end16
  %17 = load i64, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 2), align 8
  %cmp28 = icmp ugt i64 %17, 1
  br i1 %cmp28, label %land.lhs.true, label %if.end43

land.lhs.true:                                    ; preds = %if.end27
  %18 = load i32, ptr @to_stdout, align 4
  %tobool29 = icmp ne i32 %18, 0
  br i1 %tobool29, label %if.end43, label %land.lhs.true30

land.lhs.true30:                                  ; preds = %land.lhs.true
  %19 = load i32, ptr @force, align 4
  %tobool31 = icmp ne i32 %19, 0
  br i1 %tobool31, label %if.end43, label %if.then32

if.then32:                                        ; preds = %land.lhs.true30
  %20 = load i32, ptr @quiet, align 4
  %tobool33 = icmp ne i32 %20, 0
  br i1 %tobool33, label %if.end38, label %if.then34

if.then34:                                        ; preds = %if.then32
  %21 = load ptr, ptr @stderr, align 8
  %22 = load ptr, ptr @progname, align 8
  %23 = load i64, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 2), align 8
  %conv = trunc i64 %23 to i32
  %sub = sub nsw i32 %conv, 1
  %24 = load i64, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 2), align 8
  %cmp35 = icmp ugt i64 %24, 2
  %25 = zext i1 %cmp35 to i64
  %cond = select i1 %cmp35, i32 115, i32 32
  %call37 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.102, ptr noundef %22, ptr noundef @ifname, i32 noundef %sub, i32 noundef %cond)
  br label %if.end38

if.end38:                                         ; preds = %if.then34, %if.then32
  %26 = load i32, ptr @exit_code, align 4
  %cmp39 = icmp eq i32 %26, 0
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end38
  store i32 2, ptr @exit_code, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.end38
  br label %if.end183

if.end43:                                         ; preds = %land.lhs.true30, %land.lhs.true, %if.end27
  %27 = load i64, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 8), align 8
  store i64 %27, ptr @ifile_size, align 8
  %28 = load i32, ptr @no_time, align 4
  %tobool44 = icmp ne i32 %28, 0
  br i1 %tobool44, label %land.lhs.true45, label %cond.false

land.lhs.true45:                                  ; preds = %if.end43
  %29 = load i32, ptr @list, align 4
  %tobool46 = icmp ne i32 %29, 0
  br i1 %tobool46, label %cond.false, label %cond.true

cond.true:                                        ; preds = %land.lhs.true45
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true45, %if.end43
  %30 = load i64, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 12), align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond47 = phi i64 [ 0, %cond.true ], [ %30, %cond.false ]
  store i64 %cond47, ptr @time_stamp, align 8
  %31 = load i32, ptr @to_stdout, align 4
  %tobool48 = icmp ne i32 %31, 0
  br i1 %tobool48, label %land.lhs.true49, label %if.else55

land.lhs.true49:                                  ; preds = %cond.end
  %32 = load i32, ptr @list, align 4
  %tobool50 = icmp ne i32 %32, 0
  br i1 %tobool50, label %if.else55, label %land.lhs.true51

land.lhs.true51:                                  ; preds = %land.lhs.true49
  %33 = load i32, ptr @test, align 4
  %tobool52 = icmp ne i32 %33, 0
  br i1 %tobool52, label %if.else55, label %if.then53

if.then53:                                        ; preds = %land.lhs.true51
  %call54 = call ptr @strcpy(ptr noundef @ofname, ptr noundef @.str.2) #11
  br label %if.end61

if.else55:                                        ; preds = %land.lhs.true51, %land.lhs.true49, %cond.end
  %call56 = call i32 @make_ofname()
  %cmp57 = icmp ne i32 %call56, 0
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.else55
  br label %if.end183

if.end60:                                         ; preds = %if.else55
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.then53
  %34 = load i32, ptr @ascii, align 4
  %tobool62 = icmp ne i32 %34, 0
  br i1 %tobool62, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end61
  %35 = load i32, ptr @decompress, align 4
  %tobool63 = icmp ne i32 %35, 0
  %lnot = xor i1 %tobool63, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end61
  %36 = phi i1 [ false, %if.end61 ], [ %lnot, %land.rhs ]
  %37 = zext i1 %36 to i64
  %cond64 = select i1 %36, i32 0, i32 0
  %call65 = call i32 (ptr, i32, ...) @open(ptr noundef @ifname, i32 noundef %cond64, i32 noundef 384)
  store i32 %call65, ptr @ifd, align 4
  %38 = load i32, ptr @ifd, align 4
  %cmp66 = icmp eq i32 %38, -1
  br i1 %cmp66, label %if.then68, label %if.end70

if.then68:                                        ; preds = %land.end
  %39 = load ptr, ptr @stderr, align 8
  %40 = load ptr, ptr @progname, align 8
  %call69 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.103, ptr noundef %40)
  call void @perror(ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  br label %if.end183

if.end70:                                         ; preds = %land.end
  call void @clear_bufs()
  store i32 0, ptr @part_nb, align 4
  %41 = load i32, ptr @decompress, align 4
  %tobool71 = icmp ne i32 %41, 0
  br i1 %tobool71, label %if.then72, label %if.end79

if.then72:                                        ; preds = %if.end70
  %42 = load i32, ptr @ifd, align 4
  %call73 = call i32 @get_method(i32 noundef %42)
  store i32 %call73, ptr @method, align 4
  %43 = load i32, ptr @method, align 4
  %cmp74 = icmp slt i32 %43, 0
  br i1 %cmp74, label %if.then76, label %if.end78

if.then76:                                        ; preds = %if.then72
  %44 = load i32, ptr @ifd, align 4
  %call77 = call i32 @close(i32 noundef %44)
  br label %if.end183

if.end78:                                         ; preds = %if.then72
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.end70
  %45 = load i32, ptr @list, align 4
  %tobool80 = icmp ne i32 %45, 0
  br i1 %tobool80, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.end79
  %46 = load i32, ptr @ifd, align 4
  %47 = load i32, ptr @method, align 4
  call void @do_list(i32 noundef %46, i32 noundef %47)
  %48 = load i32, ptr @ifd, align 4
  %call82 = call i32 @close(i32 noundef %48)
  br label %if.end183

if.end83:                                         ; preds = %if.end79
  %49 = load i32, ptr @to_stdout, align 4
  %tobool84 = icmp ne i32 %49, 0
  br i1 %tobool84, label %if.then85, label %if.else87

if.then85:                                        ; preds = %if.end83
  %50 = load ptr, ptr @stdout, align 8
  %call86 = call i32 @fileno(ptr noundef %50) #11
  store i32 %call86, ptr @ofd, align 4
  br label %if.end103

if.else87:                                        ; preds = %if.end83
  %call88 = call i32 @create_outfile()
  %cmp89 = icmp ne i32 %call88, 0
  br i1 %cmp89, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.else87
  br label %if.end183

if.end92:                                         ; preds = %if.else87
  %51 = load i32, ptr @decompress, align 4
  %tobool93 = icmp ne i32 %51, 0
  br i1 %tobool93, label %if.end102, label %land.lhs.true94

land.lhs.true94:                                  ; preds = %if.end92
  %52 = load i32, ptr @save_orig_name, align 4
  %tobool95 = icmp ne i32 %52, 0
  br i1 %tobool95, label %land.lhs.true96, label %if.end102

land.lhs.true96:                                  ; preds = %land.lhs.true94
  %53 = load i32, ptr @verbose, align 4
  %tobool97 = icmp ne i32 %53, 0
  br i1 %tobool97, label %if.end102, label %land.lhs.true98

land.lhs.true98:                                  ; preds = %land.lhs.true96
  %54 = load i32, ptr @quiet, align 4
  %tobool99 = icmp ne i32 %54, 0
  br i1 %tobool99, label %if.end102, label %if.then100

if.then100:                                       ; preds = %land.lhs.true98
  %55 = load ptr, ptr @stderr, align 8
  %56 = load ptr, ptr @progname, align 8
  %call101 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %55, ptr noundef @.str.104, ptr noundef %56, ptr noundef @ifname, ptr noundef @ofname)
  br label %if.end102

if.end102:                                        ; preds = %if.then100, %land.lhs.true98, %land.lhs.true96, %land.lhs.true94, %if.end92
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.then85
  %57 = load i32, ptr @save_orig_name, align 4
  %tobool104 = icmp ne i32 %57, 0
  br i1 %tobool104, label %if.end108, label %if.then105

if.then105:                                       ; preds = %if.end103
  %58 = load i32, ptr @no_name, align 4
  %tobool106 = icmp ne i32 %58, 0
  %lnot107 = xor i1 %tobool106, true
  %lnot.ext = zext i1 %lnot107 to i32
  store i32 %lnot.ext, ptr @save_orig_name, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then105, %if.end103
  %59 = load i32, ptr @verbose, align 4
  %tobool109 = icmp ne i32 %59, 0
  br i1 %tobool109, label %if.then110, label %if.end125

if.then110:                                       ; preds = %if.end108
  %60 = load ptr, ptr @stderr, align 8
  %call111 = call i64 @strlen(ptr noundef @ifname) #10
  %conv112 = trunc i64 %call111 to i32
  %cmp113 = icmp sge i32 %conv112, 15
  br i1 %cmp113, label %cond.true115, label %cond.false116

cond.true115:                                     ; preds = %if.then110
  br label %cond.end122

cond.false116:                                    ; preds = %if.then110
  %call117 = call i64 @strlen(ptr noundef @ifname) #10
  %conv118 = trunc i64 %call117 to i32
  %cmp119 = icmp sge i32 %conv118, 7
  %61 = zext i1 %cmp119 to i64
  %cond121 = select i1 %cmp119, ptr @.str.106, ptr @.str.107
  br label %cond.end122

cond.end122:                                      ; preds = %cond.false116, %cond.true115
  %cond123 = phi ptr [ @.str.60, %cond.true115 ], [ %cond121, %cond.false116 ]
  %call124 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %60, ptr noundef @.str.105, ptr noundef @ifname, ptr noundef %cond123)
  br label %if.end125

if.end125:                                        ; preds = %cond.end122, %if.end108
  br label %for.cond

for.cond:                                         ; preds = %if.end142, %if.end125
  %62 = load ptr, ptr @work, align 8
  %63 = load i32, ptr @ifd, align 4
  %64 = load i32, ptr @ofd, align 4
  %call126 = call i32 %62(i32 noundef %63, i32 noundef %64)
  %cmp127 = icmp ne i32 %call126, 0
  br i1 %cmp127, label %if.then129, label %if.end130

if.then129:                                       ; preds = %for.cond
  store i32 -1, ptr @method, align 4
  br label %for.end

if.end130:                                        ; preds = %for.cond
  %65 = load i32, ptr @decompress, align 4
  %tobool131 = icmp ne i32 %65, 0
  br i1 %tobool131, label %lor.lhs.false, label %if.then136

lor.lhs.false:                                    ; preds = %if.end130
  %66 = load i32, ptr @last_member, align 4
  %tobool132 = icmp ne i32 %66, 0
  br i1 %tobool132, label %if.then136, label %lor.lhs.false133

lor.lhs.false133:                                 ; preds = %lor.lhs.false
  %67 = load i32, ptr @inptr, align 4
  %68 = load i32, ptr @insize, align 4
  %cmp134 = icmp eq i32 %67, %68
  br i1 %cmp134, label %if.then136, label %if.end137

if.then136:                                       ; preds = %lor.lhs.false133, %lor.lhs.false, %if.end130
  br label %for.end

if.end137:                                        ; preds = %lor.lhs.false133
  %69 = load i32, ptr @ifd, align 4
  %call138 = call i32 @get_method(i32 noundef %69)
  store i32 %call138, ptr @method, align 4
  %70 = load i32, ptr @method, align 4
  %cmp139 = icmp slt i32 %70, 0
  br i1 %cmp139, label %if.then141, label %if.end142

if.then141:                                       ; preds = %if.end137
  br label %for.end

if.end142:                                        ; preds = %if.end137
  store i64 0, ptr @bytes_out, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then141, %if.then136, %if.then129
  %71 = load i32, ptr @ifd, align 4
  %call143 = call i32 @close(i32 noundef %71)
  %72 = load i32, ptr @to_stdout, align 4
  %tobool144 = icmp ne i32 %72, 0
  br i1 %tobool144, label %if.end149, label %land.lhs.true145

land.lhs.true145:                                 ; preds = %for.end
  %73 = load i32, ptr @ofd, align 4
  %call146 = call i32 @close(i32 noundef %73)
  %tobool147 = icmp ne i32 %call146, 0
  br i1 %tobool147, label %if.then148, label %if.end149

if.then148:                                       ; preds = %land.lhs.true145
  call void @write_error()
  br label %if.end149

if.end149:                                        ; preds = %if.then148, %land.lhs.true145, %for.end
  %74 = load i32, ptr @method, align 4
  %cmp150 = icmp eq i32 %74, -1
  br i1 %cmp150, label %if.then152, label %if.end157

if.then152:                                       ; preds = %if.end149
  %75 = load i32, ptr @to_stdout, align 4
  %tobool153 = icmp ne i32 %75, 0
  br i1 %tobool153, label %if.end156, label %if.then154

if.then154:                                       ; preds = %if.then152
  %call155 = call i32 @unlink(ptr noundef @ofname) #11
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %if.then152
  br label %if.end183

if.end157:                                        ; preds = %if.end149
  %76 = load i32, ptr @verbose, align 4
  %tobool158 = icmp ne i32 %76, 0
  br i1 %tobool158, label %if.then159, label %if.end180

if.then159:                                       ; preds = %if.end157
  %77 = load i32, ptr @test, align 4
  %tobool160 = icmp ne i32 %77, 0
  br i1 %tobool160, label %if.then161, label %if.else163

if.then161:                                       ; preds = %if.then159
  %78 = load ptr, ptr @stderr, align 8
  %call162 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %78, ptr noundef @.str.108)
  br label %if.end172

if.else163:                                       ; preds = %if.then159
  %79 = load i32, ptr @decompress, align 4
  %tobool164 = icmp ne i32 %79, 0
  br i1 %tobool164, label %if.then165, label %if.else168

if.then165:                                       ; preds = %if.else163
  %80 = load i64, ptr @bytes_out, align 8
  %81 = load i64, ptr @bytes_in, align 8
  %82 = load i64, ptr @header_bytes, align 8
  %sub166 = sub nsw i64 %81, %82
  %sub167 = sub nsw i64 %80, %sub166
  %83 = load i64, ptr @bytes_out, align 8
  %84 = load ptr, ptr @stderr, align 8
  call void @display_ratio(i64 noundef %sub167, i64 noundef %83, ptr noundef %84)
  br label %if.end171

if.else168:                                       ; preds = %if.else163
  %85 = load i64, ptr @bytes_in, align 8
  %86 = load i64, ptr @bytes_out, align 8
  %87 = load i64, ptr @header_bytes, align 8
  %sub169 = sub nsw i64 %86, %87
  %sub170 = sub nsw i64 %85, %sub169
  %88 = load i64, ptr @bytes_in, align 8
  %89 = load ptr, ptr @stderr, align 8
  call void @display_ratio(i64 noundef %sub170, i64 noundef %88, ptr noundef %89)
  br label %if.end171

if.end171:                                        ; preds = %if.else168, %if.then165
  br label %if.end172

if.end172:                                        ; preds = %if.end171, %if.then161
  %90 = load i32, ptr @test, align 4
  %tobool173 = icmp ne i32 %90, 0
  br i1 %tobool173, label %if.end178, label %land.lhs.true174

land.lhs.true174:                                 ; preds = %if.end172
  %91 = load i32, ptr @to_stdout, align 4
  %tobool175 = icmp ne i32 %91, 0
  br i1 %tobool175, label %if.end178, label %if.then176

if.then176:                                       ; preds = %land.lhs.true174
  %92 = load ptr, ptr @stderr, align 8
  %call177 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %92, ptr noundef @.str.109, ptr noundef @ofname)
  br label %if.end178

if.end178:                                        ; preds = %if.then176, %land.lhs.true174, %if.end172
  %93 = load ptr, ptr @stderr, align 8
  %call179 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %93, ptr noundef @.str.73)
  br label %if.end180

if.end180:                                        ; preds = %if.end178, %if.end157
  %94 = load i32, ptr @to_stdout, align 4
  %tobool181 = icmp ne i32 %94, 0
  br i1 %tobool181, label %if.end183, label %if.then182

if.then182:                                       ; preds = %if.end180
  call void @copy_stat(ptr noundef @istat)
  br label %if.end183

if.end183:                                        ; preds = %if.then, %if.then3, %if.end15, %if.end26, %if.end42, %if.then59, %if.then68, %if.then76, %if.then81, %if.then91, %if.end156, %if.then182, %if.end180
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @treat_stdin() #0 {
entry:
  %0 = load i32, ptr @force, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr @list, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.end, label %land.lhs.true2

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, ptr @decompress, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true2
  %3 = load ptr, ptr @stdin, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true2
  %4 = load ptr, ptr @stdout, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %3, %cond.true ], [ %4, %cond.false ]
  %call = call i32 @fileno(ptr noundef %cond) #11
  %call4 = call i32 @isatty(i32 noundef %call) #11
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %5 = load ptr, ptr @stderr, align 8
  %6 = load ptr, ptr @progname, align 8
  %7 = load i32, ptr @decompress, align 4
  %tobool6 = icmp ne i32 %7, 0
  %8 = zext i1 %tobool6 to i64
  %cond7 = select i1 %tobool6, ptr @.str.77, ptr @.str.78
  %9 = load i32, ptr @decompress, align 4
  %tobool8 = icmp ne i32 %9, 0
  %10 = zext i1 %tobool8 to i64
  %cond9 = select i1 %tobool8, ptr @.str.79, ptr @.str.60
  %call10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.76, ptr noundef %6, ptr noundef %cond7, ptr noundef %cond9)
  %11 = load ptr, ptr @stderr, align 8
  %12 = load ptr, ptr @progname, align 8
  %call11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str.80, ptr noundef %12)
  call void @do_exit(i32 noundef 1)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end, %land.lhs.true, %entry
  %13 = load i32, ptr @decompress, align 4
  %tobool12 = icmp ne i32 %13, 0
  br i1 %tobool12, label %if.then14, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %14 = load i32, ptr @ascii, align 4
  %tobool13 = icmp ne i32 %14, 0
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %lor.lhs.false, %if.end
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %lor.lhs.false
  %15 = load i32, ptr @test, align 4
  %tobool16 = icmp ne i32 %15, 0
  br i1 %tobool16, label %if.end24, label %land.lhs.true17

land.lhs.true17:                                  ; preds = %if.end15
  %16 = load i32, ptr @list, align 4
  %tobool18 = icmp ne i32 %16, 0
  br i1 %tobool18, label %if.end24, label %land.lhs.true19

land.lhs.true19:                                  ; preds = %land.lhs.true17
  %17 = load i32, ptr @decompress, align 4
  %tobool20 = icmp ne i32 %17, 0
  br i1 %tobool20, label %lor.lhs.false21, label %if.then23

lor.lhs.false21:                                  ; preds = %land.lhs.true19
  %18 = load i32, ptr @ascii, align 4
  %tobool22 = icmp ne i32 %18, 0
  br i1 %tobool22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %lor.lhs.false21, %land.lhs.true19
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %lor.lhs.false21, %land.lhs.true17, %if.end15
  %call25 = call ptr @strcpy(ptr noundef @ifname, ptr noundef @.str.81) #11
  %call26 = call ptr @strcpy(ptr noundef @ofname, ptr noundef @.str.2) #11
  store i64 0, ptr @time_stamp, align 8
  %19 = load i32, ptr @list, align 4
  %tobool27 = icmp ne i32 %19, 0
  br i1 %tobool27, label %if.then30, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.end24
  %20 = load i32, ptr @no_time, align 4
  %tobool29 = icmp ne i32 %20, 0
  br i1 %tobool29, label %if.end35, label %if.then30

if.then30:                                        ; preds = %lor.lhs.false28, %if.end24
  %21 = load ptr, ptr @stdin, align 8
  %call31 = call i32 @fileno(ptr noundef %21) #11
  %call32 = call i32 @fstat(i32 noundef %call31, ptr noundef @istat) #11
  %cmp = icmp ne i32 %call32, 0
  br i1 %cmp, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.then30
  call void @error(ptr noundef @.str.82)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.then30
  %22 = load i64, ptr getelementptr inbounds (%struct.stat, ptr @istat, i32 0, i32 12), align 8
  store i64 %22, ptr @time_stamp, align 8
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %lor.lhs.false28
  store i64 -1, ptr @ifile_size, align 8
  call void @clear_bufs()
  store i32 1, ptr @to_stdout, align 4
  store i32 0, ptr @part_nb, align 4
  %23 = load i32, ptr @decompress, align 4
  %tobool36 = icmp ne i32 %23, 0
  br i1 %tobool36, label %if.then37, label %if.end42

if.then37:                                        ; preds = %if.end35
  %24 = load i32, ptr @ifd, align 4
  %call38 = call i32 @get_method(i32 noundef %24)
  store i32 %call38, ptr @method, align 4
  %25 = load i32, ptr @method, align 4
  %cmp39 = icmp slt i32 %25, 0
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.then37
  %26 = load i32, ptr @exit_code, align 4
  call void @do_exit(i32 noundef %26)
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.then37
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end35
  %27 = load i32, ptr @list, align 4
  %tobool43 = icmp ne i32 %27, 0
  br i1 %tobool43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end42
  %28 = load i32, ptr @ifd, align 4
  %29 = load i32, ptr @method, align 4
  call void @do_list(i32 noundef %28, i32 noundef %29)
  br label %if.end74

if.end45:                                         ; preds = %if.end42
  br label %for.cond

for.cond:                                         ; preds = %if.end62, %if.end45
  %30 = load ptr, ptr @work, align 8
  %31 = load ptr, ptr @stdin, align 8
  %call46 = call i32 @fileno(ptr noundef %31) #11
  %32 = load ptr, ptr @stdout, align 8
  %call47 = call i32 @fileno(ptr noundef %32) #11
  %call48 = call i32 %30(i32 noundef %call46, i32 noundef %call47)
  %cmp49 = icmp ne i32 %call48, 0
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %for.cond
  br label %if.end74

if.end51:                                         ; preds = %for.cond
  %33 = load i32, ptr @decompress, align 4
  %tobool52 = icmp ne i32 %33, 0
  br i1 %tobool52, label %lor.lhs.false53, label %if.then57

lor.lhs.false53:                                  ; preds = %if.end51
  %34 = load i32, ptr @last_member, align 4
  %tobool54 = icmp ne i32 %34, 0
  br i1 %tobool54, label %if.then57, label %lor.lhs.false55

lor.lhs.false55:                                  ; preds = %lor.lhs.false53
  %35 = load i32, ptr @inptr, align 4
  %36 = load i32, ptr @insize, align 4
  %cmp56 = icmp eq i32 %35, %36
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %lor.lhs.false55, %lor.lhs.false53, %if.end51
  br label %for.end

if.end58:                                         ; preds = %lor.lhs.false55
  %37 = load i32, ptr @ifd, align 4
  %call59 = call i32 @get_method(i32 noundef %37)
  store i32 %call59, ptr @method, align 4
  %38 = load i32, ptr @method, align 4
  %cmp60 = icmp slt i32 %38, 0
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end58
  br label %if.end74

if.end62:                                         ; preds = %if.end58
  store i64 0, ptr @bytes_out, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then57
  %39 = load i32, ptr @verbose, align 4
  %tobool63 = icmp ne i32 %39, 0
  br i1 %tobool63, label %if.then64, label %if.end74

if.then64:                                        ; preds = %for.end
  %40 = load i32, ptr @test, align 4
  %tobool65 = icmp ne i32 %40, 0
  br i1 %tobool65, label %if.then66, label %if.else

if.then66:                                        ; preds = %if.then64
  %41 = load ptr, ptr @stderr, align 8
  %call67 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.83)
  br label %if.end73

if.else:                                          ; preds = %if.then64
  %42 = load i32, ptr @decompress, align 4
  %tobool68 = icmp ne i32 %42, 0
  br i1 %tobool68, label %if.end72, label %if.then69

if.then69:                                        ; preds = %if.else
  %43 = load i64, ptr @bytes_in, align 8
  %44 = load i64, ptr @bytes_out, align 8
  %45 = load i64, ptr @header_bytes, align 8
  %sub = sub nsw i64 %44, %45
  %sub70 = sub nsw i64 %43, %sub
  %46 = load i64, ptr @bytes_in, align 8
  %47 = load ptr, ptr @stderr, align 8
  call void @display_ratio(i64 noundef %sub70, i64 noundef %46, ptr noundef %47)
  %48 = load ptr, ptr @stderr, align 8
  %call71 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %48, ptr noundef @.str.73)
  br label %if.end72

if.end72:                                         ; preds = %if.then69, %if.else
  br label %if.end73

if.end73:                                         ; preds = %if.end72, %if.then66
  br label %if.end74

if.end74:                                         ; preds = %if.then44, %if.then50, %if.then61, %if.end73, %for.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @do_list(i32 noundef %ifd, i32 noundef %method) #0 {
entry:
  %ifd.addr = alloca i32, align 4
  %method.addr = alloca i32, align 4
  %crc = alloca i64, align 8
  %date = alloca ptr, align 8
  %buf = alloca [8 x i8], align 1
  store i32 %ifd, ptr %ifd.addr, align 4
  store i32 %method, ptr %method.addr, align 4
  %0 = load i32, ptr @do_list.first_time, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr %method.addr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32 0, ptr @do_list.first_time, align 4
  %2 = load i32, ptr @verbose, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.141)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %3 = load i32, ptr @quiet, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.142)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  br label %if.end25

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, ptr %method.addr, align 4
  %cmp7 = icmp slt i32 %4, 0
  br i1 %cmp7, label %if.then8, label %if.end24

if.then8:                                         ; preds = %if.else
  %5 = load i64, ptr @total_in, align 8
  %cmp9 = icmp sle i64 %5, 0
  br i1 %cmp9, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then8
  %6 = load i64, ptr @total_out, align 8
  %cmp10 = icmp sle i64 %6, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %lor.lhs.false, %if.then8
  br label %return

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, ptr @verbose, align 4
  %tobool13 = icmp ne i32 %7, 0
  br i1 %tobool13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.end12
  %8 = load i64, ptr @total_in, align 8
  %9 = load i64, ptr @total_out, align 8
  %call15 = call i32 (ptr, ...) @printf(ptr noundef @.str.143, i64 noundef %8, i64 noundef %9)
  br label %if.end21

if.else16:                                        ; preds = %if.end12
  %10 = load i32, ptr @quiet, align 4
  %tobool17 = icmp ne i32 %10, 0
  br i1 %tobool17, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.else16
  %11 = load i64, ptr @total_in, align 8
  %12 = load i64, ptr @total_out, align 8
  %call19 = call i32 (ptr, ...) @printf(ptr noundef @.str.144, i64 noundef %11, i64 noundef %12)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.else16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then14
  %13 = load i64, ptr @total_out, align 8
  %14 = load i64, ptr @total_in, align 8
  %15 = load i64, ptr @header_bytes, align 8
  %sub = sub nsw i64 %14, %15
  %sub22 = sub nsw i64 %13, %sub
  %16 = load i64, ptr @total_out, align 8
  %17 = load ptr, ptr @stdout, align 8
  call void @display_ratio(i64 noundef %sub22, i64 noundef %16, ptr noundef %17)
  %call23 = call i32 (ptr, ...) @printf(ptr noundef @.str.145)
  br label %return

if.end24:                                         ; preds = %if.else
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.end6
  store i64 -1, ptr %crc, align 8
  store i64 -1, ptr @bytes_out, align 8
  %18 = load i64, ptr @ifile_size, align 8
  store i64 %18, ptr @bytes_in, align 8
  %19 = load i32, ptr %method.addr, align 4
  %cmp26 = icmp eq i32 %19, 8
  br i1 %cmp26, label %land.lhs.true27, label %if.end87

land.lhs.true27:                                  ; preds = %if.end25
  %20 = load i32, ptr @last_member, align 4
  %tobool28 = icmp ne i32 %20, 0
  br i1 %tobool28, label %if.end87, label %if.then29

if.then29:                                        ; preds = %land.lhs.true27
  %21 = load i32, ptr %ifd.addr, align 4
  %call30 = call i64 @lseek(i32 noundef %21, i64 noundef -8, i32 noundef 2) #11
  store i64 %call30, ptr @bytes_in, align 8
  %22 = load i64, ptr @bytes_in, align 8
  %cmp31 = icmp ne i64 %22, -1
  br i1 %cmp31, label %if.then32, label %if.end86

if.then32:                                        ; preds = %if.then29
  %23 = load i64, ptr @bytes_in, align 8
  %add = add nsw i64 %23, 8
  store i64 %add, ptr @bytes_in, align 8
  %24 = load i32, ptr %ifd.addr, align 4
  %arraydecay = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %call33 = call i64 @read(i32 noundef %24, ptr noundef %arraydecay, i64 noundef 8)
  %cmp34 = icmp ne i64 %call33, 8
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.then32
  call void @read_error()
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.then32
  %arrayidx = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %25 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %25 to i16
  %conv37 = zext i16 %conv to i32
  %arrayidx38 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 1
  %26 = load i8, ptr %arrayidx38, align 1
  %conv39 = zext i8 %26 to i16
  %conv40 = zext i16 %conv39 to i32
  %shl = shl i32 %conv40, 8
  %or = or i32 %conv37, %shl
  %conv41 = sext i32 %or to i64
  %arraydecay42 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay42, i64 2
  %arrayidx43 = getelementptr inbounds i8, ptr %add.ptr, i64 0
  %27 = load i8, ptr %arrayidx43, align 1
  %conv44 = zext i8 %27 to i16
  %conv45 = zext i16 %conv44 to i32
  %arraydecay46 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %add.ptr47 = getelementptr inbounds i8, ptr %arraydecay46, i64 2
  %arrayidx48 = getelementptr inbounds i8, ptr %add.ptr47, i64 1
  %28 = load i8, ptr %arrayidx48, align 1
  %conv49 = zext i8 %28 to i16
  %conv50 = zext i16 %conv49 to i32
  %shl51 = shl i32 %conv50, 8
  %or52 = or i32 %conv45, %shl51
  %conv53 = sext i32 %or52 to i64
  %shl54 = shl i64 %conv53, 16
  %or55 = or i64 %conv41, %shl54
  store i64 %or55, ptr %crc, align 8
  %arraydecay56 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %add.ptr57 = getelementptr inbounds i8, ptr %arraydecay56, i64 4
  %arrayidx58 = getelementptr inbounds i8, ptr %add.ptr57, i64 0
  %29 = load i8, ptr %arrayidx58, align 1
  %conv59 = zext i8 %29 to i16
  %conv60 = zext i16 %conv59 to i32
  %arraydecay61 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %add.ptr62 = getelementptr inbounds i8, ptr %arraydecay61, i64 4
  %arrayidx63 = getelementptr inbounds i8, ptr %add.ptr62, i64 1
  %30 = load i8, ptr %arrayidx63, align 1
  %conv64 = zext i8 %30 to i16
  %conv65 = zext i16 %conv64 to i32
  %shl66 = shl i32 %conv65, 8
  %or67 = or i32 %conv60, %shl66
  %conv68 = sext i32 %or67 to i64
  %arraydecay69 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %add.ptr70 = getelementptr inbounds i8, ptr %arraydecay69, i64 4
  %add.ptr71 = getelementptr inbounds i8, ptr %add.ptr70, i64 2
  %arrayidx72 = getelementptr inbounds i8, ptr %add.ptr71, i64 0
  %31 = load i8, ptr %arrayidx72, align 1
  %conv73 = zext i8 %31 to i16
  %conv74 = zext i16 %conv73 to i32
  %arraydecay75 = getelementptr inbounds [8 x i8], ptr %buf, i64 0, i64 0
  %add.ptr76 = getelementptr inbounds i8, ptr %arraydecay75, i64 4
  %add.ptr77 = getelementptr inbounds i8, ptr %add.ptr76, i64 2
  %arrayidx78 = getelementptr inbounds i8, ptr %add.ptr77, i64 1
  %32 = load i8, ptr %arrayidx78, align 1
  %conv79 = zext i8 %32 to i16
  %conv80 = zext i16 %conv79 to i32
  %shl81 = shl i32 %conv80, 8
  %or82 = or i32 %conv74, %shl81
  %conv83 = sext i32 %or82 to i64
  %shl84 = shl i64 %conv83, 16
  %or85 = or i64 %conv68, %shl84
  store i64 %or85, ptr @bytes_out, align 8
  br label %if.end86

if.end86:                                         ; preds = %if.end36, %if.then29
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %land.lhs.true27, %if.end25
  %call88 = call ptr @ctime(ptr noundef @time_stamp) #11
  %add.ptr89 = getelementptr inbounds i8, ptr %call88, i64 4
  store ptr %add.ptr89, ptr %date, align 8
  %33 = load ptr, ptr %date, align 8
  %arrayidx90 = getelementptr inbounds i8, ptr %33, i64 12
  store i8 0, ptr %arrayidx90, align 1
  %34 = load i32, ptr @verbose, align 4
  %tobool91 = icmp ne i32 %34, 0
  br i1 %tobool91, label %if.then92, label %if.end95

if.then92:                                        ; preds = %if.end87
  %35 = load i32, ptr %method.addr, align 4
  %idxprom = sext i32 %35 to i64
  %arrayidx93 = getelementptr inbounds [9 x ptr], ptr @do_list.methods, i64 0, i64 %idxprom
  %36 = load ptr, ptr %arrayidx93, align 8
  %37 = load i64, ptr %crc, align 8
  %38 = load ptr, ptr %date, align 8
  %call94 = call i32 (ptr, ...) @printf(ptr noundef @.str.146, ptr noundef %36, i64 noundef %37, ptr noundef %38)
  br label %if.end95

if.end95:                                         ; preds = %if.then92, %if.end87
  %39 = load i64, ptr @bytes_in, align 8
  %40 = load i64, ptr @bytes_out, align 8
  %call96 = call i32 (ptr, ...) @printf(ptr noundef @.str.144, i64 noundef %39, i64 noundef %40)
  %41 = load i64, ptr @bytes_in, align 8
  %cmp97 = icmp eq i64 %41, -1
  br i1 %cmp97, label %if.then99, label %if.else100

if.then99:                                        ; preds = %if.end95
  store i64 -1, ptr @total_in, align 8
  store i64 0, ptr @header_bytes, align 8
  store i64 0, ptr @bytes_out, align 8
  store i64 0, ptr @bytes_in, align 8
  br label %if.end106

if.else100:                                       ; preds = %if.end95
  %42 = load i64, ptr @total_in, align 8
  %cmp101 = icmp sge i64 %42, 0
  br i1 %cmp101, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.else100
  %43 = load i64, ptr @bytes_in, align 8
  %44 = load i64, ptr @total_in, align 8
  %add104 = add nsw i64 %44, %43
  store i64 %add104, ptr @total_in, align 8
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.else100
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.then99
  %45 = load i64, ptr @bytes_out, align 8
  %cmp107 = icmp eq i64 %45, -1
  br i1 %cmp107, label %if.then109, label %if.else110

if.then109:                                       ; preds = %if.end106
  store i64 -1, ptr @total_out, align 8
  store i64 0, ptr @header_bytes, align 8
  store i64 0, ptr @bytes_out, align 8
  store i64 0, ptr @bytes_in, align 8
  br label %if.end116

if.else110:                                       ; preds = %if.end106
  %46 = load i64, ptr @total_out, align 8
  %cmp111 = icmp sge i64 %46, 0
  br i1 %cmp111, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.else110
  %47 = load i64, ptr @bytes_out, align 8
  %48 = load i64, ptr @total_out, align 8
  %add114 = add nsw i64 %48, %47
  store i64 %add114, ptr @total_out, align 8
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.else110
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.then109
  %49 = load i64, ptr @bytes_out, align 8
  %50 = load i64, ptr @bytes_in, align 8
  %51 = load i64, ptr @header_bytes, align 8
  %sub117 = sub nsw i64 %50, %51
  %sub118 = sub nsw i64 %49, %sub117
  %52 = load i64, ptr @bytes_out, align 8
  %53 = load ptr, ptr @stdout, align 8
  call void @display_ratio(i64 noundef %sub118, i64 noundef %52, ptr noundef %53)
  %call119 = call i32 (ptr, ...) @printf(ptr noundef @.str.147, ptr noundef @ofname)
  br label %return

return:                                           ; preds = %if.end116, %if.end21, %if.then11
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare i64 @lseek(i32 noundef, i64 noundef, i32 noundef) #2

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #3

; Function Attrs: nounwind
declare ptr @ctime(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @fileno(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @isatty(i32 noundef) #2

; Function Attrs: nounwind
declare i32 @fstat(i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @get_method(i32 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i32, align 4
  %flags = alloca i8, align 1
  %magic = alloca [2 x i8], align 1
  %stamp = alloca i64, align 8
  %part = alloca i32, align 4
  %len = alloca i32, align 4
  %c = alloca i8, align 1
  %p = alloca ptr, align 8
  %base = alloca ptr, align 8
  store i32 %in, ptr %in.addr, align 4
  %0 = load i32, ptr @force, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr @to_stdout, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, ptr @inptr, align 4
  %3 = load i32, ptr @insize, align 4
  %cmp = icmp ult i32 %2, %3
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %4 = load i32, ptr @inptr, align 4
  %inc = add i32 %4, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %4 to i64
  %arrayidx = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %5 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %5 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %call = call i32 @fill_inbuf(i32 noundef 1)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %conv2 = trunc i32 %cond to i8
  %arrayidx3 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  store i8 %conv2, ptr %arrayidx3, align 1
  %6 = load i32, ptr @inptr, align 4
  %7 = load i32, ptr @insize, align 4
  %cmp4 = icmp ult i32 %6, %7
  br i1 %cmp4, label %cond.true6, label %cond.false11

cond.true6:                                       ; preds = %cond.end
  %8 = load i32, ptr @inptr, align 4
  %inc7 = add i32 %8, 1
  store i32 %inc7, ptr @inptr, align 4
  %idxprom8 = zext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom8
  %9 = load i8, ptr %arrayidx9, align 1
  %conv10 = zext i8 %9 to i32
  br label %cond.end13

cond.false11:                                     ; preds = %cond.end
  %call12 = call i32 @fill_inbuf(i32 noundef 1)
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false11, %cond.true6
  %cond14 = phi i32 [ %conv10, %cond.true6 ], [ %call12, %cond.false11 ]
  %conv15 = trunc i32 %cond14 to i8
  %arrayidx16 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 1
  store i8 %conv15, ptr %arrayidx16, align 1
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  %10 = load i32, ptr @inptr, align 4
  %11 = load i32, ptr @insize, align 4
  %cmp17 = icmp ult i32 %10, %11
  br i1 %cmp17, label %cond.true19, label %cond.false24

cond.true19:                                      ; preds = %if.else
  %12 = load i32, ptr @inptr, align 4
  %inc20 = add i32 %12, 1
  store i32 %inc20, ptr @inptr, align 4
  %idxprom21 = zext i32 %12 to i64
  %arrayidx22 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom21
  %13 = load i8, ptr %arrayidx22, align 1
  %conv23 = zext i8 %13 to i32
  br label %cond.end26

cond.false24:                                     ; preds = %if.else
  %call25 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false24, %cond.true19
  %cond27 = phi i32 [ %conv23, %cond.true19 ], [ %call25, %cond.false24 ]
  %conv28 = trunc i32 %cond27 to i8
  %arrayidx29 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  store i8 %conv28, ptr %arrayidx29, align 1
  %14 = load i32, ptr @inptr, align 4
  %15 = load i32, ptr @insize, align 4
  %cmp30 = icmp ult i32 %14, %15
  br i1 %cmp30, label %cond.true32, label %cond.false37

cond.true32:                                      ; preds = %cond.end26
  %16 = load i32, ptr @inptr, align 4
  %inc33 = add i32 %16, 1
  store i32 %inc33, ptr @inptr, align 4
  %idxprom34 = zext i32 %16 to i64
  %arrayidx35 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom34
  %17 = load i8, ptr %arrayidx35, align 1
  %conv36 = zext i8 %17 to i32
  br label %cond.end39

cond.false37:                                     ; preds = %cond.end26
  %call38 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end39

cond.end39:                                       ; preds = %cond.false37, %cond.true32
  %cond40 = phi i32 [ %conv36, %cond.true32 ], [ %call38, %cond.false37 ]
  %conv41 = trunc i32 %cond40 to i8
  %arrayidx42 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 1
  store i8 %conv41, ptr %arrayidx42, align 1
  br label %if.end

if.end:                                           ; preds = %cond.end39, %cond.end13
  store i32 -1, ptr @method, align 4
  %18 = load i32, ptr @part_nb, align 4
  %inc43 = add nsw i32 %18, 1
  store i32 %inc43, ptr @part_nb, align 4
  store i64 0, ptr @header_bytes, align 8
  store i32 0, ptr @last_member, align 4
  %arraydecay = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  %call44 = call i32 @memcmp(ptr noundef %arraydecay, ptr noundef @.str.84, i64 noundef 2) #10
  %cmp45 = icmp eq i32 %call44, 0
  br i1 %cmp45, label %if.then51, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %arraydecay47 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  %call48 = call i32 @memcmp(ptr noundef %arraydecay47, ptr noundef @.str.85, i64 noundef 2) #10
  %cmp49 = icmp eq i32 %call48, 0
  br i1 %cmp49, label %if.then51, label %if.else356

if.then51:                                        ; preds = %lor.lhs.false, %if.end
  %19 = load i32, ptr @inptr, align 4
  %20 = load i32, ptr @insize, align 4
  %cmp52 = icmp ult i32 %19, %20
  br i1 %cmp52, label %cond.true54, label %cond.false59

cond.true54:                                      ; preds = %if.then51
  %21 = load i32, ptr @inptr, align 4
  %inc55 = add i32 %21, 1
  store i32 %inc55, ptr @inptr, align 4
  %idxprom56 = zext i32 %21 to i64
  %arrayidx57 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom56
  %22 = load i8, ptr %arrayidx57, align 1
  %conv58 = zext i8 %22 to i32
  br label %cond.end61

cond.false59:                                     ; preds = %if.then51
  %call60 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end61

cond.end61:                                       ; preds = %cond.false59, %cond.true54
  %cond62 = phi i32 [ %conv58, %cond.true54 ], [ %call60, %cond.false59 ]
  store i32 %cond62, ptr @method, align 4
  %23 = load i32, ptr @method, align 4
  %cmp63 = icmp ne i32 %23, 8
  br i1 %cmp63, label %if.then65, label %if.end67

if.then65:                                        ; preds = %cond.end61
  %24 = load ptr, ptr @stderr, align 8
  %25 = load ptr, ptr @progname, align 8
  %26 = load i32, ptr @method, align 4
  %call66 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %24, ptr noundef @.str.86, ptr noundef %25, ptr noundef @ifname, i32 noundef %26)
  store i32 1, ptr @exit_code, align 4
  store i32 -1, ptr %retval, align 4
  br label %return

if.end67:                                         ; preds = %cond.end61
  store ptr @unzip, ptr @work, align 8
  %27 = load i32, ptr @inptr, align 4
  %28 = load i32, ptr @insize, align 4
  %cmp68 = icmp ult i32 %27, %28
  br i1 %cmp68, label %cond.true70, label %cond.false75

cond.true70:                                      ; preds = %if.end67
  %29 = load i32, ptr @inptr, align 4
  %inc71 = add i32 %29, 1
  store i32 %inc71, ptr @inptr, align 4
  %idxprom72 = zext i32 %29 to i64
  %arrayidx73 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom72
  %30 = load i8, ptr %arrayidx73, align 1
  %conv74 = zext i8 %30 to i32
  br label %cond.end77

cond.false75:                                     ; preds = %if.end67
  %call76 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end77

cond.end77:                                       ; preds = %cond.false75, %cond.true70
  %cond78 = phi i32 [ %conv74, %cond.true70 ], [ %call76, %cond.false75 ]
  %conv79 = trunc i32 %cond78 to i8
  store i8 %conv79, ptr %flags, align 1
  %31 = load i8, ptr %flags, align 1
  %conv80 = zext i8 %31 to i32
  %and = and i32 %conv80, 32
  %cmp81 = icmp ne i32 %and, 0
  br i1 %cmp81, label %if.then83, label %if.end85

if.then83:                                        ; preds = %cond.end77
  %32 = load ptr, ptr @stderr, align 8
  %33 = load ptr, ptr @progname, align 8
  %call84 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.87, ptr noundef %33, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 -1, ptr %retval, align 4
  br label %return

if.end85:                                         ; preds = %cond.end77
  %34 = load i8, ptr %flags, align 1
  %conv86 = zext i8 %34 to i32
  %and87 = and i32 %conv86, 2
  %cmp88 = icmp ne i32 %and87, 0
  br i1 %cmp88, label %if.then90, label %if.end96

if.then90:                                        ; preds = %if.end85
  %35 = load ptr, ptr @stderr, align 8
  %36 = load ptr, ptr @progname, align 8
  %call91 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.88, ptr noundef %36, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  %37 = load i32, ptr @force, align 4
  %cmp92 = icmp sle i32 %37, 1
  br i1 %cmp92, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.then90
  store i32 -1, ptr %retval, align 4
  br label %return

if.end95:                                         ; preds = %if.then90
  br label %if.end96

if.end96:                                         ; preds = %if.end95, %if.end85
  %38 = load i8, ptr %flags, align 1
  %conv97 = zext i8 %38 to i32
  %and98 = and i32 %conv97, 192
  %cmp99 = icmp ne i32 %and98, 0
  br i1 %cmp99, label %if.then101, label %if.end108

if.then101:                                       ; preds = %if.end96
  %39 = load ptr, ptr @stderr, align 8
  %40 = load ptr, ptr @progname, align 8
  %41 = load i8, ptr %flags, align 1
  %conv102 = zext i8 %41 to i32
  %call103 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.89, ptr noundef %40, ptr noundef @ifname, i32 noundef %conv102)
  store i32 1, ptr @exit_code, align 4
  %42 = load i32, ptr @force, align 4
  %cmp104 = icmp sle i32 %42, 1
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %if.then101
  store i32 -1, ptr %retval, align 4
  br label %return

if.end107:                                        ; preds = %if.then101
  br label %if.end108

if.end108:                                        ; preds = %if.end107, %if.end96
  %43 = load i32, ptr @inptr, align 4
  %44 = load i32, ptr @insize, align 4
  %cmp109 = icmp ult i32 %43, %44
  br i1 %cmp109, label %cond.true111, label %cond.false116

cond.true111:                                     ; preds = %if.end108
  %45 = load i32, ptr @inptr, align 4
  %inc112 = add i32 %45, 1
  store i32 %inc112, ptr @inptr, align 4
  %idxprom113 = zext i32 %45 to i64
  %arrayidx114 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom113
  %46 = load i8, ptr %arrayidx114, align 1
  %conv115 = zext i8 %46 to i32
  br label %cond.end118

cond.false116:                                    ; preds = %if.end108
  %call117 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end118

cond.end118:                                      ; preds = %cond.false116, %cond.true111
  %cond119 = phi i32 [ %conv115, %cond.true111 ], [ %call117, %cond.false116 ]
  %conv120 = sext i32 %cond119 to i64
  store i64 %conv120, ptr %stamp, align 8
  %47 = load i32, ptr @inptr, align 4
  %48 = load i32, ptr @insize, align 4
  %cmp121 = icmp ult i32 %47, %48
  br i1 %cmp121, label %cond.true123, label %cond.false128

cond.true123:                                     ; preds = %cond.end118
  %49 = load i32, ptr @inptr, align 4
  %inc124 = add i32 %49, 1
  store i32 %inc124, ptr @inptr, align 4
  %idxprom125 = zext i32 %49 to i64
  %arrayidx126 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom125
  %50 = load i8, ptr %arrayidx126, align 1
  %conv127 = zext i8 %50 to i32
  br label %cond.end130

cond.false128:                                    ; preds = %cond.end118
  %call129 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end130

cond.end130:                                      ; preds = %cond.false128, %cond.true123
  %cond131 = phi i32 [ %conv127, %cond.true123 ], [ %call129, %cond.false128 ]
  %conv132 = sext i32 %cond131 to i64
  %shl = shl i64 %conv132, 8
  %51 = load i64, ptr %stamp, align 8
  %or = or i64 %51, %shl
  store i64 %or, ptr %stamp, align 8
  %52 = load i32, ptr @inptr, align 4
  %53 = load i32, ptr @insize, align 4
  %cmp133 = icmp ult i32 %52, %53
  br i1 %cmp133, label %cond.true135, label %cond.false140

cond.true135:                                     ; preds = %cond.end130
  %54 = load i32, ptr @inptr, align 4
  %inc136 = add i32 %54, 1
  store i32 %inc136, ptr @inptr, align 4
  %idxprom137 = zext i32 %54 to i64
  %arrayidx138 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom137
  %55 = load i8, ptr %arrayidx138, align 1
  %conv139 = zext i8 %55 to i32
  br label %cond.end142

cond.false140:                                    ; preds = %cond.end130
  %call141 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end142

cond.end142:                                      ; preds = %cond.false140, %cond.true135
  %cond143 = phi i32 [ %conv139, %cond.true135 ], [ %call141, %cond.false140 ]
  %conv144 = sext i32 %cond143 to i64
  %shl145 = shl i64 %conv144, 16
  %56 = load i64, ptr %stamp, align 8
  %or146 = or i64 %56, %shl145
  store i64 %or146, ptr %stamp, align 8
  %57 = load i32, ptr @inptr, align 4
  %58 = load i32, ptr @insize, align 4
  %cmp147 = icmp ult i32 %57, %58
  br i1 %cmp147, label %cond.true149, label %cond.false154

cond.true149:                                     ; preds = %cond.end142
  %59 = load i32, ptr @inptr, align 4
  %inc150 = add i32 %59, 1
  store i32 %inc150, ptr @inptr, align 4
  %idxprom151 = zext i32 %59 to i64
  %arrayidx152 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom151
  %60 = load i8, ptr %arrayidx152, align 1
  %conv153 = zext i8 %60 to i32
  br label %cond.end156

cond.false154:                                    ; preds = %cond.end142
  %call155 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end156

cond.end156:                                      ; preds = %cond.false154, %cond.true149
  %cond157 = phi i32 [ %conv153, %cond.true149 ], [ %call155, %cond.false154 ]
  %conv158 = sext i32 %cond157 to i64
  %shl159 = shl i64 %conv158, 24
  %61 = load i64, ptr %stamp, align 8
  %or160 = or i64 %61, %shl159
  store i64 %or160, ptr %stamp, align 8
  %62 = load i64, ptr %stamp, align 8
  %cmp161 = icmp ne i64 %62, 0
  br i1 %cmp161, label %land.lhs.true163, label %if.end166

land.lhs.true163:                                 ; preds = %cond.end156
  %63 = load i32, ptr @no_time, align 4
  %tobool164 = icmp ne i32 %63, 0
  br i1 %tobool164, label %if.end166, label %if.then165

if.then165:                                       ; preds = %land.lhs.true163
  %64 = load i64, ptr %stamp, align 8
  store i64 %64, ptr @time_stamp, align 8
  br label %if.end166

if.end166:                                        ; preds = %if.then165, %land.lhs.true163, %cond.end156
  %65 = load i32, ptr @inptr, align 4
  %66 = load i32, ptr @insize, align 4
  %cmp167 = icmp ult i32 %65, %66
  br i1 %cmp167, label %cond.true169, label %cond.false174

cond.true169:                                     ; preds = %if.end166
  %67 = load i32, ptr @inptr, align 4
  %inc170 = add i32 %67, 1
  store i32 %inc170, ptr @inptr, align 4
  %idxprom171 = zext i32 %67 to i64
  %arrayidx172 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom171
  %68 = load i8, ptr %arrayidx172, align 1
  %conv173 = zext i8 %68 to i32
  br label %cond.end176

cond.false174:                                    ; preds = %if.end166
  %call175 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end176

cond.end176:                                      ; preds = %cond.false174, %cond.true169
  %cond177 = phi i32 [ %conv173, %cond.true169 ], [ %call175, %cond.false174 ]
  %69 = load i32, ptr @inptr, align 4
  %70 = load i32, ptr @insize, align 4
  %cmp178 = icmp ult i32 %69, %70
  br i1 %cmp178, label %cond.true180, label %cond.false185

cond.true180:                                     ; preds = %cond.end176
  %71 = load i32, ptr @inptr, align 4
  %inc181 = add i32 %71, 1
  store i32 %inc181, ptr @inptr, align 4
  %idxprom182 = zext i32 %71 to i64
  %arrayidx183 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom182
  %72 = load i8, ptr %arrayidx183, align 1
  %conv184 = zext i8 %72 to i32
  br label %cond.end187

cond.false185:                                    ; preds = %cond.end176
  %call186 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end187

cond.end187:                                      ; preds = %cond.false185, %cond.true180
  %cond188 = phi i32 [ %conv184, %cond.true180 ], [ %call186, %cond.false185 ]
  %73 = load i8, ptr %flags, align 1
  %conv189 = zext i8 %73 to i32
  %and190 = and i32 %conv189, 2
  %cmp191 = icmp ne i32 %and190, 0
  br i1 %cmp191, label %if.then193, label %if.end222

if.then193:                                       ; preds = %cond.end187
  %74 = load i32, ptr @inptr, align 4
  %75 = load i32, ptr @insize, align 4
  %cmp194 = icmp ult i32 %74, %75
  br i1 %cmp194, label %cond.true196, label %cond.false201

cond.true196:                                     ; preds = %if.then193
  %76 = load i32, ptr @inptr, align 4
  %inc197 = add i32 %76, 1
  store i32 %inc197, ptr @inptr, align 4
  %idxprom198 = zext i32 %76 to i64
  %arrayidx199 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom198
  %77 = load i8, ptr %arrayidx199, align 1
  %conv200 = zext i8 %77 to i32
  br label %cond.end203

cond.false201:                                    ; preds = %if.then193
  %call202 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end203

cond.end203:                                      ; preds = %cond.false201, %cond.true196
  %cond204 = phi i32 [ %conv200, %cond.true196 ], [ %call202, %cond.false201 ]
  store i32 %cond204, ptr %part, align 4
  %78 = load i32, ptr @inptr, align 4
  %79 = load i32, ptr @insize, align 4
  %cmp205 = icmp ult i32 %78, %79
  br i1 %cmp205, label %cond.true207, label %cond.false212

cond.true207:                                     ; preds = %cond.end203
  %80 = load i32, ptr @inptr, align 4
  %inc208 = add i32 %80, 1
  store i32 %inc208, ptr @inptr, align 4
  %idxprom209 = zext i32 %80 to i64
  %arrayidx210 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom209
  %81 = load i8, ptr %arrayidx210, align 1
  %conv211 = zext i8 %81 to i32
  br label %cond.end214

cond.false212:                                    ; preds = %cond.end203
  %call213 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end214

cond.end214:                                      ; preds = %cond.false212, %cond.true207
  %cond215 = phi i32 [ %conv211, %cond.true207 ], [ %call213, %cond.false212 ]
  %shl216 = shl i32 %cond215, 8
  %82 = load i32, ptr %part, align 4
  %or217 = or i32 %82, %shl216
  store i32 %or217, ptr %part, align 4
  %83 = load i32, ptr @verbose, align 4
  %tobool218 = icmp ne i32 %83, 0
  br i1 %tobool218, label %if.then219, label %if.end221

if.then219:                                       ; preds = %cond.end214
  %84 = load ptr, ptr @stderr, align 8
  %85 = load ptr, ptr @progname, align 8
  %86 = load i32, ptr %part, align 4
  %call220 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %84, ptr noundef @.str.90, ptr noundef %85, ptr noundef @ifname, i32 noundef %86)
  br label %if.end221

if.end221:                                        ; preds = %if.then219, %cond.end214
  br label %if.end222

if.end222:                                        ; preds = %if.end221, %cond.end187
  %87 = load i8, ptr %flags, align 1
  %conv223 = zext i8 %87 to i32
  %and224 = and i32 %conv223, 4
  %cmp225 = icmp ne i32 %and224, 0
  br i1 %cmp225, label %if.then227, label %if.end268

if.then227:                                       ; preds = %if.end222
  %88 = load i32, ptr @inptr, align 4
  %89 = load i32, ptr @insize, align 4
  %cmp228 = icmp ult i32 %88, %89
  br i1 %cmp228, label %cond.true230, label %cond.false235

cond.true230:                                     ; preds = %if.then227
  %90 = load i32, ptr @inptr, align 4
  %inc231 = add i32 %90, 1
  store i32 %inc231, ptr @inptr, align 4
  %idxprom232 = zext i32 %90 to i64
  %arrayidx233 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom232
  %91 = load i8, ptr %arrayidx233, align 1
  %conv234 = zext i8 %91 to i32
  br label %cond.end237

cond.false235:                                    ; preds = %if.then227
  %call236 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end237

cond.end237:                                      ; preds = %cond.false235, %cond.true230
  %cond238 = phi i32 [ %conv234, %cond.true230 ], [ %call236, %cond.false235 ]
  store i32 %cond238, ptr %len, align 4
  %92 = load i32, ptr @inptr, align 4
  %93 = load i32, ptr @insize, align 4
  %cmp239 = icmp ult i32 %92, %93
  br i1 %cmp239, label %cond.true241, label %cond.false246

cond.true241:                                     ; preds = %cond.end237
  %94 = load i32, ptr @inptr, align 4
  %inc242 = add i32 %94, 1
  store i32 %inc242, ptr @inptr, align 4
  %idxprom243 = zext i32 %94 to i64
  %arrayidx244 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom243
  %95 = load i8, ptr %arrayidx244, align 1
  %conv245 = zext i8 %95 to i32
  br label %cond.end248

cond.false246:                                    ; preds = %cond.end237
  %call247 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end248

cond.end248:                                      ; preds = %cond.false246, %cond.true241
  %cond249 = phi i32 [ %conv245, %cond.true241 ], [ %call247, %cond.false246 ]
  %shl250 = shl i32 %cond249, 8
  %96 = load i32, ptr %len, align 4
  %or251 = or i32 %96, %shl250
  store i32 %or251, ptr %len, align 4
  %97 = load i32, ptr @verbose, align 4
  %tobool252 = icmp ne i32 %97, 0
  br i1 %tobool252, label %if.then253, label %if.end255

if.then253:                                       ; preds = %cond.end248
  %98 = load ptr, ptr @stderr, align 8
  %99 = load ptr, ptr @progname, align 8
  %100 = load i32, ptr %len, align 4
  %call254 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %98, ptr noundef @.str.91, ptr noundef %99, ptr noundef @ifname, i32 noundef %100)
  br label %if.end255

if.end255:                                        ; preds = %if.then253, %cond.end248
  br label %while.cond

while.cond:                                       ; preds = %cond.end266, %if.end255
  %101 = load i32, ptr %len, align 4
  %dec = add i32 %101, -1
  store i32 %dec, ptr %len, align 4
  %tobool256 = icmp ne i32 %101, 0
  br i1 %tobool256, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %102 = load i32, ptr @inptr, align 4
  %103 = load i32, ptr @insize, align 4
  %cmp257 = icmp ult i32 %102, %103
  br i1 %cmp257, label %cond.true259, label %cond.false264

cond.true259:                                     ; preds = %while.body
  %104 = load i32, ptr @inptr, align 4
  %inc260 = add i32 %104, 1
  store i32 %inc260, ptr @inptr, align 4
  %idxprom261 = zext i32 %104 to i64
  %arrayidx262 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom261
  %105 = load i8, ptr %arrayidx262, align 1
  %conv263 = zext i8 %105 to i32
  br label %cond.end266

cond.false264:                                    ; preds = %while.body
  %call265 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end266

cond.end266:                                      ; preds = %cond.false264, %cond.true259
  %cond267 = phi i32 [ %conv263, %cond.true259 ], [ %call265, %cond.false264 ]
  br label %while.cond, !llvm.loop !11

while.end:                                        ; preds = %while.cond
  br label %if.end268

if.end268:                                        ; preds = %while.end, %if.end222
  %106 = load i8, ptr %flags, align 1
  %conv269 = zext i8 %106 to i32
  %and270 = and i32 %conv269, 8
  %cmp271 = icmp ne i32 %and270, 0
  br i1 %cmp271, label %if.then273, label %if.end328

if.then273:                                       ; preds = %if.end268
  %107 = load i32, ptr @no_name, align 4
  %tobool274 = icmp ne i32 %107, 0
  br i1 %tobool274, label %if.then282, label %lor.lhs.false275

lor.lhs.false275:                                 ; preds = %if.then273
  %108 = load i32, ptr @to_stdout, align 4
  %tobool276 = icmp ne i32 %108, 0
  br i1 %tobool276, label %land.lhs.true277, label %lor.lhs.false279

land.lhs.true277:                                 ; preds = %lor.lhs.false275
  %109 = load i32, ptr @list, align 4
  %tobool278 = icmp ne i32 %109, 0
  br i1 %tobool278, label %lor.lhs.false279, label %if.then282

lor.lhs.false279:                                 ; preds = %land.lhs.true277, %lor.lhs.false275
  %110 = load i32, ptr @part_nb, align 4
  %cmp280 = icmp sgt i32 %110, 1
  br i1 %cmp280, label %if.then282, label %if.else298

if.then282:                                       ; preds = %lor.lhs.false279, %land.lhs.true277, %if.then273
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then282
  %111 = load i32, ptr @inptr, align 4
  %112 = load i32, ptr @insize, align 4
  %cmp283 = icmp ult i32 %111, %112
  br i1 %cmp283, label %cond.true285, label %cond.false290

cond.true285:                                     ; preds = %do.body
  %113 = load i32, ptr @inptr, align 4
  %inc286 = add i32 %113, 1
  store i32 %inc286, ptr @inptr, align 4
  %idxprom287 = zext i32 %113 to i64
  %arrayidx288 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom287
  %114 = load i8, ptr %arrayidx288, align 1
  %conv289 = zext i8 %114 to i32
  br label %cond.end292

cond.false290:                                    ; preds = %do.body
  %call291 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end292

cond.end292:                                      ; preds = %cond.false290, %cond.true285
  %cond293 = phi i32 [ %conv289, %cond.true285 ], [ %call291, %cond.false290 ]
  %conv294 = trunc i32 %cond293 to i8
  store i8 %conv294, ptr %c, align 1
  br label %do.cond

do.cond:                                          ; preds = %cond.end292
  %115 = load i8, ptr %c, align 1
  %conv295 = sext i8 %115 to i32
  %cmp296 = icmp ne i32 %conv295, 0
  br i1 %cmp296, label %do.body, label %do.end, !llvm.loop !12

do.end:                                           ; preds = %do.cond
  br label %if.end327

if.else298:                                       ; preds = %lor.lhs.false279
  %call299 = call ptr @basename(ptr noundef @ofname)
  store ptr %call299, ptr %p, align 8
  %116 = load ptr, ptr %p, align 8
  store ptr %116, ptr %base, align 8
  br label %for.cond

for.cond:                                         ; preds = %if.end320, %if.else298
  %117 = load i32, ptr @inptr, align 4
  %118 = load i32, ptr @insize, align 4
  %cmp300 = icmp ult i32 %117, %118
  br i1 %cmp300, label %cond.true302, label %cond.false307

cond.true302:                                     ; preds = %for.cond
  %119 = load i32, ptr @inptr, align 4
  %inc303 = add i32 %119, 1
  store i32 %inc303, ptr @inptr, align 4
  %idxprom304 = zext i32 %119 to i64
  %arrayidx305 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom304
  %120 = load i8, ptr %arrayidx305, align 1
  %conv306 = zext i8 %120 to i32
  br label %cond.end309

cond.false307:                                    ; preds = %for.cond
  %call308 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end309

cond.end309:                                      ; preds = %cond.false307, %cond.true302
  %cond310 = phi i32 [ %conv306, %cond.true302 ], [ %call308, %cond.false307 ]
  %conv311 = trunc i32 %cond310 to i8
  %121 = load ptr, ptr %p, align 8
  store i8 %conv311, ptr %121, align 1
  %122 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %122, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %123 = load i8, ptr %122, align 1
  %conv312 = sext i8 %123 to i32
  %cmp313 = icmp eq i32 %conv312, 0
  br i1 %cmp313, label %if.then315, label %if.end316

if.then315:                                       ; preds = %cond.end309
  br label %for.end

if.end316:                                        ; preds = %cond.end309
  %124 = load ptr, ptr %p, align 8
  %cmp317 = icmp uge ptr %124, getelementptr inbounds (i8, ptr @ofname, i64 1024)
  br i1 %cmp317, label %if.then319, label %if.end320

if.then319:                                       ; preds = %if.end316
  call void @error(ptr noundef @.str.92)
  br label %if.end320

if.end320:                                        ; preds = %if.then319, %if.end316
  br label %for.cond

for.end:                                          ; preds = %if.then315
  %125 = load i32, ptr @list, align 4
  %tobool321 = icmp ne i32 %125, 0
  br i1 %tobool321, label %if.end326, label %if.then322

if.then322:                                       ; preds = %for.end
  %126 = load ptr, ptr %base, align 8
  %tobool323 = icmp ne ptr %126, null
  br i1 %tobool323, label %if.then324, label %if.end325

if.then324:                                       ; preds = %if.then322
  store i32 0, ptr @list, align 4
  br label %if.end325

if.end325:                                        ; preds = %if.then324, %if.then322
  br label %if.end326

if.end326:                                        ; preds = %if.end325, %for.end
  br label %if.end327

if.end327:                                        ; preds = %if.end326, %do.end
  br label %if.end328

if.end328:                                        ; preds = %if.end327, %if.end268
  %127 = load i8, ptr %flags, align 1
  %conv329 = zext i8 %127 to i32
  %and330 = and i32 %conv329, 16
  %cmp331 = icmp ne i32 %and330, 0
  br i1 %cmp331, label %if.then333, label %if.end350

if.then333:                                       ; preds = %if.end328
  br label %while.cond334

while.cond334:                                    ; preds = %while.body348, %if.then333
  %128 = load i32, ptr @inptr, align 4
  %129 = load i32, ptr @insize, align 4
  %cmp335 = icmp ult i32 %128, %129
  br i1 %cmp335, label %cond.true337, label %cond.false342

cond.true337:                                     ; preds = %while.cond334
  %130 = load i32, ptr @inptr, align 4
  %inc338 = add i32 %130, 1
  store i32 %inc338, ptr @inptr, align 4
  %idxprom339 = zext i32 %130 to i64
  %arrayidx340 = getelementptr inbounds [32832 x i8], ptr @inbuf, i64 0, i64 %idxprom339
  %131 = load i8, ptr %arrayidx340, align 1
  %conv341 = zext i8 %131 to i32
  br label %cond.end344

cond.false342:                                    ; preds = %while.cond334
  %call343 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end344

cond.end344:                                      ; preds = %cond.false342, %cond.true337
  %cond345 = phi i32 [ %conv341, %cond.true337 ], [ %call343, %cond.false342 ]
  %cmp346 = icmp ne i32 %cond345, 0
  br i1 %cmp346, label %while.body348, label %while.end349

while.body348:                                    ; preds = %cond.end344
  br label %while.cond334, !llvm.loop !13

while.end349:                                     ; preds = %cond.end344
  br label %if.end350

if.end350:                                        ; preds = %while.end349, %if.end328
  %132 = load i32, ptr @part_nb, align 4
  %cmp351 = icmp eq i32 %132, 1
  br i1 %cmp351, label %if.then353, label %if.end355

if.then353:                                       ; preds = %if.end350
  %133 = load i32, ptr @inptr, align 4
  %conv354 = zext i32 %133 to i64
  %add = add i64 %conv354, 16
  store i64 %add, ptr @header_bytes, align 8
  br label %if.end355

if.end355:                                        ; preds = %if.then353, %if.end350
  br label %if.end404

if.else356:                                       ; preds = %lor.lhs.false
  %arraydecay357 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  %call358 = call i32 @memcmp(ptr noundef %arraydecay357, ptr noundef @.str.93, i64 noundef 2) #10
  %cmp359 = icmp eq i32 %call358, 0
  br i1 %cmp359, label %land.lhs.true361, label %if.else374

land.lhs.true361:                                 ; preds = %if.else356
  %134 = load i32, ptr @inptr, align 4
  %cmp362 = icmp eq i32 %134, 2
  br i1 %cmp362, label %land.lhs.true364, label %if.else374

land.lhs.true364:                                 ; preds = %land.lhs.true361
  %call365 = call i32 @memcmp(ptr noundef @inbuf, ptr noundef @.str.93, i64 noundef 4) #10
  %cmp366 = icmp eq i32 %call365, 0
  br i1 %cmp366, label %if.then368, label %if.else374

if.then368:                                       ; preds = %land.lhs.true364
  store i32 0, ptr @inptr, align 4
  store ptr @unzip, ptr @work, align 8
  %135 = load i32, ptr %in.addr, align 4
  %call369 = call i32 @check_zipfile(i32 noundef %135)
  %cmp370 = icmp ne i32 %call369, 0
  br i1 %cmp370, label %if.then372, label %if.end373

if.then372:                                       ; preds = %if.then368
  store i32 -1, ptr %retval, align 4
  br label %return

if.end373:                                        ; preds = %if.then368
  store i32 1, ptr @last_member, align 4
  br label %if.end403

if.else374:                                       ; preds = %land.lhs.true364, %land.lhs.true361, %if.else356
  %arraydecay375 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  %call376 = call i32 @memcmp(ptr noundef %arraydecay375, ptr noundef @.str.94, i64 noundef 2) #10
  %cmp377 = icmp eq i32 %call376, 0
  br i1 %cmp377, label %if.then379, label %if.else380

if.then379:                                       ; preds = %if.else374
  store ptr @unpack, ptr @work, align 8
  store i32 2, ptr @method, align 4
  br label %if.end402

if.else380:                                       ; preds = %if.else374
  %arraydecay381 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  %call382 = call i32 @memcmp(ptr noundef %arraydecay381, ptr noundef @.str.95, i64 noundef 2) #10
  %cmp383 = icmp eq i32 %call382, 0
  br i1 %cmp383, label %if.then385, label %if.else386

if.then385:                                       ; preds = %if.else380
  store ptr @unlzw, ptr @work, align 8
  store i32 1, ptr @method, align 4
  store i32 1, ptr @last_member, align 4
  br label %if.end401

if.else386:                                       ; preds = %if.else380
  %arraydecay387 = getelementptr inbounds [2 x i8], ptr %magic, i64 0, i64 0
  %call388 = call i32 @memcmp(ptr noundef %arraydecay387, ptr noundef @.str.96, i64 noundef 2) #10
  %cmp389 = icmp eq i32 %call388, 0
  br i1 %cmp389, label %if.then391, label %if.else392

if.then391:                                       ; preds = %if.else386
  store ptr @unlzh, ptr @work, align 8
  store i32 3, ptr @method, align 4
  store i32 1, ptr @last_member, align 4
  br label %if.end400

if.else392:                                       ; preds = %if.else386
  %136 = load i32, ptr @force, align 4
  %tobool393 = icmp ne i32 %136, 0
  br i1 %tobool393, label %land.lhs.true394, label %if.end399

land.lhs.true394:                                 ; preds = %if.else392
  %137 = load i32, ptr @to_stdout, align 4
  %tobool395 = icmp ne i32 %137, 0
  br i1 %tobool395, label %land.lhs.true396, label %if.end399

land.lhs.true396:                                 ; preds = %land.lhs.true394
  %138 = load i32, ptr @list, align 4
  %tobool397 = icmp ne i32 %138, 0
  br i1 %tobool397, label %if.end399, label %if.then398

if.then398:                                       ; preds = %land.lhs.true396
  store i32 0, ptr @method, align 4
  store ptr @copy, ptr @work, align 8
  store i32 0, ptr @inptr, align 4
  store i32 1, ptr @last_member, align 4
  br label %if.end399

if.end399:                                        ; preds = %if.then398, %land.lhs.true396, %land.lhs.true394, %if.else392
  br label %if.end400

if.end400:                                        ; preds = %if.end399, %if.then391
  br label %if.end401

if.end401:                                        ; preds = %if.end400, %if.then385
  br label %if.end402

if.end402:                                        ; preds = %if.end401, %if.then379
  br label %if.end403

if.end403:                                        ; preds = %if.end402, %if.end373
  br label %if.end404

if.end404:                                        ; preds = %if.end403, %if.end355
  %139 = load i32, ptr @method, align 4
  %cmp405 = icmp sge i32 %139, 0
  br i1 %cmp405, label %if.then407, label %if.end408

if.then407:                                       ; preds = %if.end404
  %140 = load i32, ptr @method, align 4
  store i32 %140, ptr %retval, align 4
  br label %return

if.end408:                                        ; preds = %if.end404
  %141 = load i32, ptr @part_nb, align 4
  %cmp409 = icmp eq i32 %141, 1
  br i1 %cmp409, label %if.then411, label %if.else413

if.then411:                                       ; preds = %if.end408
  %142 = load ptr, ptr @stderr, align 8
  %143 = load ptr, ptr @progname, align 8
  %call412 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %142, ptr noundef @.str.97, ptr noundef %143, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 -1, ptr %retval, align 4
  br label %return

if.else413:                                       ; preds = %if.end408
  %144 = load i32, ptr @quiet, align 4
  %tobool414 = icmp ne i32 %144, 0
  br i1 %tobool414, label %if.end417, label %if.then415

if.then415:                                       ; preds = %if.else413
  %145 = load ptr, ptr @stderr, align 8
  %146 = load ptr, ptr @progname, align 8
  %call416 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %145, ptr noundef @.str.98, ptr noundef %146, ptr noundef @ifname)
  br label %if.end417

if.end417:                                        ; preds = %if.then415, %if.else413
  %147 = load i32, ptr @exit_code, align 4
  %cmp418 = icmp eq i32 %147, 0
  br i1 %cmp418, label %if.then420, label %if.end421

if.then420:                                       ; preds = %if.end417
  store i32 2, ptr @exit_code, align 4
  br label %if.end421

if.end421:                                        ; preds = %if.then420, %if.end417
  store i32 -2, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end421, %if.then411, %if.then407, %if.then372, %if.then106, %if.then94, %if.then83, %if.then65
  %148 = load i32, ptr %retval, align 4
  ret i32 %148
}

; Function Attrs: nounwind readonly willreturn
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @get_istat(ptr noundef %iname, ptr noundef %sbuf) #0 {
entry:
  %retval = alloca i32, align 4
  %iname.addr = alloca ptr, align 8
  %sbuf.addr = alloca ptr, align 8
  %ilen = alloca i32, align 4
  %suf = alloca ptr, align 8
  %s = alloca ptr, align 8
  store ptr %iname, ptr %iname.addr, align 8
  store ptr %sbuf, ptr %sbuf.addr, align 8
  store ptr @get_istat.suffixes, ptr %suf, align 8
  %0 = load ptr, ptr %iname.addr, align 8
  %call = call ptr @strcpy(ptr noundef @ifname, ptr noundef %0) #11
  %1 = load ptr, ptr %sbuf.addr, align 8
  %call1 = call i32 @do_stat(ptr noundef @ifname, ptr noundef %1)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, ptr @decompress, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then4

lor.lhs.false:                                    ; preds = %if.end
  %call2 = call ptr @__errno_location() #13
  %3 = load i32, ptr %call2, align 4
  %cmp3 = icmp ne i32 %3, 2
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  call void @perror(ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end5:                                          ; preds = %lor.lhs.false
  %call6 = call ptr @get_suffix(ptr noundef @ifname)
  store ptr %call6, ptr %s, align 8
  %4 = load ptr, ptr %s, align 8
  %cmp7 = icmp ne ptr %4, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end5
  call void @perror(ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end5
  %call10 = call i64 @strlen(ptr noundef @ifname) #10
  %conv = trunc i64 %call10 to i32
  store i32 %conv, ptr %ilen, align 4
  %call11 = call i32 @strcmp(ptr noundef @z_suffix, ptr noundef @.str.29) #10
  %cmp12 = icmp eq i32 %call11, 0
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end9
  %5 = load ptr, ptr %suf, align 8
  %incdec.ptr = getelementptr inbounds ptr, ptr %5, i32 1
  store ptr %incdec.ptr, ptr %suf, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end9
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end15
  %6 = load ptr, ptr %suf, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %s, align 8
  %8 = load ptr, ptr %s, align 8
  %call16 = call ptr @strcat(ptr noundef @ifname, ptr noundef %8) #11
  %9 = load ptr, ptr %sbuf.addr, align 8
  %call17 = call i32 @do_stat(ptr noundef @ifname, ptr noundef %9)
  %cmp18 = icmp eq i32 %call17, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %do.body
  store i32 0, ptr %retval, align 4
  br label %return

if.end21:                                         ; preds = %do.body
  %10 = load i32, ptr %ilen, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [1024 x i8], ptr @ifname, i64 0, i64 %idxprom
  store i8 0, ptr %arrayidx, align 1
  br label %do.cond

do.cond:                                          ; preds = %if.end21
  %11 = load ptr, ptr %suf, align 8
  %incdec.ptr22 = getelementptr inbounds ptr, ptr %11, i32 1
  store ptr %incdec.ptr22, ptr %suf, align 8
  %12 = load ptr, ptr %incdec.ptr22, align 8
  %cmp23 = icmp ne ptr %12, null
  br i1 %cmp23, label %do.body, label %do.end, !llvm.loop !14

do.end:                                           ; preds = %do.cond
  %call25 = call ptr @strcat(ptr noundef @ifname, ptr noundef @z_suffix) #11
  call void @perror(ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then20, %if.then8, %if.then4, %if.then
  %13 = load i32, ptr %retval, align 4
  ret i32 %13
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @treat_dir(ptr noundef %dir) #0 {
entry:
  %dir.addr = alloca ptr, align 8
  %dp = alloca ptr, align 8
  %dirp = alloca ptr, align 8
  %nbuf = alloca [1024 x i8], align 16
  %len = alloca i32, align 4
  store ptr %dir, ptr %dir.addr, align 8
  %0 = load ptr, ptr %dir.addr, align 8
  %call = call ptr @opendir(ptr noundef %0)
  store ptr %call, ptr %dirp, align 8
  %1 = load ptr, ptr %dirp, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr @stderr, align 8
  %3 = load ptr, ptr @progname, align 8
  %4 = load ptr, ptr %dir.addr, align 8
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.118, ptr noundef %3, ptr noundef %4)
  store i32 1, ptr @exit_code, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %if.then10, %if.end
  %5 = load ptr, ptr %dirp, align 8
  %call2 = call ptr @readdir(ptr noundef %5)
  store ptr %call2, ptr %dp, align 8
  %cmp3 = icmp ne ptr %call2, null
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load ptr, ptr %dp, align 8
  %d_name = getelementptr inbounds %struct.dirent, ptr %6, i32 0, i32 4
  %arraydecay = getelementptr inbounds [256 x i8], ptr %d_name, i64 0, i64 0
  %call4 = call i32 @strcmp(ptr noundef %arraydecay, ptr noundef @.str.119) #10
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %7 = load ptr, ptr %dp, align 8
  %d_name6 = getelementptr inbounds %struct.dirent, ptr %7, i32 0, i32 4
  %arraydecay7 = getelementptr inbounds [256 x i8], ptr %d_name6, i64 0, i64 0
  %call8 = call i32 @strcmp(ptr noundef %arraydecay7, ptr noundef @.str.120) #10
  %cmp9 = icmp eq i32 %call8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %while.body
  br label %while.cond, !llvm.loop !15

if.end11:                                         ; preds = %lor.lhs.false
  %8 = load ptr, ptr %dir.addr, align 8
  %call12 = call i64 @strlen(ptr noundef %8) #10
  %conv = trunc i64 %call12 to i32
  store i32 %conv, ptr %len, align 4
  %9 = load i32, ptr %len, align 4
  %10 = load ptr, ptr %dp, align 8
  %d_name13 = getelementptr inbounds %struct.dirent, ptr %10, i32 0, i32 4
  %arraydecay14 = getelementptr inbounds [256 x i8], ptr %d_name13, i64 0, i64 0
  %call15 = call i64 @strlen(ptr noundef %arraydecay14) #10
  %conv16 = trunc i64 %call15 to i32
  %add = add nsw i32 %9, %conv16
  %add17 = add nsw i32 %add, 1
  %cmp18 = icmp slt i32 %add17, 1023
  br i1 %cmp18, label %if.then20, label %if.else

if.then20:                                        ; preds = %if.end11
  %arraydecay21 = getelementptr inbounds [1024 x i8], ptr %nbuf, i64 0, i64 0
  %11 = load ptr, ptr %dir.addr, align 8
  %call22 = call ptr @strcpy(ptr noundef %arraydecay21, ptr noundef %11) #11
  %12 = load i32, ptr %len, align 4
  %cmp23 = icmp ne i32 %12, 0
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.then20
  %13 = load i32, ptr %len, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, ptr %len, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [1024 x i8], ptr %nbuf, i64 0, i64 %idxprom
  store i8 47, ptr %arrayidx, align 1
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.then20
  %arraydecay27 = getelementptr inbounds [1024 x i8], ptr %nbuf, i64 0, i64 0
  %14 = load i32, ptr %len, align 4
  %idx.ext = sext i32 %14 to i64
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay27, i64 %idx.ext
  %15 = load ptr, ptr %dp, align 8
  %d_name28 = getelementptr inbounds %struct.dirent, ptr %15, i32 0, i32 4
  %arraydecay29 = getelementptr inbounds [256 x i8], ptr %d_name28, i64 0, i64 0
  %call30 = call ptr @strcpy(ptr noundef %add.ptr, ptr noundef %arraydecay29) #11
  %arraydecay31 = getelementptr inbounds [1024 x i8], ptr %nbuf, i64 0, i64 0
  call void @treat_file(ptr noundef %arraydecay31)
  br label %if.end35

if.else:                                          ; preds = %if.end11
  %16 = load ptr, ptr @stderr, align 8
  %17 = load ptr, ptr @progname, align 8
  %18 = load ptr, ptr %dir.addr, align 8
  %19 = load ptr, ptr %dp, align 8
  %d_name32 = getelementptr inbounds %struct.dirent, ptr %19, i32 0, i32 4
  %arraydecay33 = getelementptr inbounds [256 x i8], ptr %d_name32, i64 0, i64 0
  %call34 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %16, ptr noundef @.str.121, ptr noundef %17, ptr noundef %18, ptr noundef %arraydecay33)
  store i32 1, ptr @exit_code, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.end26
  br label %while.cond, !llvm.loop !15

while.end:                                        ; preds = %while.cond
  %20 = load ptr, ptr %dirp, align 8
  %call36 = call i32 @closedir(ptr noundef %20)
  br label %return

return:                                           ; preds = %while.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @reset_times(ptr noundef %name, ptr noundef %statb) #0 {
entry:
  %name.addr = alloca ptr, align 8
  %statb.addr = alloca ptr, align 8
  %timep = alloca %struct.timespec, align 8
  store ptr %name, ptr %name.addr, align 8
  store ptr %statb, ptr %statb.addr, align 8
  %0 = load ptr, ptr %statb.addr, align 8
  %st_atim = getelementptr inbounds %struct.stat, ptr %0, i32 0, i32 11
  %tv_sec = getelementptr inbounds %struct.timespec, ptr %st_atim, i32 0, i32 0
  %1 = load i64, ptr %tv_sec, align 8
  %actime = getelementptr inbounds %struct.timespec, ptr %timep, i32 0, i32 0
  store i64 %1, ptr %actime, align 8
  %2 = load ptr, ptr %statb.addr, align 8
  %st_mtim = getelementptr inbounds %struct.stat, ptr %2, i32 0, i32 12
  %tv_sec1 = getelementptr inbounds %struct.timespec, ptr %st_mtim, i32 0, i32 0
  %3 = load i64, ptr %tv_sec1, align 8
  %modtime = getelementptr inbounds %struct.timespec, ptr %timep, i32 0, i32 1
  store i64 %3, ptr %modtime, align 8
  %4 = load ptr, ptr %name.addr, align 8
  %call = call i32 @utime(ptr noundef %4, ptr noundef %timep) #11
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %entry
  %5 = load ptr, ptr %statb.addr, align 8
  %st_mode = getelementptr inbounds %struct.stat, ptr %5, i32 0, i32 3
  %6 = load i32, ptr %st_mode, align 8
  %and = and i32 %6, 61440
  %cmp = icmp eq i32 %and, 16384
  br i1 %cmp, label %if.end11, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %7 = load i32, ptr @quiet, align 4
  %tobool2 = icmp ne i32 %7, 0
  br i1 %tobool2, label %if.end, label %if.then3

if.then3:                                         ; preds = %if.then
  %8 = load ptr, ptr @stderr, align 8
  %9 = load ptr, ptr @progname, align 8
  %call4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.103, ptr noundef %9)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %10 = load i32, ptr @exit_code, align 4
  %cmp5 = icmp eq i32 %10, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 2, ptr @exit_code, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %11 = load i32, ptr @quiet, align 4
  %tobool8 = icmp ne i32 %11, 0
  br i1 %tobool8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end7
  call void @perror(ptr noundef @ofname)
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %land.lhs.true, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @make_ofname() #0 {
entry:
  %retval = alloca i32, align 4
  %suff = alloca ptr, align 8
  %call = call ptr @strcpy(ptr noundef @ofname, ptr noundef @ifname) #11
  %call1 = call ptr @get_suffix(ptr noundef @ofname)
  store ptr %call1, ptr %suff, align 8
  %0 = load i32, ptr @decompress, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else31

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %suff, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then2, label %if.end21

if.then2:                                         ; preds = %if.then
  %2 = load i32, ptr @recursive, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then2
  %3 = load i32, ptr @list, align 4
  %tobool4 = icmp ne i32 %3, 0
  br i1 %tobool4, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %4 = load i32, ptr @test, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %lor.lhs.false, %land.lhs.true
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false, %if.then2
  %5 = load i32, ptr @verbose, align 4
  %tobool7 = icmp ne i32 %5, 0
  br i1 %tobool7, label %if.then12, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %if.end
  %6 = load i32, ptr @recursive, align 4
  %tobool9 = icmp ne i32 %6, 0
  br i1 %tobool9, label %if.end20, label %land.lhs.true10

land.lhs.true10:                                  ; preds = %lor.lhs.false8
  %7 = load i32, ptr @quiet, align 4
  %tobool11 = icmp ne i32 %7, 0
  br i1 %tobool11, label %if.end20, label %if.then12

if.then12:                                        ; preds = %land.lhs.true10, %if.end
  %8 = load i32, ptr @quiet, align 4
  %tobool13 = icmp ne i32 %8, 0
  br i1 %tobool13, label %if.end16, label %if.then14

if.then14:                                        ; preds = %if.then12
  %9 = load ptr, ptr @stderr, align 8
  %10 = load ptr, ptr @progname, align 8
  %call15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.122, ptr noundef %10, ptr noundef @ifname)
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.then12
  %11 = load i32, ptr @exit_code, align 4
  %cmp17 = icmp eq i32 %11, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end16
  store i32 2, ptr @exit_code, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end16
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %land.lhs.true10, %lor.lhs.false8
  store i32 2, ptr %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.then
  %12 = load ptr, ptr %suff, align 8
  %call22 = call ptr @strlwr(ptr noundef %12)
  %13 = load ptr, ptr %suff, align 8
  %call23 = call i32 @strcmp(ptr noundef %13, ptr noundef @.str.114) #10
  %cmp24 = icmp eq i32 %call23, 0
  br i1 %cmp24, label %if.then28, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.end21
  %14 = load ptr, ptr %suff, align 8
  %call26 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.113) #10
  %cmp27 = icmp eq i32 %call26, 0
  br i1 %cmp27, label %if.then28, label %if.else

if.then28:                                        ; preds = %lor.lhs.false25, %if.end21
  %15 = load ptr, ptr %suff, align 8
  %call29 = call ptr @strcpy(ptr noundef %15, ptr noundef @.str.123) #11
  br label %if.end30

if.else:                                          ; preds = %lor.lhs.false25
  %16 = load ptr, ptr %suff, align 8
  store i8 0, ptr %16, align 1
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then28
  br label %if.end48

if.else31:                                        ; preds = %entry
  %17 = load ptr, ptr %suff, align 8
  %cmp32 = icmp ne ptr %17, null
  br i1 %cmp32, label %if.then33, label %if.else45

if.then33:                                        ; preds = %if.else31
  %18 = load i32, ptr @verbose, align 4
  %tobool34 = icmp ne i32 %18, 0
  br i1 %tobool34, label %if.then39, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %if.then33
  %19 = load i32, ptr @recursive, align 4
  %tobool36 = icmp ne i32 %19, 0
  br i1 %tobool36, label %if.end41, label %land.lhs.true37

land.lhs.true37:                                  ; preds = %lor.lhs.false35
  %20 = load i32, ptr @quiet, align 4
  %tobool38 = icmp ne i32 %20, 0
  br i1 %tobool38, label %if.end41, label %if.then39

if.then39:                                        ; preds = %land.lhs.true37, %if.then33
  %21 = load ptr, ptr @stderr, align 8
  %22 = load ptr, ptr @progname, align 8
  %23 = load ptr, ptr %suff, align 8
  %call40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.124, ptr noundef %22, ptr noundef @ifname, ptr noundef %23)
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %land.lhs.true37, %lor.lhs.false35
  %24 = load i32, ptr @exit_code, align 4
  %cmp42 = icmp eq i32 %24, 0
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end41
  store i32 2, ptr @exit_code, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.end41
  store i32 2, ptr %retval, align 4
  br label %return

if.else45:                                        ; preds = %if.else31
  store i32 0, ptr @save_orig_name, align 4
  %call46 = call ptr @strcat(ptr noundef @ofname, ptr noundef @z_suffix) #11
  br label %if.end47

if.end47:                                         ; preds = %if.else45
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end30
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end48, %if.end44, %if.end20, %if.then6
  %25 = load i32, ptr %retval, align 4
  ret i32 %25
}

declare i32 @open(ptr noundef, i32 noundef, ...) #3

declare void @perror(ptr noundef) #3

declare i32 @close(i32 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @create_outfile() #0 {
entry:
  %retval = alloca i32, align 4
  %ostat = alloca %struct.stat, align 8
  %flags = alloca i32, align 4
  store i32 193, ptr %flags, align 4
  %0 = load i32, ptr @ascii, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr @decompress, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, ptr %flags, align 4
  %and = and i32 %2, -1
  store i32 %and, ptr %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  br label %for.cond

for.cond:                                         ; preds = %if.end31, %if.end
  %call = call i32 @check_ofname()
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then2, label %if.end4

if.then2:                                         ; preds = %for.cond
  %3 = load i32, ptr @ifd, align 4
  %call3 = call i32 @close(i32 noundef %3)
  store i32 1, ptr %retval, align 4
  br label %return

if.end4:                                          ; preds = %for.cond
  store i32 1, ptr @remove_ofname, align 4
  %4 = load i32, ptr %flags, align 4
  %call5 = call i32 (ptr, i32, ...) @open(ptr noundef @ofname, i32 noundef %4, i32 noundef 384)
  store i32 %call5, ptr @ofd, align 4
  %5 = load i32, ptr @ofd, align 4
  %cmp6 = icmp eq i32 %5, -1
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end4
  call void @perror(ptr noundef @ofname)
  %6 = load i32, ptr @ifd, align 4
  %call8 = call i32 @close(i32 noundef %6)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end4
  %7 = load i32, ptr @ofd, align 4
  %call10 = call i32 @fstat(i32 noundef %7, ptr noundef %ostat) #11
  %cmp11 = icmp ne i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end17

if.then12:                                        ; preds = %if.end9
  %8 = load ptr, ptr @stderr, align 8
  %9 = load ptr, ptr @progname, align 8
  %call13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.103, ptr noundef %9)
  call void @perror(ptr noundef @ofname)
  %10 = load i32, ptr @ifd, align 4
  %call14 = call i32 @close(i32 noundef %10)
  %11 = load i32, ptr @ofd, align 4
  %call15 = call i32 @close(i32 noundef %11)
  %call16 = call i32 @unlink(ptr noundef @ofname) #11
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end9
  %call18 = call i32 @name_too_long(ptr noundef @ofname, ptr noundef %ostat)
  %tobool19 = icmp ne i32 %call18, 0
  br i1 %tobool19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end17
  store i32 0, ptr %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end17
  %12 = load i32, ptr @decompress, align 4
  %tobool22 = icmp ne i32 %12, 0
  br i1 %tobool22, label %if.then23, label %if.end31

if.then23:                                        ; preds = %if.end21
  %13 = load i32, ptr @quiet, align 4
  %tobool24 = icmp ne i32 %13, 0
  br i1 %tobool24, label %if.end27, label %if.then25

if.then25:                                        ; preds = %if.then23
  %14 = load ptr, ptr @stderr, align 8
  %15 = load ptr, ptr @progname, align 8
  %call26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.125, ptr noundef %15, ptr noundef @ofname)
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.then23
  %16 = load i32, ptr @exit_code, align 4
  %cmp28 = icmp eq i32 %16, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end27
  store i32 2, ptr @exit_code, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end27
  store i32 0, ptr %retval, align 4
  br label %return

if.end31:                                         ; preds = %if.end21
  %17 = load i32, ptr @ofd, align 4
  %call32 = call i32 @close(i32 noundef %17)
  %call33 = call i32 @unlink(ptr noundef @ofname) #11
  call void @shorten_name(ptr noundef @ofname)
  br label %for.cond

return:                                           ; preds = %if.end30, %if.then20, %if.then12, %if.then7, %if.then2
  %18 = load i32, ptr %retval, align 4
  ret i32 %18
}

; Function Attrs: nounwind
declare i32 @unlink(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @copy_stat(ptr noundef %ifstat) #0 {
entry:
  %ifstat.addr = alloca ptr, align 8
  store ptr %ifstat, ptr %ifstat.addr, align 8
  %0 = load i32, ptr @decompress, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %entry
  %1 = load i64, ptr @time_stamp, align 8
  %cmp = icmp ne i64 %1, 0
  br i1 %cmp, label %land.lhs.true1, label %if.end7

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load ptr, ptr %ifstat.addr, align 8
  %st_mtim = getelementptr inbounds %struct.stat, ptr %2, i32 0, i32 12
  %tv_sec = getelementptr inbounds %struct.timespec, ptr %st_mtim, i32 0, i32 0
  %3 = load i64, ptr %tv_sec, align 8
  %4 = load i64, ptr @time_stamp, align 8
  %cmp2 = icmp ne i64 %3, %4
  br i1 %cmp2, label %if.then, label %if.end7

if.then:                                          ; preds = %land.lhs.true1
  %5 = load i64, ptr @time_stamp, align 8
  %6 = load ptr, ptr %ifstat.addr, align 8
  %st_mtim3 = getelementptr inbounds %struct.stat, ptr %6, i32 0, i32 12
  %tv_sec4 = getelementptr inbounds %struct.timespec, ptr %st_mtim3, i32 0, i32 0
  store i64 %5, ptr %tv_sec4, align 8
  %7 = load i32, ptr @verbose, align 4
  %cmp5 = icmp sgt i32 %7, 1
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then
  %8 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.135, ptr noundef @ofname)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %land.lhs.true1, %land.lhs.true, %entry
  %9 = load ptr, ptr %ifstat.addr, align 8
  call void @reset_times(ptr noundef @ofname, ptr noundef %9)
  %10 = load ptr, ptr %ifstat.addr, align 8
  %st_mode = getelementptr inbounds %struct.stat, ptr %10, i32 0, i32 3
  %11 = load i32, ptr %st_mode, align 8
  %and = and i32 %11, 4095
  %call8 = call i32 @chmod(ptr noundef @ofname, i32 noundef %and) #11
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.end21

if.then10:                                        ; preds = %if.end7
  %12 = load i32, ptr @quiet, align 4
  %tobool11 = icmp ne i32 %12, 0
  br i1 %tobool11, label %if.end14, label %if.then12

if.then12:                                        ; preds = %if.then10
  %13 = load ptr, ptr @stderr, align 8
  %14 = load ptr, ptr @progname, align 8
  %call13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.103, ptr noundef %14)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.then10
  %15 = load i32, ptr @exit_code, align 4
  %cmp15 = icmp eq i32 %15, 0
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  store i32 2, ptr @exit_code, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end14
  %16 = load i32, ptr @quiet, align 4
  %tobool18 = icmp ne i32 %16, 0
  br i1 %tobool18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end17
  call void @perror(ptr noundef @ofname)
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end17
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end7
  %17 = load ptr, ptr %ifstat.addr, align 8
  %st_uid = getelementptr inbounds %struct.stat, ptr %17, i32 0, i32 4
  %18 = load i32, ptr %st_uid, align 4
  %19 = load ptr, ptr %ifstat.addr, align 8
  %st_gid = getelementptr inbounds %struct.stat, ptr %19, i32 0, i32 5
  %20 = load i32, ptr %st_gid, align 8
  %call22 = call i32 @chown(ptr noundef @ofname, i32 noundef %18, i32 noundef %20) #11
  store i32 0, ptr @remove_ofname, align 4
  %call23 = call i32 @chmod(ptr noundef @ifname, i32 noundef 511) #11
  %call24 = call i32 @unlink(ptr noundef @ifname) #11
  %tobool25 = icmp ne i32 %call24, 0
  br i1 %tobool25, label %if.then26, label %if.end37

if.then26:                                        ; preds = %if.end21
  %21 = load i32, ptr @quiet, align 4
  %tobool27 = icmp ne i32 %21, 0
  br i1 %tobool27, label %if.end30, label %if.then28

if.then28:                                        ; preds = %if.then26
  %22 = load ptr, ptr @stderr, align 8
  %23 = load ptr, ptr @progname, align 8
  %call29 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %22, ptr noundef @.str.103, ptr noundef %23)
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.then26
  %24 = load i32, ptr @exit_code, align 4
  %cmp31 = icmp eq i32 %24, 0
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  store i32 2, ptr @exit_code, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  %25 = load i32, ptr @quiet, align 4
  %tobool34 = icmp ne i32 %25, 0
  br i1 %tobool34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end33
  call void @perror(ptr noundef @ifname)
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.end33
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.end21
  ret void
}

; Function Attrs: nounwind
declare i32 @chmod(ptr noundef, i32 noundef) #2

; Function Attrs: nounwind
declare i32 @chown(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @check_ofname() #0 {
entry:
  %retval = alloca i32, align 4
  %ostat = alloca %struct.stat, align 8
  %response = alloca [80 x i8], align 16
  %call = call ptr @__errno_location() #13
  store i32 0, ptr %call, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %call1 = call i32 @stat(ptr noundef @ofname, ptr noundef %ostat) #11
  %cmp = icmp ne i32 %call1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call2 = call ptr @__errno_location() #13
  %0 = load i32, ptr %call2, align 4
  %cmp3 = icmp ne i32 %0, 36
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  call void @shorten_name(ptr noundef @ofname)
  br label %while.cond, !llvm.loop !16

while.end:                                        ; preds = %while.cond
  %1 = load i32, ptr @decompress, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.end11, label %land.lhs.true

land.lhs.true:                                    ; preds = %while.end
  %call4 = call i32 @name_too_long(ptr noundef @ofname, ptr noundef %ostat)
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then6, label %if.end11

if.then6:                                         ; preds = %land.lhs.true
  call void @shorten_name(ptr noundef @ofname)
  %call7 = call i32 @stat(ptr noundef @ofname, ptr noundef %ostat) #11
  %cmp8 = icmp ne i32 %call7, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then6
  store i32 0, ptr %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.then6
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %land.lhs.true, %while.end
  %call12 = call i32 @same_file(ptr noundef @istat, ptr noundef %ostat)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end22

if.then14:                                        ; preds = %if.end11
  %call15 = call i32 @strcmp(ptr noundef @ifname, ptr noundef @ofname) #10
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.then14
  %2 = load ptr, ptr @stderr, align 8
  %3 = load ptr, ptr @progname, align 8
  %4 = load i32, ptr @decompress, align 4
  %tobool18 = icmp ne i32 %4, 0
  %5 = zext i1 %tobool18 to i64
  %cond = select i1 %tobool18, ptr @.str.79, ptr @.str.60
  %call19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.126, ptr noundef %3, ptr noundef @ifname, ptr noundef %cond)
  br label %if.end21

if.else:                                          ; preds = %if.then14
  %6 = load ptr, ptr @stderr, align 8
  %7 = load ptr, ptr @progname, align 8
  %call20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.127, ptr noundef %7, ptr noundef @ifname, ptr noundef @ofname)
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then17
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end22:                                         ; preds = %if.end11
  %8 = load i32, ptr @force, align 4
  %tobool23 = icmp ne i32 %8, 0
  br i1 %tobool23, label %if.end56, label %if.then24

if.then24:                                        ; preds = %if.end22
  %arraydecay = getelementptr inbounds [80 x i8], ptr %response, i64 0, i64 0
  %call25 = call ptr @strcpy(ptr noundef %arraydecay, ptr noundef @.str.128) #11
  %9 = load ptr, ptr @stderr, align 8
  %10 = load ptr, ptr @progname, align 8
  %call26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.129, ptr noundef %10, ptr noundef @ofname)
  %11 = load i32, ptr @foreground, align 4
  %tobool27 = icmp ne i32 %11, 0
  br i1 %tobool27, label %land.lhs.true28, label %if.end37

land.lhs.true28:                                  ; preds = %if.then24
  %12 = load ptr, ptr @stdin, align 8
  %call29 = call i32 @fileno(ptr noundef %12) #11
  %call30 = call i32 @isatty(i32 noundef %call29) #11
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %if.then32, label %if.end37

if.then32:                                        ; preds = %land.lhs.true28
  %13 = load ptr, ptr @stderr, align 8
  %call33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.130)
  %14 = load ptr, ptr @stderr, align 8
  %call34 = call i32 @fflush(ptr noundef %14)
  %arraydecay35 = getelementptr inbounds [80 x i8], ptr %response, i64 0, i64 0
  %15 = load ptr, ptr @stdin, align 8
  %call36 = call ptr @fgets(ptr noundef %arraydecay35, i32 noundef 79, ptr noundef %15)
  br label %if.end37

if.end37:                                         ; preds = %if.then32, %land.lhs.true28, %if.then24
  %call38 = call ptr @__ctype_b_loc() #13
  %16 = load ptr, ptr %call38, align 8
  %arraydecay39 = getelementptr inbounds [80 x i8], ptr %response, i64 0, i64 0
  %17 = load i8, ptr %arraydecay39, align 16
  %conv = sext i8 %17 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx = getelementptr inbounds i16, ptr %16, i64 %idxprom
  %18 = load i16, ptr %arrayidx, align 2
  %conv40 = zext i16 %18 to i32
  %and = and i32 %conv40, 256
  %tobool41 = icmp ne i32 %and, 0
  br i1 %tobool41, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end37
  %arraydecay42 = getelementptr inbounds [80 x i8], ptr %response, i64 0, i64 0
  %19 = load i8, ptr %arraydecay42, align 16
  %conv43 = sext i8 %19 to i32
  %sub = sub nsw i32 %conv43, 65
  %add = add nsw i32 %sub, 97
  br label %cond.end

cond.false:                                       ; preds = %if.end37
  %arraydecay44 = getelementptr inbounds [80 x i8], ptr %response, i64 0, i64 0
  %20 = load i8, ptr %arraydecay44, align 16
  %conv45 = sext i8 %20 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond46 = phi i32 [ %add, %cond.true ], [ %conv45, %cond.false ]
  %cmp47 = icmp ne i32 %cond46, 121
  br i1 %cmp47, label %if.then49, label %if.end55

if.then49:                                        ; preds = %cond.end
  %21 = load ptr, ptr @stderr, align 8
  %call50 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.131)
  %22 = load i32, ptr @exit_code, align 4
  %cmp51 = icmp eq i32 %22, 0
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.then49
  store i32 2, ptr @exit_code, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %if.then49
  store i32 1, ptr %retval, align 4
  br label %return

if.end55:                                         ; preds = %cond.end
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end22
  %call57 = call i32 @chmod(ptr noundef @ofname, i32 noundef 511) #11
  %call58 = call i32 @unlink(ptr noundef @ofname) #11
  %tobool59 = icmp ne i32 %call58, 0
  br i1 %tobool59, label %if.then60, label %if.end62

if.then60:                                        ; preds = %if.end56
  %23 = load ptr, ptr @stderr, align 8
  %24 = load ptr, ptr @progname, align 8
  %call61 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.103, ptr noundef %24)
  call void @perror(ptr noundef @ofname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end62:                                         ; preds = %if.end56
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end62, %if.then60, %if.end54, %if.end21, %if.then9, %if.then
  %25 = load i32, ptr %retval, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @name_too_long(ptr noundef %name, ptr noundef %statb) #0 {
entry:
  %name.addr = alloca ptr, align 8
  %statb.addr = alloca ptr, align 8
  %s = alloca i32, align 4
  %c = alloca i8, align 1
  %tstat = alloca %struct.stat, align 8
  %res = alloca i32, align 4
  store ptr %name, ptr %name.addr, align 8
  store ptr %statb, ptr %statb.addr, align 8
  %0 = load ptr, ptr %name.addr, align 8
  %call = call i64 @strlen(ptr noundef %0) #10
  %conv = trunc i64 %call to i32
  store i32 %conv, ptr %s, align 4
  %1 = load ptr, ptr %name.addr, align 8
  %2 = load i32, ptr %s, align 4
  %sub = sub nsw i32 %2, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i8, ptr %1, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  store i8 %3, ptr %c, align 1
  %4 = load ptr, ptr %statb.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %tstat, ptr align 8 %4, i64 144, i1 false)
  %5 = load ptr, ptr %name.addr, align 8
  %6 = load i32, ptr %s, align 4
  %sub1 = sub nsw i32 %6, 1
  %idxprom2 = sext i32 %sub1 to i64
  %arrayidx3 = getelementptr inbounds i8, ptr %5, i64 %idxprom2
  store i8 0, ptr %arrayidx3, align 1
  %7 = load ptr, ptr %name.addr, align 8
  %call4 = call i32 @stat(ptr noundef %7, ptr noundef %tstat) #11
  %cmp = icmp eq i32 %call4, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %8 = load ptr, ptr %statb.addr, align 8
  %call6 = call i32 @same_file(ptr noundef %8, ptr noundef %tstat)
  %tobool = icmp ne i32 %call6, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %9 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  store i32 %land.ext, ptr %res, align 4
  %10 = load i8, ptr %c, align 1
  %11 = load ptr, ptr %name.addr, align 8
  %12 = load i32, ptr %s, align 4
  %sub7 = sub nsw i32 %12, 1
  %idxprom8 = sext i32 %sub7 to i64
  %arrayidx9 = getelementptr inbounds i8, ptr %11, i64 %idxprom8
  store i8 %10, ptr %arrayidx9, align 1
  %13 = load i32, ptr %res, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @shorten_name(ptr noundef %name) #0 {
entry:
  %name.addr = alloca ptr, align 8
  %len = alloca i32, align 4
  %trunc = alloca ptr, align 8
  %plen = alloca i32, align 4
  %min_part = alloca i32, align 4
  %p = alloca ptr, align 8
  store ptr %name, ptr %name.addr, align 8
  store ptr null, ptr %trunc, align 8
  store i32 3, ptr %min_part, align 4
  %0 = load ptr, ptr %name.addr, align 8
  %call = call i64 @strlen(ptr noundef %0) #10
  %conv = trunc i64 %call to i32
  store i32 %conv, ptr %len, align 4
  %1 = load i32, ptr @decompress, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %len, align 4
  %cmp = icmp sle i32 %2, 1
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @error(ptr noundef @.str.132)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %3 = load ptr, ptr %name.addr, align 8
  %4 = load i32, ptr %len, align 4
  %sub = sub nsw i32 %4, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds i8, ptr %3, i64 %idxprom
  store i8 0, ptr %arrayidx, align 1
  br label %return

if.end3:                                          ; preds = %entry
  %5 = load ptr, ptr %name.addr, align 8
  %call4 = call ptr @get_suffix(ptr noundef %5)
  store ptr %call4, ptr %p, align 8
  %6 = load ptr, ptr %p, align 8
  %cmp5 = icmp eq ptr %6, null
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end3
  call void @error(ptr noundef @.str.133)
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end3
  %7 = load ptr, ptr %p, align 8
  store i8 0, ptr %7, align 1
  store i32 1, ptr @save_orig_name, align 4
  %8 = load i32, ptr %len, align 4
  %cmp9 = icmp sgt i32 %8, 4
  br i1 %cmp9, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.end8
  %9 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %9, i64 -4
  %call11 = call i32 @strcmp(ptr noundef %add.ptr, ptr noundef @.str.123) #10
  %cmp12 = icmp eq i32 %call11, 0
  br i1 %cmp12, label %if.then14, label %if.end17

if.then14:                                        ; preds = %land.lhs.true
  %10 = load ptr, ptr %p, align 8
  %add.ptr15 = getelementptr inbounds i8, ptr %10, i64 -4
  %call16 = call ptr @strcpy(ptr noundef %add.ptr15, ptr noundef @.str.114) #11
  br label %return

if.end17:                                         ; preds = %land.lhs.true, %if.end8
  br label %do.body

do.body:                                          ; preds = %land.end, %if.end17
  %11 = load ptr, ptr %name.addr, align 8
  %call18 = call ptr @strrchr(ptr noundef %11, i32 noundef 47) #10
  store ptr %call18, ptr %p, align 8
  %12 = load ptr, ptr %p, align 8
  %tobool19 = icmp ne ptr %12, null
  br i1 %tobool19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.body
  %13 = load ptr, ptr %p, align 8
  %add.ptr20 = getelementptr inbounds i8, ptr %13, i64 1
  br label %cond.end

cond.false:                                       ; preds = %do.body
  %14 = load ptr, ptr %name.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %add.ptr20, %cond.true ], [ %14, %cond.false ]
  store ptr %cond, ptr %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end32, %cond.end
  %15 = load ptr, ptr %p, align 8
  %16 = load i8, ptr %15, align 1
  %tobool21 = icmp ne i8 %16, 0
  br i1 %tobool21, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %17 = load ptr, ptr %p, align 8
  %call22 = call i64 @strcspn(ptr noundef %17, ptr noundef @.str.119) #10
  %conv23 = trunc i64 %call22 to i32
  store i32 %conv23, ptr %plen, align 4
  %18 = load i32, ptr %plen, align 4
  %19 = load ptr, ptr %p, align 8
  %idx.ext = sext i32 %18 to i64
  %add.ptr24 = getelementptr inbounds i8, ptr %19, i64 %idx.ext
  store ptr %add.ptr24, ptr %p, align 8
  %20 = load i32, ptr %plen, align 4
  %21 = load i32, ptr %min_part, align 4
  %cmp25 = icmp sgt i32 %20, %21
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %while.body
  %22 = load ptr, ptr %p, align 8
  %add.ptr28 = getelementptr inbounds i8, ptr %22, i64 -1
  store ptr %add.ptr28, ptr %trunc, align 8
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %while.body
  %23 = load ptr, ptr %p, align 8
  %24 = load i8, ptr %23, align 1
  %tobool30 = icmp ne i8 %24, 0
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end29
  %25 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %25, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end29
  br label %while.cond, !llvm.loop !17

while.end:                                        ; preds = %while.cond
  br label %do.cond

do.cond:                                          ; preds = %while.end
  %26 = load ptr, ptr %trunc, align 8
  %cmp33 = icmp eq ptr %26, null
  br i1 %cmp33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %27 = load i32, ptr %min_part, align 4
  %dec = add nsw i32 %27, -1
  store i32 %dec, ptr %min_part, align 4
  %cmp35 = icmp ne i32 %dec, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %28 = phi i1 [ false, %do.cond ], [ %cmp35, %land.rhs ]
  br i1 %28, label %do.body, label %do.end, !llvm.loop !18

do.end:                                           ; preds = %land.end
  %29 = load ptr, ptr %trunc, align 8
  %cmp37 = icmp ne ptr %29, null
  br i1 %cmp37, label %if.then39, label %if.else

if.then39:                                        ; preds = %do.end
  br label %do.body40

do.body40:                                        ; preds = %do.cond43, %if.then39
  %30 = load ptr, ptr %trunc, align 8
  %arrayidx41 = getelementptr inbounds i8, ptr %30, i64 1
  %31 = load i8, ptr %arrayidx41, align 1
  %32 = load ptr, ptr %trunc, align 8
  %arrayidx42 = getelementptr inbounds i8, ptr %32, i64 0
  store i8 %31, ptr %arrayidx42, align 1
  br label %do.cond43

do.cond43:                                        ; preds = %do.body40
  %33 = load ptr, ptr %trunc, align 8
  %incdec.ptr44 = getelementptr inbounds i8, ptr %33, i32 1
  store ptr %incdec.ptr44, ptr %trunc, align 8
  %34 = load i8, ptr %33, align 1
  %tobool45 = icmp ne i8 %34, 0
  br i1 %tobool45, label %do.body40, label %do.end46, !llvm.loop !19

do.end46:                                         ; preds = %do.cond43
  %35 = load ptr, ptr %trunc, align 8
  %incdec.ptr47 = getelementptr inbounds i8, ptr %35, i32 -1
  store ptr %incdec.ptr47, ptr %trunc, align 8
  br label %if.end61

if.else:                                          ; preds = %do.end
  %36 = load ptr, ptr %name.addr, align 8
  %37 = load i8, ptr @.str.119, align 1
  %conv48 = sext i8 %37 to i32
  %call49 = call ptr @strrchr(ptr noundef %36, i32 noundef %conv48) #10
  store ptr %call49, ptr %trunc, align 8
  %38 = load ptr, ptr %trunc, align 8
  %cmp50 = icmp eq ptr %38, null
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.else
  call void @error(ptr noundef @.str.134)
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %if.else
  %39 = load ptr, ptr %trunc, align 8
  %arrayidx54 = getelementptr inbounds i8, ptr %39, i64 1
  %40 = load i8, ptr %arrayidx54, align 1
  %conv55 = sext i8 %40 to i32
  %cmp56 = icmp eq i32 %conv55, 0
  br i1 %cmp56, label %if.then58, label %if.end60

if.then58:                                        ; preds = %if.end53
  %41 = load ptr, ptr %trunc, align 8
  %incdec.ptr59 = getelementptr inbounds i8, ptr %41, i32 -1
  store ptr %incdec.ptr59, ptr %trunc, align 8
  br label %if.end60

if.end60:                                         ; preds = %if.then58, %if.end53
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %do.end46
  %42 = load ptr, ptr %trunc, align 8
  %call62 = call ptr @strcpy(ptr noundef %42, ptr noundef @z_suffix) #11
  br label %return

return:                                           ; preds = %if.end61, %if.then14, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @get_suffix(ptr noundef %name) #0 {
entry:
  %retval = alloca ptr, align 8
  %name.addr = alloca ptr, align 8
  %nlen = alloca i32, align 4
  %slen = alloca i32, align 4
  %suffix = alloca [33 x i8], align 16
  %suf = alloca ptr, align 8
  %s = alloca i32, align 4
  store ptr %name, ptr %name.addr, align 8
  store ptr @get_suffix.known_suffixes, ptr %suf, align 8
  %call = call i32 @strcmp(ptr noundef @z_suffix, ptr noundef @.str.117) #10
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load ptr, ptr %suf, align 8
  %incdec.ptr = getelementptr inbounds ptr, ptr %0, i32 1
  store ptr %incdec.ptr, ptr %suf, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load ptr, ptr %name.addr, align 8
  %call1 = call i64 @strlen(ptr noundef %1) #10
  %conv = trunc i64 %call1 to i32
  store i32 %conv, ptr %nlen, align 4
  %2 = load i32, ptr %nlen, align 4
  %cmp2 = icmp sle i32 %2, 32
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %arraydecay = getelementptr inbounds [33 x i8], ptr %suffix, i64 0, i64 0
  %3 = load ptr, ptr %name.addr, align 8
  %call5 = call ptr @strcpy(ptr noundef %arraydecay, ptr noundef %3) #11
  br label %if.end10

if.else:                                          ; preds = %if.end
  %arraydecay6 = getelementptr inbounds [33 x i8], ptr %suffix, i64 0, i64 0
  %4 = load ptr, ptr %name.addr, align 8
  %5 = load i32, ptr %nlen, align 4
  %idx.ext = sext i32 %5 to i64
  %add.ptr = getelementptr inbounds i8, ptr %4, i64 %idx.ext
  %add.ptr7 = getelementptr inbounds i8, ptr %add.ptr, i64 -30
  %add.ptr8 = getelementptr inbounds i8, ptr %add.ptr7, i64 -2
  %call9 = call ptr @strcpy(ptr noundef %arraydecay6, ptr noundef %add.ptr8) #11
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then4
  %arraydecay11 = getelementptr inbounds [33 x i8], ptr %suffix, i64 0, i64 0
  %call12 = call ptr @strlwr(ptr noundef %arraydecay11)
  %arraydecay13 = getelementptr inbounds [33 x i8], ptr %suffix, i64 0, i64 0
  %call14 = call i64 @strlen(ptr noundef %arraydecay13) #10
  %conv15 = trunc i64 %call14 to i32
  store i32 %conv15, ptr %slen, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end10
  %6 = load ptr, ptr %suf, align 8
  %7 = load ptr, ptr %6, align 8
  %call16 = call i64 @strlen(ptr noundef %7) #10
  %conv17 = trunc i64 %call16 to i32
  store i32 %conv17, ptr %s, align 4
  %8 = load i32, ptr %slen, align 4
  %9 = load i32, ptr %s, align 4
  %cmp18 = icmp sgt i32 %8, %9
  br i1 %cmp18, label %land.lhs.true, label %if.end39

land.lhs.true:                                    ; preds = %do.body
  %10 = load i32, ptr %slen, align 4
  %11 = load i32, ptr %s, align 4
  %sub = sub nsw i32 %10, %11
  %sub20 = sub nsw i32 %sub, 1
  %idxprom = sext i32 %sub20 to i64
  %arrayidx = getelementptr inbounds [33 x i8], ptr %suffix, i64 0, i64 %idxprom
  %12 = load i8, ptr %arrayidx, align 1
  %conv21 = sext i8 %12 to i32
  %cmp22 = icmp ne i32 %conv21, 47
  br i1 %cmp22, label %land.lhs.true24, label %if.end39

land.lhs.true24:                                  ; preds = %land.lhs.true
  %arraydecay25 = getelementptr inbounds [33 x i8], ptr %suffix, i64 0, i64 0
  %13 = load i32, ptr %slen, align 4
  %idx.ext26 = sext i32 %13 to i64
  %add.ptr27 = getelementptr inbounds i8, ptr %arraydecay25, i64 %idx.ext26
  %14 = load i32, ptr %s, align 4
  %idx.ext28 = sext i32 %14 to i64
  %idx.neg = sub i64 0, %idx.ext28
  %add.ptr29 = getelementptr inbounds i8, ptr %add.ptr27, i64 %idx.neg
  %15 = load ptr, ptr %suf, align 8
  %16 = load ptr, ptr %15, align 8
  %call30 = call i32 @strcmp(ptr noundef %add.ptr29, ptr noundef %16) #10
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.then33, label %if.end39

if.then33:                                        ; preds = %land.lhs.true24
  %17 = load ptr, ptr %name.addr, align 8
  %18 = load i32, ptr %nlen, align 4
  %idx.ext34 = sext i32 %18 to i64
  %add.ptr35 = getelementptr inbounds i8, ptr %17, i64 %idx.ext34
  %19 = load i32, ptr %s, align 4
  %idx.ext36 = sext i32 %19 to i64
  %idx.neg37 = sub i64 0, %idx.ext36
  %add.ptr38 = getelementptr inbounds i8, ptr %add.ptr35, i64 %idx.neg37
  store ptr %add.ptr38, ptr %retval, align 8
  br label %return

if.end39:                                         ; preds = %land.lhs.true24, %land.lhs.true, %do.body
  br label %do.cond

do.cond:                                          ; preds = %if.end39
  %20 = load ptr, ptr %suf, align 8
  %incdec.ptr40 = getelementptr inbounds ptr, ptr %20, i32 1
  store ptr %incdec.ptr40, ptr %suf, align 8
  %21 = load ptr, ptr %incdec.ptr40, align 8
  %cmp41 = icmp ne ptr %21, null
  br i1 %cmp41, label %do.body, label %do.end, !llvm.loop !20

do.end:                                           ; preds = %do.cond
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %do.end, %if.then33
  %22 = load ptr, ptr %retval, align 8
  ret ptr %22
}

; Function Attrs: nounwind readonly willreturn
declare ptr @strrchr(ptr noundef, i32 noundef) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @strcspn(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @stat(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @same_file(ptr noundef %stat1, ptr noundef %stat2) #0 {
entry:
  %stat1.addr = alloca ptr, align 8
  %stat2.addr = alloca ptr, align 8
  store ptr %stat1, ptr %stat1.addr, align 8
  store ptr %stat2, ptr %stat2.addr, align 8
  %0 = load ptr, ptr %stat1.addr, align 8
  %st_ino = getelementptr inbounds %struct.stat, ptr %0, i32 0, i32 1
  %1 = load i64, ptr %st_ino, align 8
  %2 = load ptr, ptr %stat2.addr, align 8
  %st_ino1 = getelementptr inbounds %struct.stat, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %st_ino1, align 8
  %cmp = icmp eq i64 %1, %3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load ptr, ptr %stat1.addr, align 8
  %st_dev = getelementptr inbounds %struct.stat, ptr %4, i32 0, i32 0
  %5 = load i64, ptr %st_dev, align 8
  %6 = load ptr, ptr %stat2.addr, align 8
  %st_dev2 = getelementptr inbounds %struct.stat, ptr %6, i32 0, i32 0
  %7 = load i64, ptr %st_dev2, align 8
  %cmp3 = icmp eq i64 %5, %7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %8 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind readnone willreturn
declare ptr @__errno_location() #5

declare i32 @fflush(ptr noundef) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind readnone willreturn
declare ptr @__ctype_b_loc() #5

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @utime(ptr noundef, ptr noundef) #2

declare ptr @opendir(ptr noundef) #3

declare ptr @readdir(ptr noundef) #3

declare i32 @closedir(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @do_stat(ptr noundef %name, ptr noundef %sbuf) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca ptr, align 8
  %sbuf.addr = alloca ptr, align 8
  store ptr %name, ptr %name.addr, align 8
  store ptr %sbuf, ptr %sbuf.addr, align 8
  %call = call ptr @__errno_location() #13
  store i32 0, ptr %call, align 4
  %0 = load i32, ptr @to_stdout, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr @force, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %2 = load ptr, ptr %name.addr, align 8
  %3 = load ptr, ptr %sbuf.addr, align 8
  %call2 = call i32 @lstat(ptr noundef %2, ptr noundef %3) #11
  store i32 %call2, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %4 = load ptr, ptr %name.addr, align 8
  %5 = load ptr, ptr %sbuf.addr, align 8
  %call3 = call i32 @stat(ptr noundef %4, ptr noundef %5) #11
  store i32 %call3, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, ptr %retval, align 4
  ret i32 %6
}

; Function Attrs: nounwind
declare i32 @lstat(ptr noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #6

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @zip(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  %flags = alloca i8, align 1
  %attr = alloca i16, align 2
  %deflate_flags = alloca i16, align 2
  %p = alloca ptr, align 8
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  store i8 0, ptr %flags, align 1
  store i16 0, ptr %attr, align 2
  store i16 0, ptr %deflate_flags, align 2
  %0 = load i32, ptr %in.addr, align 4
  store i32 %0, ptr @ifd, align 4
  %1 = load i32, ptr %out.addr, align 4
  store i32 %1, ptr @ofd, align 4
  store i32 0, ptr @outcnt, align 4
  store i32 8, ptr @method, align 4
  %2 = load i8, ptr @.str.148, align 1
  %3 = load i32, ptr @outcnt, align 4
  %inc = add i32 %3, 1
  store i32 %inc, ptr @outcnt, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom
  store i8 %2, ptr %arrayidx, align 1
  %4 = load i32, ptr @outcnt, align 4
  %cmp = icmp eq i32 %4, 16384
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @flush_outbuf()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @.str.148, i64 0, i64 1), align 1
  %6 = load i32, ptr @outcnt, align 4
  %inc1 = add i32 %6, 1
  store i32 %inc1, ptr @outcnt, align 4
  %idxprom2 = zext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom2
  store i8 %5, ptr %arrayidx3, align 1
  %7 = load i32, ptr @outcnt, align 4
  %cmp4 = icmp eq i32 %7, 16384
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @flush_outbuf()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %8 = load i32, ptr @outcnt, align 4
  %inc7 = add i32 %8, 1
  store i32 %inc7, ptr @outcnt, align 4
  %idxprom8 = zext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom8
  store i8 8, ptr %arrayidx9, align 1
  %9 = load i32, ptr @outcnt, align 4
  %cmp10 = icmp eq i32 %9, 16384
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end6
  call void @flush_outbuf()
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end6
  %10 = load i32, ptr @save_orig_name, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end12
  %11 = load i8, ptr %flags, align 1
  %conv = zext i8 %11 to i32
  %or = or i32 %conv, 8
  %conv14 = trunc i32 %or to i8
  store i8 %conv14, ptr %flags, align 1
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end12
  %12 = load i8, ptr %flags, align 1
  %13 = load i32, ptr @outcnt, align 4
  %inc16 = add i32 %13, 1
  store i32 %inc16, ptr @outcnt, align 4
  %idxprom17 = zext i32 %13 to i64
  %arrayidx18 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom17
  store i8 %12, ptr %arrayidx18, align 1
  %14 = load i32, ptr @outcnt, align 4
  %cmp19 = icmp eq i32 %14, 16384
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @flush_outbuf()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end15
  %15 = load i32, ptr @outcnt, align 4
  %cmp23 = icmp ult i32 %15, 16382
  br i1 %cmp23, label %if.then25, label %if.else

if.then25:                                        ; preds = %if.end22
  %16 = load i64, ptr @time_stamp, align 8
  %and = and i64 %16, 65535
  %and26 = and i64 %and, 255
  %conv27 = trunc i64 %and26 to i8
  %17 = load i32, ptr @outcnt, align 4
  %inc28 = add i32 %17, 1
  store i32 %inc28, ptr @outcnt, align 4
  %idxprom29 = zext i32 %17 to i64
  %arrayidx30 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom29
  store i8 %conv27, ptr %arrayidx30, align 1
  %18 = load i64, ptr @time_stamp, align 8
  %and31 = and i64 %18, 65535
  %conv32 = trunc i64 %and31 to i16
  %conv33 = zext i16 %conv32 to i32
  %shr = ashr i32 %conv33, 8
  %conv34 = trunc i32 %shr to i8
  %19 = load i32, ptr @outcnt, align 4
  %inc35 = add i32 %19, 1
  store i32 %inc35, ptr @outcnt, align 4
  %idxprom36 = zext i32 %19 to i64
  %arrayidx37 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom36
  store i8 %conv34, ptr %arrayidx37, align 1
  br label %if.end60

if.else:                                          ; preds = %if.end22
  %20 = load i64, ptr @time_stamp, align 8
  %and38 = and i64 %20, 65535
  %and39 = and i64 %and38, 255
  %conv40 = trunc i64 %and39 to i8
  %21 = load i32, ptr @outcnt, align 4
  %inc41 = add i32 %21, 1
  store i32 %inc41, ptr @outcnt, align 4
  %idxprom42 = zext i32 %21 to i64
  %arrayidx43 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom42
  store i8 %conv40, ptr %arrayidx43, align 1
  %22 = load i32, ptr @outcnt, align 4
  %cmp44 = icmp eq i32 %22, 16384
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.else
  call void @flush_outbuf()
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %if.else
  %23 = load i64, ptr @time_stamp, align 8
  %and48 = and i64 %23, 65535
  %conv49 = trunc i64 %and48 to i16
  %conv50 = zext i16 %conv49 to i32
  %shr51 = ashr i32 %conv50, 8
  %conv52 = trunc i32 %shr51 to i8
  %24 = load i32, ptr @outcnt, align 4
  %inc53 = add i32 %24, 1
  store i32 %inc53, ptr @outcnt, align 4
  %idxprom54 = zext i32 %24 to i64
  %arrayidx55 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom54
  store i8 %conv52, ptr %arrayidx55, align 1
  %25 = load i32, ptr @outcnt, align 4
  %cmp56 = icmp eq i32 %25, 16384
  br i1 %cmp56, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.end47
  call void @flush_outbuf()
  br label %if.end59

if.end59:                                         ; preds = %if.then58, %if.end47
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %if.then25
  %26 = load i32, ptr @outcnt, align 4
  %cmp61 = icmp ult i32 %26, 16382
  br i1 %cmp61, label %if.then63, label %if.else78

if.then63:                                        ; preds = %if.end60
  %27 = load i64, ptr @time_stamp, align 8
  %shr64 = lshr i64 %27, 16
  %and65 = and i64 %shr64, 255
  %conv66 = trunc i64 %and65 to i8
  %28 = load i32, ptr @outcnt, align 4
  %inc67 = add i32 %28, 1
  store i32 %inc67, ptr @outcnt, align 4
  %idxprom68 = zext i32 %28 to i64
  %arrayidx69 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom68
  store i8 %conv66, ptr %arrayidx69, align 1
  %29 = load i64, ptr @time_stamp, align 8
  %shr70 = lshr i64 %29, 16
  %conv71 = trunc i64 %shr70 to i16
  %conv72 = zext i16 %conv71 to i32
  %shr73 = ashr i32 %conv72, 8
  %conv74 = trunc i32 %shr73 to i8
  %30 = load i32, ptr @outcnt, align 4
  %inc75 = add i32 %30, 1
  store i32 %inc75, ptr @outcnt, align 4
  %idxprom76 = zext i32 %30 to i64
  %arrayidx77 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom76
  store i8 %conv74, ptr %arrayidx77, align 1
  br label %if.end101

if.else78:                                        ; preds = %if.end60
  %31 = load i64, ptr @time_stamp, align 8
  %shr79 = lshr i64 %31, 16
  %and80 = and i64 %shr79, 255
  %conv81 = trunc i64 %and80 to i8
  %32 = load i32, ptr @outcnt, align 4
  %inc82 = add i32 %32, 1
  store i32 %inc82, ptr @outcnt, align 4
  %idxprom83 = zext i32 %32 to i64
  %arrayidx84 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom83
  store i8 %conv81, ptr %arrayidx84, align 1
  %33 = load i32, ptr @outcnt, align 4
  %cmp85 = icmp eq i32 %33, 16384
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.else78
  call void @flush_outbuf()
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.else78
  %34 = load i64, ptr @time_stamp, align 8
  %shr89 = lshr i64 %34, 16
  %conv90 = trunc i64 %shr89 to i16
  %conv91 = zext i16 %conv90 to i32
  %shr92 = ashr i32 %conv91, 8
  %conv93 = trunc i32 %shr92 to i8
  %35 = load i32, ptr @outcnt, align 4
  %inc94 = add i32 %35, 1
  store i32 %inc94, ptr @outcnt, align 4
  %idxprom95 = zext i32 %35 to i64
  %arrayidx96 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom95
  store i8 %conv93, ptr %arrayidx96, align 1
  %36 = load i32, ptr @outcnt, align 4
  %cmp97 = icmp eq i32 %36, 16384
  br i1 %cmp97, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end88
  call void @flush_outbuf()
  br label %if.end100

if.end100:                                        ; preds = %if.then99, %if.end88
  br label %if.end101

if.end101:                                        ; preds = %if.end100, %if.then63
  %call = call i64 @updcrc(ptr noundef null, i32 noundef 0)
  store i64 %call, ptr @crc, align 8
  %37 = load i32, ptr %out.addr, align 4
  call void @bi_init(i32 noundef %37)
  call void @ct_init(ptr noundef %attr, ptr noundef @method)
  %38 = load i32, ptr @level, align 4
  call void @lm_init(i32 noundef %38, ptr noundef %deflate_flags)
  %39 = load i16, ptr %deflate_flags, align 2
  %conv102 = trunc i16 %39 to i8
  %40 = load i32, ptr @outcnt, align 4
  %inc103 = add i32 %40, 1
  store i32 %inc103, ptr @outcnt, align 4
  %idxprom104 = zext i32 %40 to i64
  %arrayidx105 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom104
  store i8 %conv102, ptr %arrayidx105, align 1
  %41 = load i32, ptr @outcnt, align 4
  %cmp106 = icmp eq i32 %41, 16384
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %if.end101
  call void @flush_outbuf()
  br label %if.end109

if.end109:                                        ; preds = %if.then108, %if.end101
  %42 = load i32, ptr @outcnt, align 4
  %inc110 = add i32 %42, 1
  store i32 %inc110, ptr @outcnt, align 4
  %idxprom111 = zext i32 %42 to i64
  %arrayidx112 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom111
  store i8 3, ptr %arrayidx112, align 1
  %43 = load i32, ptr @outcnt, align 4
  %cmp113 = icmp eq i32 %43, 16384
  br i1 %cmp113, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.end109
  call void @flush_outbuf()
  br label %if.end116

if.end116:                                        ; preds = %if.then115, %if.end109
  %44 = load i32, ptr @save_orig_name, align 4
  %tobool117 = icmp ne i32 %44, 0
  br i1 %tobool117, label %if.then118, label %if.end128

if.then118:                                       ; preds = %if.end116
  %call119 = call ptr @basename(ptr noundef @ifname)
  store ptr %call119, ptr %p, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then118
  %45 = load ptr, ptr %p, align 8
  %46 = load i8, ptr %45, align 1
  %47 = load i32, ptr @outcnt, align 4
  %inc120 = add i32 %47, 1
  store i32 %inc120, ptr @outcnt, align 4
  %idxprom121 = zext i32 %47 to i64
  %arrayidx122 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom121
  store i8 %46, ptr %arrayidx122, align 1
  %48 = load i32, ptr @outcnt, align 4
  %cmp123 = icmp eq i32 %48, 16384
  br i1 %cmp123, label %if.then125, label %if.end126

if.then125:                                       ; preds = %do.body
  call void @flush_outbuf()
  br label %if.end126

if.end126:                                        ; preds = %if.then125, %do.body
  br label %do.cond

do.cond:                                          ; preds = %if.end126
  %49 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %49, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %50 = load i8, ptr %49, align 1
  %tobool127 = icmp ne i8 %50, 0
  br i1 %tobool127, label %do.body, label %do.end, !llvm.loop !21

do.end:                                           ; preds = %do.cond
  br label %if.end128

if.end128:                                        ; preds = %do.end, %if.end116
  %51 = load i32, ptr @outcnt, align 4
  %conv129 = zext i32 %51 to i64
  store i64 %conv129, ptr @header_bytes, align 8
  %call130 = call i64 @deflate()
  %52 = load i32, ptr @outcnt, align 4
  %cmp131 = icmp ult i32 %52, 16382
  br i1 %cmp131, label %if.then133, label %if.else148

if.then133:                                       ; preds = %if.end128
  %53 = load i64, ptr @crc, align 8
  %and134 = and i64 %53, 65535
  %and135 = and i64 %and134, 255
  %conv136 = trunc i64 %and135 to i8
  %54 = load i32, ptr @outcnt, align 4
  %inc137 = add i32 %54, 1
  store i32 %inc137, ptr @outcnt, align 4
  %idxprom138 = zext i32 %54 to i64
  %arrayidx139 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom138
  store i8 %conv136, ptr %arrayidx139, align 1
  %55 = load i64, ptr @crc, align 8
  %and140 = and i64 %55, 65535
  %conv141 = trunc i64 %and140 to i16
  %conv142 = zext i16 %conv141 to i32
  %shr143 = ashr i32 %conv142, 8
  %conv144 = trunc i32 %shr143 to i8
  %56 = load i32, ptr @outcnt, align 4
  %inc145 = add i32 %56, 1
  store i32 %inc145, ptr @outcnt, align 4
  %idxprom146 = zext i32 %56 to i64
  %arrayidx147 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom146
  store i8 %conv144, ptr %arrayidx147, align 1
  br label %if.end171

if.else148:                                       ; preds = %if.end128
  %57 = load i64, ptr @crc, align 8
  %and149 = and i64 %57, 65535
  %and150 = and i64 %and149, 255
  %conv151 = trunc i64 %and150 to i8
  %58 = load i32, ptr @outcnt, align 4
  %inc152 = add i32 %58, 1
  store i32 %inc152, ptr @outcnt, align 4
  %idxprom153 = zext i32 %58 to i64
  %arrayidx154 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom153
  store i8 %conv151, ptr %arrayidx154, align 1
  %59 = load i32, ptr @outcnt, align 4
  %cmp155 = icmp eq i32 %59, 16384
  br i1 %cmp155, label %if.then157, label %if.end158

if.then157:                                       ; preds = %if.else148
  call void @flush_outbuf()
  br label %if.end158

if.end158:                                        ; preds = %if.then157, %if.else148
  %60 = load i64, ptr @crc, align 8
  %and159 = and i64 %60, 65535
  %conv160 = trunc i64 %and159 to i16
  %conv161 = zext i16 %conv160 to i32
  %shr162 = ashr i32 %conv161, 8
  %conv163 = trunc i32 %shr162 to i8
  %61 = load i32, ptr @outcnt, align 4
  %inc164 = add i32 %61, 1
  store i32 %inc164, ptr @outcnt, align 4
  %idxprom165 = zext i32 %61 to i64
  %arrayidx166 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom165
  store i8 %conv163, ptr %arrayidx166, align 1
  %62 = load i32, ptr @outcnt, align 4
  %cmp167 = icmp eq i32 %62, 16384
  br i1 %cmp167, label %if.then169, label %if.end170

if.then169:                                       ; preds = %if.end158
  call void @flush_outbuf()
  br label %if.end170

if.end170:                                        ; preds = %if.then169, %if.end158
  br label %if.end171

if.end171:                                        ; preds = %if.end170, %if.then133
  %63 = load i32, ptr @outcnt, align 4
  %cmp172 = icmp ult i32 %63, 16382
  br i1 %cmp172, label %if.then174, label %if.else189

if.then174:                                       ; preds = %if.end171
  %64 = load i64, ptr @crc, align 8
  %shr175 = lshr i64 %64, 16
  %and176 = and i64 %shr175, 255
  %conv177 = trunc i64 %and176 to i8
  %65 = load i32, ptr @outcnt, align 4
  %inc178 = add i32 %65, 1
  store i32 %inc178, ptr @outcnt, align 4
  %idxprom179 = zext i32 %65 to i64
  %arrayidx180 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom179
  store i8 %conv177, ptr %arrayidx180, align 1
  %66 = load i64, ptr @crc, align 8
  %shr181 = lshr i64 %66, 16
  %conv182 = trunc i64 %shr181 to i16
  %conv183 = zext i16 %conv182 to i32
  %shr184 = ashr i32 %conv183, 8
  %conv185 = trunc i32 %shr184 to i8
  %67 = load i32, ptr @outcnt, align 4
  %inc186 = add i32 %67, 1
  store i32 %inc186, ptr @outcnt, align 4
  %idxprom187 = zext i32 %67 to i64
  %arrayidx188 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom187
  store i8 %conv185, ptr %arrayidx188, align 1
  br label %if.end212

if.else189:                                       ; preds = %if.end171
  %68 = load i64, ptr @crc, align 8
  %shr190 = lshr i64 %68, 16
  %and191 = and i64 %shr190, 255
  %conv192 = trunc i64 %and191 to i8
  %69 = load i32, ptr @outcnt, align 4
  %inc193 = add i32 %69, 1
  store i32 %inc193, ptr @outcnt, align 4
  %idxprom194 = zext i32 %69 to i64
  %arrayidx195 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom194
  store i8 %conv192, ptr %arrayidx195, align 1
  %70 = load i32, ptr @outcnt, align 4
  %cmp196 = icmp eq i32 %70, 16384
  br i1 %cmp196, label %if.then198, label %if.end199

if.then198:                                       ; preds = %if.else189
  call void @flush_outbuf()
  br label %if.end199

if.end199:                                        ; preds = %if.then198, %if.else189
  %71 = load i64, ptr @crc, align 8
  %shr200 = lshr i64 %71, 16
  %conv201 = trunc i64 %shr200 to i16
  %conv202 = zext i16 %conv201 to i32
  %shr203 = ashr i32 %conv202, 8
  %conv204 = trunc i32 %shr203 to i8
  %72 = load i32, ptr @outcnt, align 4
  %inc205 = add i32 %72, 1
  store i32 %inc205, ptr @outcnt, align 4
  %idxprom206 = zext i32 %72 to i64
  %arrayidx207 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom206
  store i8 %conv204, ptr %arrayidx207, align 1
  %73 = load i32, ptr @outcnt, align 4
  %cmp208 = icmp eq i32 %73, 16384
  br i1 %cmp208, label %if.then210, label %if.end211

if.then210:                                       ; preds = %if.end199
  call void @flush_outbuf()
  br label %if.end211

if.end211:                                        ; preds = %if.then210, %if.end199
  br label %if.end212

if.end212:                                        ; preds = %if.end211, %if.then174
  %74 = load i32, ptr @outcnt, align 4
  %cmp213 = icmp ult i32 %74, 16382
  br i1 %cmp213, label %if.then215, label %if.else230

if.then215:                                       ; preds = %if.end212
  %75 = load i64, ptr @bytes_in, align 8
  %and216 = and i64 %75, 65535
  %and217 = and i64 %and216, 255
  %conv218 = trunc i64 %and217 to i8
  %76 = load i32, ptr @outcnt, align 4
  %inc219 = add i32 %76, 1
  store i32 %inc219, ptr @outcnt, align 4
  %idxprom220 = zext i32 %76 to i64
  %arrayidx221 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom220
  store i8 %conv218, ptr %arrayidx221, align 1
  %77 = load i64, ptr @bytes_in, align 8
  %and222 = and i64 %77, 65535
  %conv223 = trunc i64 %and222 to i16
  %conv224 = zext i16 %conv223 to i32
  %shr225 = ashr i32 %conv224, 8
  %conv226 = trunc i32 %shr225 to i8
  %78 = load i32, ptr @outcnt, align 4
  %inc227 = add i32 %78, 1
  store i32 %inc227, ptr @outcnt, align 4
  %idxprom228 = zext i32 %78 to i64
  %arrayidx229 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom228
  store i8 %conv226, ptr %arrayidx229, align 1
  br label %if.end253

if.else230:                                       ; preds = %if.end212
  %79 = load i64, ptr @bytes_in, align 8
  %and231 = and i64 %79, 65535
  %and232 = and i64 %and231, 255
  %conv233 = trunc i64 %and232 to i8
  %80 = load i32, ptr @outcnt, align 4
  %inc234 = add i32 %80, 1
  store i32 %inc234, ptr @outcnt, align 4
  %idxprom235 = zext i32 %80 to i64
  %arrayidx236 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom235
  store i8 %conv233, ptr %arrayidx236, align 1
  %81 = load i32, ptr @outcnt, align 4
  %cmp237 = icmp eq i32 %81, 16384
  br i1 %cmp237, label %if.then239, label %if.end240

if.then239:                                       ; preds = %if.else230
  call void @flush_outbuf()
  br label %if.end240

if.end240:                                        ; preds = %if.then239, %if.else230
  %82 = load i64, ptr @bytes_in, align 8
  %and241 = and i64 %82, 65535
  %conv242 = trunc i64 %and241 to i16
  %conv243 = zext i16 %conv242 to i32
  %shr244 = ashr i32 %conv243, 8
  %conv245 = trunc i32 %shr244 to i8
  %83 = load i32, ptr @outcnt, align 4
  %inc246 = add i32 %83, 1
  store i32 %inc246, ptr @outcnt, align 4
  %idxprom247 = zext i32 %83 to i64
  %arrayidx248 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom247
  store i8 %conv245, ptr %arrayidx248, align 1
  %84 = load i32, ptr @outcnt, align 4
  %cmp249 = icmp eq i32 %84, 16384
  br i1 %cmp249, label %if.then251, label %if.end252

if.then251:                                       ; preds = %if.end240
  call void @flush_outbuf()
  br label %if.end252

if.end252:                                        ; preds = %if.then251, %if.end240
  br label %if.end253

if.end253:                                        ; preds = %if.end252, %if.then215
  %85 = load i32, ptr @outcnt, align 4
  %cmp254 = icmp ult i32 %85, 16382
  br i1 %cmp254, label %if.then256, label %if.else271

if.then256:                                       ; preds = %if.end253
  %86 = load i64, ptr @bytes_in, align 8
  %shr257 = lshr i64 %86, 16
  %and258 = and i64 %shr257, 255
  %conv259 = trunc i64 %and258 to i8
  %87 = load i32, ptr @outcnt, align 4
  %inc260 = add i32 %87, 1
  store i32 %inc260, ptr @outcnt, align 4
  %idxprom261 = zext i32 %87 to i64
  %arrayidx262 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom261
  store i8 %conv259, ptr %arrayidx262, align 1
  %88 = load i64, ptr @bytes_in, align 8
  %shr263 = lshr i64 %88, 16
  %conv264 = trunc i64 %shr263 to i16
  %conv265 = zext i16 %conv264 to i32
  %shr266 = ashr i32 %conv265, 8
  %conv267 = trunc i32 %shr266 to i8
  %89 = load i32, ptr @outcnt, align 4
  %inc268 = add i32 %89, 1
  store i32 %inc268, ptr @outcnt, align 4
  %idxprom269 = zext i32 %89 to i64
  %arrayidx270 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom269
  store i8 %conv267, ptr %arrayidx270, align 1
  br label %if.end294

if.else271:                                       ; preds = %if.end253
  %90 = load i64, ptr @bytes_in, align 8
  %shr272 = lshr i64 %90, 16
  %and273 = and i64 %shr272, 255
  %conv274 = trunc i64 %and273 to i8
  %91 = load i32, ptr @outcnt, align 4
  %inc275 = add i32 %91, 1
  store i32 %inc275, ptr @outcnt, align 4
  %idxprom276 = zext i32 %91 to i64
  %arrayidx277 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom276
  store i8 %conv274, ptr %arrayidx277, align 1
  %92 = load i32, ptr @outcnt, align 4
  %cmp278 = icmp eq i32 %92, 16384
  br i1 %cmp278, label %if.then280, label %if.end281

if.then280:                                       ; preds = %if.else271
  call void @flush_outbuf()
  br label %if.end281

if.end281:                                        ; preds = %if.then280, %if.else271
  %93 = load i64, ptr @bytes_in, align 8
  %shr282 = lshr i64 %93, 16
  %conv283 = trunc i64 %shr282 to i16
  %conv284 = zext i16 %conv283 to i32
  %shr285 = ashr i32 %conv284, 8
  %conv286 = trunc i32 %shr285 to i8
  %94 = load i32, ptr @outcnt, align 4
  %inc287 = add i32 %94, 1
  store i32 %inc287, ptr @outcnt, align 4
  %idxprom288 = zext i32 %94 to i64
  %arrayidx289 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom288
  store i8 %conv286, ptr %arrayidx289, align 1
  %95 = load i32, ptr @outcnt, align 4
  %cmp290 = icmp eq i32 %95, 16384
  br i1 %cmp290, label %if.then292, label %if.end293

if.then292:                                       ; preds = %if.end281
  call void @flush_outbuf()
  br label %if.end293

if.end293:                                        ; preds = %if.then292, %if.end281
  br label %if.end294

if.end294:                                        ; preds = %if.end293, %if.then256
  %96 = load i64, ptr @header_bytes, align 8
  %add = add i64 %96, 16
  store i64 %add, ptr @header_bytes, align 8
  call void @flush_outbuf()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @file_read(ptr noundef %buf, i32 noundef %size) #0 {
entry:
  %retval = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %len = alloca i32, align 4
  store ptr %buf, ptr %buf.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  %0 = load i32, ptr @ifd, align 4
  %1 = load ptr, ptr %buf.addr, align 8
  %2 = load i32, ptr %size.addr, align 4
  %conv = zext i32 %2 to i64
  %call = call i64 @read(i32 noundef %0, ptr noundef %1, i64 noundef %conv)
  %conv1 = trunc i64 %call to i32
  store i32 %conv1, ptr %len, align 4
  %3 = load i32, ptr %len, align 4
  %cmp = icmp eq i32 %3, -1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load i32, ptr %len, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %5 = load i32, ptr %len, align 4
  store i32 %5, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %6 = load ptr, ptr %buf.addr, align 8
  %7 = load i32, ptr %len, align 4
  %call5 = call i64 @updcrc(ptr noundef %6, i32 noundef %7)
  store i64 %call5, ptr @crc, align 8
  %8 = load i32, ptr %len, align 4
  %conv6 = zext i32 %8 to i64
  %9 = load i64, ptr @bytes_in, align 8
  %add = add i64 %9, %conv6
  store i64 %add, ptr @bytes_in, align 8
  %10 = load i32, ptr %len, align 4
  store i32 %10, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @lm_init(i32 noundef %pack_level, ptr noundef %flags) #0 {
entry:
  %pack_level.addr = alloca i32, align 4
  %flags.addr = alloca ptr, align 8
  %j = alloca i32, align 4
  store i32 %pack_level, ptr %pack_level.addr, align 4
  store ptr %flags, ptr %flags.addr, align 8
  %0 = load i32, ptr %pack_level.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %pack_level.addr, align 4
  %cmp1 = icmp sgt i32 %1, 9
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @error(ptr noundef @.str.151)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %2 = load i32, ptr %pack_level.addr, align 4
  store i32 %2, ptr @compr_level, align 4
  call void @llvm.memset.p0.i64(ptr align 1 getelementptr inbounds (i16, ptr @prev, i64 32768), i8 0, i64 65536, i1 false)
  %3 = load i32, ptr %pack_level.addr, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [10 x %struct.config], ptr @configuration_table, i64 0, i64 %idxprom
  %max_lazy = getelementptr inbounds %struct.config, ptr %arrayidx, i32 0, i32 1
  %4 = load i16, ptr %max_lazy, align 2
  %conv = zext i16 %4 to i32
  store i32 %conv, ptr @max_lazy_match, align 4
  %5 = load i32, ptr %pack_level.addr, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [10 x %struct.config], ptr @configuration_table, i64 0, i64 %idxprom2
  %good_length = getelementptr inbounds %struct.config, ptr %arrayidx3, i32 0, i32 0
  %6 = load i16, ptr %good_length, align 8
  %conv4 = zext i16 %6 to i32
  store i32 %conv4, ptr @good_match, align 4
  %7 = load i32, ptr %pack_level.addr, align 4
  %idxprom5 = sext i32 %7 to i64
  %arrayidx6 = getelementptr inbounds [10 x %struct.config], ptr @configuration_table, i64 0, i64 %idxprom5
  %nice_length = getelementptr inbounds %struct.config, ptr %arrayidx6, i32 0, i32 2
  %8 = load i16, ptr %nice_length, align 4
  %conv7 = zext i16 %8 to i32
  store i32 %conv7, ptr @nice_match, align 4
  %9 = load i32, ptr %pack_level.addr, align 4
  %idxprom8 = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [10 x %struct.config], ptr @configuration_table, i64 0, i64 %idxprom8
  %max_chain = getelementptr inbounds %struct.config, ptr %arrayidx9, i32 0, i32 3
  %10 = load i16, ptr %max_chain, align 2
  %conv10 = zext i16 %10 to i32
  store i32 %conv10, ptr @max_chain_length, align 4
  %11 = load i32, ptr %pack_level.addr, align 4
  %cmp11 = icmp eq i32 %11, 1
  br i1 %cmp11, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.end
  %12 = load ptr, ptr %flags.addr, align 8
  %13 = load i16, ptr %12, align 2
  %conv14 = zext i16 %13 to i32
  %or = or i32 %conv14, 4
  %conv15 = trunc i32 %or to i16
  store i16 %conv15, ptr %12, align 2
  br label %if.end23

if.else:                                          ; preds = %if.end
  %14 = load i32, ptr %pack_level.addr, align 4
  %cmp16 = icmp eq i32 %14, 9
  br i1 %cmp16, label %if.then18, label %if.end22

if.then18:                                        ; preds = %if.else
  %15 = load ptr, ptr %flags.addr, align 8
  %16 = load i16, ptr %15, align 2
  %conv19 = zext i16 %16 to i32
  %or20 = or i32 %conv19, 2
  %conv21 = trunc i32 %or20 to i16
  store i16 %conv21, ptr %15, align 2
  br label %if.end22

if.end22:                                         ; preds = %if.then18, %if.else
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then13
  store i32 0, ptr @strstart, align 4
  store i64 0, ptr @block_start, align 8
  %17 = load ptr, ptr @read_buf, align 8
  %call = call i32 %17(ptr noundef @window, i32 noundef 65536)
  store i32 %call, ptr @lookahead, align 4
  %18 = load i32, ptr @lookahead, align 4
  %cmp24 = icmp eq i32 %18, 0
  br i1 %cmp24, label %if.then29, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %if.end23
  %19 = load i32, ptr @lookahead, align 4
  %cmp27 = icmp eq i32 %19, -1
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %lor.lhs.false26, %if.end23
  store i32 1, ptr @eofile, align 4
  store i32 0, ptr @lookahead, align 4
  br label %for.end

if.end30:                                         ; preds = %lor.lhs.false26
  store i32 0, ptr @eofile, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end30
  %20 = load i32, ptr @lookahead, align 4
  %cmp31 = icmp ult i32 %20, 262
  br i1 %cmp31, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %21 = load i32, ptr @eofile, align 4
  %tobool = icmp ne i32 %21, 0
  %lnot = xor i1 %tobool, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %22 = phi i1 [ false, %while.cond ], [ %lnot, %land.rhs ]
  br i1 %22, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  call void @fill_window()
  br label %while.cond, !llvm.loop !22

while.end:                                        ; preds = %land.end
  store i32 0, ptr @ins_h, align 4
  store i32 0, ptr %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %23 = load i32, ptr %j, align 4
  %cmp33 = icmp ult i32 %23, 2
  br i1 %cmp33, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %24 = load i32, ptr @ins_h, align 4
  %shl = shl i32 %24, 5
  %25 = load i32, ptr %j, align 4
  %idxprom35 = zext i32 %25 to i64
  %arrayidx36 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom35
  %26 = load i8, ptr %arrayidx36, align 1
  %conv37 = zext i8 %26 to i32
  %xor = xor i32 %shl, %conv37
  %and = and i32 %xor, 32767
  store i32 %and, ptr @ins_h, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %27 = load i32, ptr %j, align 4
  %inc = add i32 %27, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond, !llvm.loop !23

for.end:                                          ; preds = %if.then29, %for.cond
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

; Function Attrs: noinline nounwind optnone uwtable
define internal void @fill_window() #0 {
entry:
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %more = alloca i32, align 4
  %0 = load i64, ptr @window_size, align 8
  %1 = load i32, ptr @lookahead, align 4
  %conv = zext i32 %1 to i64
  %sub = sub i64 %0, %conv
  %2 = load i32, ptr @strstart, align 4
  %conv1 = zext i32 %2 to i64
  %sub2 = sub i64 %sub, %conv1
  %conv3 = trunc i64 %sub2 to i32
  store i32 %conv3, ptr %more, align 4
  %3 = load i32, ptr %more, align 4
  %cmp = icmp eq i32 %3, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, ptr %more, align 4
  %dec = add i32 %4, -1
  store i32 %dec, ptr %more, align 4
  br label %if.end40

if.else:                                          ; preds = %entry
  %5 = load i32, ptr @strstart, align 4
  %cmp5 = icmp uge i32 %5, 65274
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 @window, ptr align 1 getelementptr inbounds (i8, ptr @window, i64 32768), i64 32768, i1 false)
  %6 = load i32, ptr @match_start, align 4
  %sub8 = sub i32 %6, 32768
  store i32 %sub8, ptr @match_start, align 4
  %7 = load i32, ptr @strstart, align 4
  %sub9 = sub i32 %7, 32768
  store i32 %sub9, ptr @strstart, align 4
  %8 = load i64, ptr @block_start, align 8
  %sub10 = sub nsw i64 %8, 32768
  store i64 %sub10, ptr @block_start, align 8
  store i32 0, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then7
  %9 = load i32, ptr %n, align 4
  %cmp11 = icmp ult i32 %9, 32768
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i32, ptr %n, align 4
  %idxprom = zext i32 %10 to i64
  %arrayidx = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom
  %11 = load i16, ptr %arrayidx, align 2
  %conv13 = zext i16 %11 to i32
  store i32 %conv13, ptr %m, align 4
  %12 = load i32, ptr %m, align 4
  %cmp14 = icmp uge i32 %12, 32768
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %13 = load i32, ptr %m, align 4
  %sub16 = sub i32 %13, 32768
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub16, %cond.true ], [ 0, %cond.false ]
  %conv17 = trunc i32 %cond to i16
  %14 = load i32, ptr %n, align 4
  %idxprom18 = zext i32 %14 to i64
  %arrayidx19 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom18
  store i16 %conv17, ptr %arrayidx19, align 2
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %15 = load i32, ptr %n, align 4
  %inc = add i32 %15, 1
  store i32 %inc, ptr %n, align 4
  br label %for.cond, !llvm.loop !24

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %n, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc37, %for.end
  %16 = load i32, ptr %n, align 4
  %cmp21 = icmp ult i32 %16, 32768
  br i1 %cmp21, label %for.body23, label %for.end39

for.body23:                                       ; preds = %for.cond20
  %17 = load i32, ptr %n, align 4
  %idxprom24 = zext i32 %17 to i64
  %arrayidx25 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom24
  %18 = load i16, ptr %arrayidx25, align 2
  %conv26 = zext i16 %18 to i32
  store i32 %conv26, ptr %m, align 4
  %19 = load i32, ptr %m, align 4
  %cmp27 = icmp uge i32 %19, 32768
  br i1 %cmp27, label %cond.true29, label %cond.false31

cond.true29:                                      ; preds = %for.body23
  %20 = load i32, ptr %m, align 4
  %sub30 = sub i32 %20, 32768
  br label %cond.end32

cond.false31:                                     ; preds = %for.body23
  br label %cond.end32

cond.end32:                                       ; preds = %cond.false31, %cond.true29
  %cond33 = phi i32 [ %sub30, %cond.true29 ], [ 0, %cond.false31 ]
  %conv34 = trunc i32 %cond33 to i16
  %21 = load i32, ptr %n, align 4
  %idxprom35 = zext i32 %21 to i64
  %arrayidx36 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom35
  store i16 %conv34, ptr %arrayidx36, align 2
  br label %for.inc37

for.inc37:                                        ; preds = %cond.end32
  %22 = load i32, ptr %n, align 4
  %inc38 = add i32 %22, 1
  store i32 %inc38, ptr %n, align 4
  br label %for.cond20, !llvm.loop !25

for.end39:                                        ; preds = %for.cond20
  %23 = load i32, ptr %more, align 4
  %add = add i32 %23, 32768
  store i32 %add, ptr %more, align 4
  br label %if.end

if.end:                                           ; preds = %for.end39, %if.else
  br label %if.end40

if.end40:                                         ; preds = %if.end, %if.then
  %24 = load i32, ptr @eofile, align 4
  %tobool = icmp ne i32 %24, 0
  br i1 %tobool, label %if.end52, label %if.then41

if.then41:                                        ; preds = %if.end40
  %25 = load ptr, ptr @read_buf, align 8
  %26 = load i32, ptr @strstart, align 4
  %idx.ext = zext i32 %26 to i64
  %add.ptr = getelementptr inbounds i8, ptr @window, i64 %idx.ext
  %27 = load i32, ptr @lookahead, align 4
  %idx.ext42 = zext i32 %27 to i64
  %add.ptr43 = getelementptr inbounds i8, ptr %add.ptr, i64 %idx.ext42
  %28 = load i32, ptr %more, align 4
  %call = call i32 %25(ptr noundef %add.ptr43, i32 noundef %28)
  store i32 %call, ptr %n, align 4
  %29 = load i32, ptr %n, align 4
  %cmp44 = icmp eq i32 %29, 0
  br i1 %cmp44, label %if.then48, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then41
  %30 = load i32, ptr %n, align 4
  %cmp46 = icmp eq i32 %30, -1
  br i1 %cmp46, label %if.then48, label %if.else49

if.then48:                                        ; preds = %lor.lhs.false, %if.then41
  store i32 1, ptr @eofile, align 4
  br label %if.end51

if.else49:                                        ; preds = %lor.lhs.false
  %31 = load i32, ptr %n, align 4
  %32 = load i32, ptr @lookahead, align 4
  %add50 = add i32 %32, %31
  store i32 %add50, ptr @lookahead, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.else49, %if.then48
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.end40
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @longest_match(i32 noundef %cur_match) #0 {
entry:
  %cur_match.addr = alloca i32, align 4
  %chain_length = alloca i32, align 4
  %scan = alloca ptr, align 8
  %match = alloca ptr, align 8
  %len = alloca i32, align 4
  %best_len = alloca i32, align 4
  %limit = alloca i32, align 4
  %strend = alloca ptr, align 8
  %scan_end1 = alloca i8, align 1
  %scan_end = alloca i8, align 1
  store i32 %cur_match, ptr %cur_match.addr, align 4
  %0 = load i32, ptr @max_chain_length, align 4
  store i32 %0, ptr %chain_length, align 4
  %1 = load i32, ptr @strstart, align 4
  %idx.ext = zext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8, ptr @window, i64 %idx.ext
  store ptr %add.ptr, ptr %scan, align 8
  %2 = load i32, ptr @prev_length, align 4
  store i32 %2, ptr %best_len, align 4
  %3 = load i32, ptr @strstart, align 4
  %cmp = icmp ugt i32 %3, 32506
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i32, ptr @strstart, align 4
  %sub = sub i32 %4, 32506
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %limit, align 4
  %5 = load i32, ptr @strstart, align 4
  %idx.ext1 = zext i32 %5 to i64
  %add.ptr2 = getelementptr inbounds i8, ptr @window, i64 %idx.ext1
  %add.ptr3 = getelementptr inbounds i8, ptr %add.ptr2, i64 258
  store ptr %add.ptr3, ptr %strend, align 8
  %6 = load ptr, ptr %scan, align 8
  %7 = load i32, ptr %best_len, align 4
  %sub4 = sub nsw i32 %7, 1
  %idxprom = sext i32 %sub4 to i64
  %arrayidx = getelementptr inbounds i8, ptr %6, i64 %idxprom
  %8 = load i8, ptr %arrayidx, align 1
  store i8 %8, ptr %scan_end1, align 1
  %9 = load ptr, ptr %scan, align 8
  %10 = load i32, ptr %best_len, align 4
  %idxprom5 = sext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %9, i64 %idxprom5
  %11 = load i8, ptr %arrayidx6, align 1
  store i8 %11, ptr %scan_end, align 1
  %12 = load i32, ptr @prev_length, align 4
  %13 = load i32, ptr @good_match, align 4
  %cmp7 = icmp uge i32 %12, %13
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %14 = load i32, ptr %chain_length, align 4
  %shr = lshr i32 %14, 2
  store i32 %shr, ptr %chain_length, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  br label %do.body

do.body:                                          ; preds = %land.end119, %if.end
  %15 = load i32, ptr %cur_match.addr, align 4
  %idx.ext8 = zext i32 %15 to i64
  %add.ptr9 = getelementptr inbounds i8, ptr @window, i64 %idx.ext8
  store ptr %add.ptr9, ptr %match, align 8
  %16 = load ptr, ptr %match, align 8
  %17 = load i32, ptr %best_len, align 4
  %idxprom10 = sext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds i8, ptr %16, i64 %idxprom10
  %18 = load i8, ptr %arrayidx11, align 1
  %conv = zext i8 %18 to i32
  %19 = load i8, ptr %scan_end, align 1
  %conv12 = zext i8 %19 to i32
  %cmp13 = icmp ne i32 %conv, %conv12
  br i1 %cmp13, label %if.then33, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.body
  %20 = load ptr, ptr %match, align 8
  %21 = load i32, ptr %best_len, align 4
  %sub15 = sub nsw i32 %21, 1
  %idxprom16 = sext i32 %sub15 to i64
  %arrayidx17 = getelementptr inbounds i8, ptr %20, i64 %idxprom16
  %22 = load i8, ptr %arrayidx17, align 1
  %conv18 = zext i8 %22 to i32
  %23 = load i8, ptr %scan_end1, align 1
  %conv19 = zext i8 %23 to i32
  %cmp20 = icmp ne i32 %conv18, %conv19
  br i1 %cmp20, label %if.then33, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false
  %24 = load ptr, ptr %match, align 8
  %25 = load i8, ptr %24, align 1
  %conv23 = zext i8 %25 to i32
  %26 = load ptr, ptr %scan, align 8
  %27 = load i8, ptr %26, align 1
  %conv24 = zext i8 %27 to i32
  %cmp25 = icmp ne i32 %conv23, %conv24
  br i1 %cmp25, label %if.then33, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %lor.lhs.false22
  %28 = load ptr, ptr %match, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %28, i32 1
  store ptr %incdec.ptr, ptr %match, align 8
  %29 = load i8, ptr %incdec.ptr, align 1
  %conv28 = zext i8 %29 to i32
  %30 = load ptr, ptr %scan, align 8
  %arrayidx29 = getelementptr inbounds i8, ptr %30, i64 1
  %31 = load i8, ptr %arrayidx29, align 1
  %conv30 = zext i8 %31 to i32
  %cmp31 = icmp ne i32 %conv28, %conv30
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %lor.lhs.false27, %lor.lhs.false22, %lor.lhs.false, %do.body
  br label %do.cond110

if.end34:                                         ; preds = %lor.lhs.false27
  %32 = load ptr, ptr %scan, align 8
  %add.ptr35 = getelementptr inbounds i8, ptr %32, i64 2
  store ptr %add.ptr35, ptr %scan, align 8
  %33 = load ptr, ptr %match, align 8
  %incdec.ptr36 = getelementptr inbounds i8, ptr %33, i32 1
  store ptr %incdec.ptr36, ptr %match, align 8
  br label %do.body37

do.body37:                                        ; preds = %land.end, %if.end34
  br label %do.cond

do.cond:                                          ; preds = %do.body37
  %34 = load ptr, ptr %scan, align 8
  %incdec.ptr38 = getelementptr inbounds i8, ptr %34, i32 1
  store ptr %incdec.ptr38, ptr %scan, align 8
  %35 = load i8, ptr %incdec.ptr38, align 1
  %conv39 = zext i8 %35 to i32
  %36 = load ptr, ptr %match, align 8
  %incdec.ptr40 = getelementptr inbounds i8, ptr %36, i32 1
  store ptr %incdec.ptr40, ptr %match, align 8
  %37 = load i8, ptr %incdec.ptr40, align 1
  %conv41 = zext i8 %37 to i32
  %cmp42 = icmp eq i32 %conv39, %conv41
  br i1 %cmp42, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %do.cond
  %38 = load ptr, ptr %scan, align 8
  %incdec.ptr44 = getelementptr inbounds i8, ptr %38, i32 1
  store ptr %incdec.ptr44, ptr %scan, align 8
  %39 = load i8, ptr %incdec.ptr44, align 1
  %conv45 = zext i8 %39 to i32
  %40 = load ptr, ptr %match, align 8
  %incdec.ptr46 = getelementptr inbounds i8, ptr %40, i32 1
  store ptr %incdec.ptr46, ptr %match, align 8
  %41 = load i8, ptr %incdec.ptr46, align 1
  %conv47 = zext i8 %41 to i32
  %cmp48 = icmp eq i32 %conv45, %conv47
  br i1 %cmp48, label %land.lhs.true50, label %land.end

land.lhs.true50:                                  ; preds = %land.lhs.true
  %42 = load ptr, ptr %scan, align 8
  %incdec.ptr51 = getelementptr inbounds i8, ptr %42, i32 1
  store ptr %incdec.ptr51, ptr %scan, align 8
  %43 = load i8, ptr %incdec.ptr51, align 1
  %conv52 = zext i8 %43 to i32
  %44 = load ptr, ptr %match, align 8
  %incdec.ptr53 = getelementptr inbounds i8, ptr %44, i32 1
  store ptr %incdec.ptr53, ptr %match, align 8
  %45 = load i8, ptr %incdec.ptr53, align 1
  %conv54 = zext i8 %45 to i32
  %cmp55 = icmp eq i32 %conv52, %conv54
  br i1 %cmp55, label %land.lhs.true57, label %land.end

land.lhs.true57:                                  ; preds = %land.lhs.true50
  %46 = load ptr, ptr %scan, align 8
  %incdec.ptr58 = getelementptr inbounds i8, ptr %46, i32 1
  store ptr %incdec.ptr58, ptr %scan, align 8
  %47 = load i8, ptr %incdec.ptr58, align 1
  %conv59 = zext i8 %47 to i32
  %48 = load ptr, ptr %match, align 8
  %incdec.ptr60 = getelementptr inbounds i8, ptr %48, i32 1
  store ptr %incdec.ptr60, ptr %match, align 8
  %49 = load i8, ptr %incdec.ptr60, align 1
  %conv61 = zext i8 %49 to i32
  %cmp62 = icmp eq i32 %conv59, %conv61
  br i1 %cmp62, label %land.lhs.true64, label %land.end

land.lhs.true64:                                  ; preds = %land.lhs.true57
  %50 = load ptr, ptr %scan, align 8
  %incdec.ptr65 = getelementptr inbounds i8, ptr %50, i32 1
  store ptr %incdec.ptr65, ptr %scan, align 8
  %51 = load i8, ptr %incdec.ptr65, align 1
  %conv66 = zext i8 %51 to i32
  %52 = load ptr, ptr %match, align 8
  %incdec.ptr67 = getelementptr inbounds i8, ptr %52, i32 1
  store ptr %incdec.ptr67, ptr %match, align 8
  %53 = load i8, ptr %incdec.ptr67, align 1
  %conv68 = zext i8 %53 to i32
  %cmp69 = icmp eq i32 %conv66, %conv68
  br i1 %cmp69, label %land.lhs.true71, label %land.end

land.lhs.true71:                                  ; preds = %land.lhs.true64
  %54 = load ptr, ptr %scan, align 8
  %incdec.ptr72 = getelementptr inbounds i8, ptr %54, i32 1
  store ptr %incdec.ptr72, ptr %scan, align 8
  %55 = load i8, ptr %incdec.ptr72, align 1
  %conv73 = zext i8 %55 to i32
  %56 = load ptr, ptr %match, align 8
  %incdec.ptr74 = getelementptr inbounds i8, ptr %56, i32 1
  store ptr %incdec.ptr74, ptr %match, align 8
  %57 = load i8, ptr %incdec.ptr74, align 1
  %conv75 = zext i8 %57 to i32
  %cmp76 = icmp eq i32 %conv73, %conv75
  br i1 %cmp76, label %land.lhs.true78, label %land.end

land.lhs.true78:                                  ; preds = %land.lhs.true71
  %58 = load ptr, ptr %scan, align 8
  %incdec.ptr79 = getelementptr inbounds i8, ptr %58, i32 1
  store ptr %incdec.ptr79, ptr %scan, align 8
  %59 = load i8, ptr %incdec.ptr79, align 1
  %conv80 = zext i8 %59 to i32
  %60 = load ptr, ptr %match, align 8
  %incdec.ptr81 = getelementptr inbounds i8, ptr %60, i32 1
  store ptr %incdec.ptr81, ptr %match, align 8
  %61 = load i8, ptr %incdec.ptr81, align 1
  %conv82 = zext i8 %61 to i32
  %cmp83 = icmp eq i32 %conv80, %conv82
  br i1 %cmp83, label %land.lhs.true85, label %land.end

land.lhs.true85:                                  ; preds = %land.lhs.true78
  %62 = load ptr, ptr %scan, align 8
  %incdec.ptr86 = getelementptr inbounds i8, ptr %62, i32 1
  store ptr %incdec.ptr86, ptr %scan, align 8
  %63 = load i8, ptr %incdec.ptr86, align 1
  %conv87 = zext i8 %63 to i32
  %64 = load ptr, ptr %match, align 8
  %incdec.ptr88 = getelementptr inbounds i8, ptr %64, i32 1
  store ptr %incdec.ptr88, ptr %match, align 8
  %65 = load i8, ptr %incdec.ptr88, align 1
  %conv89 = zext i8 %65 to i32
  %cmp90 = icmp eq i32 %conv87, %conv89
  br i1 %cmp90, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true85
  %66 = load ptr, ptr %scan, align 8
  %67 = load ptr, ptr %strend, align 8
  %cmp92 = icmp ult ptr %66, %67
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true85, %land.lhs.true78, %land.lhs.true71, %land.lhs.true64, %land.lhs.true57, %land.lhs.true50, %land.lhs.true, %do.cond
  %68 = phi i1 [ false, %land.lhs.true85 ], [ false, %land.lhs.true78 ], [ false, %land.lhs.true71 ], [ false, %land.lhs.true64 ], [ false, %land.lhs.true57 ], [ false, %land.lhs.true50 ], [ false, %land.lhs.true ], [ false, %do.cond ], [ %cmp92, %land.rhs ]
  br i1 %68, label %do.body37, label %do.end, !llvm.loop !26

do.end:                                           ; preds = %land.end
  %69 = load ptr, ptr %strend, align 8
  %70 = load ptr, ptr %scan, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %69 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %70 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv94 = trunc i64 %sub.ptr.sub to i32
  %sub95 = sub nsw i32 258, %conv94
  store i32 %sub95, ptr %len, align 4
  %71 = load ptr, ptr %strend, align 8
  %add.ptr96 = getelementptr inbounds i8, ptr %71, i64 -258
  store ptr %add.ptr96, ptr %scan, align 8
  %72 = load i32, ptr %len, align 4
  %73 = load i32, ptr %best_len, align 4
  %cmp97 = icmp sgt i32 %72, %73
  br i1 %cmp97, label %if.then99, label %if.end109

if.then99:                                        ; preds = %do.end
  %74 = load i32, ptr %cur_match.addr, align 4
  store i32 %74, ptr @match_start, align 4
  %75 = load i32, ptr %len, align 4
  store i32 %75, ptr %best_len, align 4
  %76 = load i32, ptr %len, align 4
  %77 = load i32, ptr @nice_match, align 4
  %cmp100 = icmp sge i32 %76, %77
  br i1 %cmp100, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.then99
  br label %do.end120

if.end103:                                        ; preds = %if.then99
  %78 = load ptr, ptr %scan, align 8
  %79 = load i32, ptr %best_len, align 4
  %sub104 = sub nsw i32 %79, 1
  %idxprom105 = sext i32 %sub104 to i64
  %arrayidx106 = getelementptr inbounds i8, ptr %78, i64 %idxprom105
  %80 = load i8, ptr %arrayidx106, align 1
  store i8 %80, ptr %scan_end1, align 1
  %81 = load ptr, ptr %scan, align 8
  %82 = load i32, ptr %best_len, align 4
  %idxprom107 = sext i32 %82 to i64
  %arrayidx108 = getelementptr inbounds i8, ptr %81, i64 %idxprom107
  %83 = load i8, ptr %arrayidx108, align 1
  store i8 %83, ptr %scan_end, align 1
  br label %if.end109

if.end109:                                        ; preds = %if.end103, %do.end
  br label %do.cond110

do.cond110:                                       ; preds = %if.end109, %if.then33
  %84 = load i32, ptr %cur_match.addr, align 4
  %and = and i32 %84, 32767
  %idxprom111 = zext i32 %and to i64
  %arrayidx112 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom111
  %85 = load i16, ptr %arrayidx112, align 2
  %conv113 = zext i16 %85 to i32
  store i32 %conv113, ptr %cur_match.addr, align 4
  %86 = load i32, ptr %limit, align 4
  %cmp114 = icmp ugt i32 %conv113, %86
  br i1 %cmp114, label %land.rhs116, label %land.end119

land.rhs116:                                      ; preds = %do.cond110
  %87 = load i32, ptr %chain_length, align 4
  %dec = add i32 %87, -1
  store i32 %dec, ptr %chain_length, align 4
  %cmp117 = icmp ne i32 %dec, 0
  br label %land.end119

land.end119:                                      ; preds = %land.rhs116, %do.cond110
  %88 = phi i1 [ false, %do.cond110 ], [ %cmp117, %land.rhs116 ]
  br i1 %88, label %do.body, label %do.end120, !llvm.loop !27

do.end120:                                        ; preds = %land.end119, %if.then102
  %89 = load i32, ptr %best_len, align 4
  ret i32 %89
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @deflate() #0 {
entry:
  %retval = alloca i64, align 8
  %hash_head = alloca i32, align 4
  %prev_match = alloca i32, align 4
  %flush = alloca i32, align 4
  %match_available = alloca i32, align 4
  %match_length = alloca i32, align 4
  store i32 0, ptr %match_available, align 4
  store i32 2, ptr %match_length, align 4
  %0 = load i32, ptr @compr_level, align 4
  %cmp = icmp sle i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i64 @deflate_fast()
  store i64 %call, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.end, %if.end
  %1 = load i32, ptr @lookahead, align 4
  %cmp1 = icmp ne i32 %1, 0
  br i1 %cmp1, label %while.body, label %while.end116

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr @ins_h, align 4
  %shl = shl i32 %2, 5
  %3 = load i32, ptr @strstart, align 4
  %add = add i32 %3, 3
  %sub = sub i32 %add, 1
  %idxprom = zext i32 %sub to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %xor = xor i32 %shl, %conv
  %and = and i32 %xor, 32767
  store i32 %and, ptr @ins_h, align 4
  %5 = load i32, ptr @ins_h, align 4
  %idxprom2 = zext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom2
  %6 = load i16, ptr %arrayidx3, align 2
  %conv4 = zext i16 %6 to i32
  store i32 %conv4, ptr %hash_head, align 4
  %conv5 = trunc i32 %conv4 to i16
  %7 = load i32, ptr @strstart, align 4
  %and6 = and i32 %7, 32767
  %idxprom7 = zext i32 %and6 to i64
  %arrayidx8 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom7
  store i16 %conv5, ptr %arrayidx8, align 2
  %8 = load i32, ptr @strstart, align 4
  %conv9 = trunc i32 %8 to i16
  %9 = load i32, ptr @ins_h, align 4
  %idxprom10 = zext i32 %9 to i64
  %arrayidx11 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom10
  store i16 %conv9, ptr %arrayidx11, align 2
  %10 = load i32, ptr %match_length, align 4
  store i32 %10, ptr @prev_length, align 4
  %11 = load i32, ptr @match_start, align 4
  store i32 %11, ptr %prev_match, align 4
  store i32 2, ptr %match_length, align 4
  %12 = load i32, ptr %hash_head, align 4
  %cmp12 = icmp ne i32 %12, 0
  br i1 %cmp12, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %while.body
  %13 = load i32, ptr @prev_length, align 4
  %14 = load i32, ptr @max_lazy_match, align 4
  %cmp14 = icmp ult i32 %13, %14
  br i1 %cmp14, label %land.lhs.true16, label %if.end34

land.lhs.true16:                                  ; preds = %land.lhs.true
  %15 = load i32, ptr @strstart, align 4
  %16 = load i32, ptr %hash_head, align 4
  %sub17 = sub i32 %15, %16
  %cmp18 = icmp ule i32 %sub17, 32506
  br i1 %cmp18, label %if.then20, label %if.end34

if.then20:                                        ; preds = %land.lhs.true16
  %17 = load i32, ptr %hash_head, align 4
  %call21 = call i32 @longest_match(i32 noundef %17)
  store i32 %call21, ptr %match_length, align 4
  %18 = load i32, ptr %match_length, align 4
  %19 = load i32, ptr @lookahead, align 4
  %cmp22 = icmp ugt i32 %18, %19
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.then20
  %20 = load i32, ptr @lookahead, align 4
  store i32 %20, ptr %match_length, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.then20
  %21 = load i32, ptr %match_length, align 4
  %cmp26 = icmp eq i32 %21, 3
  br i1 %cmp26, label %land.lhs.true28, label %if.end33

land.lhs.true28:                                  ; preds = %if.end25
  %22 = load i32, ptr @strstart, align 4
  %23 = load i32, ptr @match_start, align 4
  %sub29 = sub i32 %22, %23
  %cmp30 = icmp ugt i32 %sub29, 4096
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %land.lhs.true28
  %24 = load i32, ptr %match_length, align 4
  %dec = add i32 %24, -1
  store i32 %dec, ptr %match_length, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %land.lhs.true28, %if.end25
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %land.lhs.true16, %land.lhs.true, %while.body
  %25 = load i32, ptr @prev_length, align 4
  %cmp35 = icmp uge i32 %25, 3
  br i1 %cmp35, label %land.lhs.true37, label %if.else

land.lhs.true37:                                  ; preds = %if.end34
  %26 = load i32, ptr %match_length, align 4
  %27 = load i32, ptr @prev_length, align 4
  %cmp38 = icmp ule i32 %26, %27
  br i1 %cmp38, label %if.then40, label %if.else

if.then40:                                        ; preds = %land.lhs.true37
  %28 = load i32, ptr @strstart, align 4
  %sub41 = sub i32 %28, 1
  %29 = load i32, ptr %prev_match, align 4
  %sub42 = sub i32 %sub41, %29
  %30 = load i32, ptr @prev_length, align 4
  %sub43 = sub i32 %30, 3
  %call44 = call i32 @ct_tally(i32 noundef %sub42, i32 noundef %sub43)
  store i32 %call44, ptr %flush, align 4
  %31 = load i32, ptr @prev_length, align 4
  %sub45 = sub i32 %31, 1
  %32 = load i32, ptr @lookahead, align 4
  %sub46 = sub i32 %32, %sub45
  store i32 %sub46, ptr @lookahead, align 4
  %33 = load i32, ptr @prev_length, align 4
  %sub47 = sub i32 %33, 2
  store i32 %sub47, ptr @prev_length, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then40
  %34 = load i32, ptr @strstart, align 4
  %inc = add i32 %34, 1
  store i32 %inc, ptr @strstart, align 4
  %35 = load i32, ptr @ins_h, align 4
  %shl48 = shl i32 %35, 5
  %36 = load i32, ptr @strstart, align 4
  %add49 = add i32 %36, 3
  %sub50 = sub i32 %add49, 1
  %idxprom51 = zext i32 %sub50 to i64
  %arrayidx52 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom51
  %37 = load i8, ptr %arrayidx52, align 1
  %conv53 = zext i8 %37 to i32
  %xor54 = xor i32 %shl48, %conv53
  %and55 = and i32 %xor54, 32767
  store i32 %and55, ptr @ins_h, align 4
  %38 = load i32, ptr @ins_h, align 4
  %idxprom56 = zext i32 %38 to i64
  %arrayidx57 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom56
  %39 = load i16, ptr %arrayidx57, align 2
  %conv58 = zext i16 %39 to i32
  store i32 %conv58, ptr %hash_head, align 4
  %conv59 = trunc i32 %conv58 to i16
  %40 = load i32, ptr @strstart, align 4
  %and60 = and i32 %40, 32767
  %idxprom61 = zext i32 %and60 to i64
  %arrayidx62 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom61
  store i16 %conv59, ptr %arrayidx62, align 2
  %41 = load i32, ptr @strstart, align 4
  %conv63 = trunc i32 %41 to i16
  %42 = load i32, ptr @ins_h, align 4
  %idxprom64 = zext i32 %42 to i64
  %arrayidx65 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom64
  store i16 %conv63, ptr %arrayidx65, align 2
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %43 = load i32, ptr @prev_length, align 4
  %dec66 = add i32 %43, -1
  store i32 %dec66, ptr @prev_length, align 4
  %cmp67 = icmp ne i32 %dec66, 0
  br i1 %cmp67, label %do.body, label %do.end, !llvm.loop !28

do.end:                                           ; preds = %do.cond
  store i32 0, ptr %match_available, align 4
  store i32 2, ptr %match_length, align 4
  %44 = load i32, ptr @strstart, align 4
  %inc69 = add i32 %44, 1
  store i32 %inc69, ptr @strstart, align 4
  %45 = load i32, ptr %flush, align 4
  %tobool = icmp ne i32 %45, 0
  br i1 %tobool, label %if.then70, label %if.end80

if.then70:                                        ; preds = %do.end
  %46 = load i64, ptr @block_start, align 8
  %cmp71 = icmp sge i64 %46, 0
  br i1 %cmp71, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then70
  %47 = load i64, ptr @block_start, align 8
  %conv73 = trunc i64 %47 to i32
  %idxprom74 = zext i32 %conv73 to i64
  %arrayidx75 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom74
  br label %cond.end

cond.false:                                       ; preds = %if.then70
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %arrayidx75, %cond.true ], [ null, %cond.false ]
  %48 = load i32, ptr @strstart, align 4
  %conv76 = zext i32 %48 to i64
  %49 = load i64, ptr @block_start, align 8
  %sub77 = sub nsw i64 %conv76, %49
  %call78 = call i64 @flush_block(ptr noundef %cond, i64 noundef %sub77, i32 noundef 0)
  %50 = load i32, ptr @strstart, align 4
  %conv79 = zext i32 %50 to i64
  store i64 %conv79, ptr @block_start, align 8
  br label %if.end80

if.end80:                                         ; preds = %cond.end, %do.end
  br label %if.end110

if.else:                                          ; preds = %land.lhs.true37, %if.end34
  %51 = load i32, ptr %match_available, align 4
  %tobool81 = icmp ne i32 %51, 0
  br i1 %tobool81, label %if.then82, label %if.else106

if.then82:                                        ; preds = %if.else
  %52 = load i32, ptr @strstart, align 4
  %sub83 = sub i32 %52, 1
  %idxprom84 = zext i32 %sub83 to i64
  %arrayidx85 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom84
  %53 = load i8, ptr %arrayidx85, align 1
  %conv86 = zext i8 %53 to i32
  %call87 = call i32 @ct_tally(i32 noundef 0, i32 noundef %conv86)
  %tobool88 = icmp ne i32 %call87, 0
  br i1 %tobool88, label %if.then89, label %if.end103

if.then89:                                        ; preds = %if.then82
  %54 = load i64, ptr @block_start, align 8
  %cmp90 = icmp sge i64 %54, 0
  br i1 %cmp90, label %cond.true92, label %cond.false96

cond.true92:                                      ; preds = %if.then89
  %55 = load i64, ptr @block_start, align 8
  %conv93 = trunc i64 %55 to i32
  %idxprom94 = zext i32 %conv93 to i64
  %arrayidx95 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom94
  br label %cond.end97

cond.false96:                                     ; preds = %if.then89
  br label %cond.end97

cond.end97:                                       ; preds = %cond.false96, %cond.true92
  %cond98 = phi ptr [ %arrayidx95, %cond.true92 ], [ null, %cond.false96 ]
  %56 = load i32, ptr @strstart, align 4
  %conv99 = zext i32 %56 to i64
  %57 = load i64, ptr @block_start, align 8
  %sub100 = sub nsw i64 %conv99, %57
  %call101 = call i64 @flush_block(ptr noundef %cond98, i64 noundef %sub100, i32 noundef 0)
  %58 = load i32, ptr @strstart, align 4
  %conv102 = zext i32 %58 to i64
  store i64 %conv102, ptr @block_start, align 8
  br label %if.end103

if.end103:                                        ; preds = %cond.end97, %if.then82
  %59 = load i32, ptr @strstart, align 4
  %inc104 = add i32 %59, 1
  store i32 %inc104, ptr @strstart, align 4
  %60 = load i32, ptr @lookahead, align 4
  %dec105 = add i32 %60, -1
  store i32 %dec105, ptr @lookahead, align 4
  br label %if.end109

if.else106:                                       ; preds = %if.else
  store i32 1, ptr %match_available, align 4
  %61 = load i32, ptr @strstart, align 4
  %inc107 = add i32 %61, 1
  store i32 %inc107, ptr @strstart, align 4
  %62 = load i32, ptr @lookahead, align 4
  %dec108 = add i32 %62, -1
  store i32 %dec108, ptr @lookahead, align 4
  br label %if.end109

if.end109:                                        ; preds = %if.else106, %if.end103
  br label %if.end110

if.end110:                                        ; preds = %if.end109, %if.end80
  br label %while.cond111

while.cond111:                                    ; preds = %while.body115, %if.end110
  %63 = load i32, ptr @lookahead, align 4
  %cmp112 = icmp ult i32 %63, 262
  br i1 %cmp112, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond111
  %64 = load i32, ptr @eofile, align 4
  %tobool114 = icmp ne i32 %64, 0
  %lnot = xor i1 %tobool114, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond111
  %65 = phi i1 [ false, %while.cond111 ], [ %lnot, %land.rhs ]
  br i1 %65, label %while.body115, label %while.end

while.body115:                                    ; preds = %land.end
  call void @fill_window()
  br label %while.cond111, !llvm.loop !29

while.end:                                        ; preds = %land.end
  br label %while.cond, !llvm.loop !30

while.end116:                                     ; preds = %while.cond
  %66 = load i32, ptr %match_available, align 4
  %tobool117 = icmp ne i32 %66, 0
  br i1 %tobool117, label %if.then118, label %if.end124

if.then118:                                       ; preds = %while.end116
  %67 = load i32, ptr @strstart, align 4
  %sub119 = sub i32 %67, 1
  %idxprom120 = zext i32 %sub119 to i64
  %arrayidx121 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom120
  %68 = load i8, ptr %arrayidx121, align 1
  %conv122 = zext i8 %68 to i32
  %call123 = call i32 @ct_tally(i32 noundef 0, i32 noundef %conv122)
  br label %if.end124

if.end124:                                        ; preds = %if.then118, %while.end116
  %69 = load i64, ptr @block_start, align 8
  %cmp125 = icmp sge i64 %69, 0
  br i1 %cmp125, label %cond.true127, label %cond.false131

cond.true127:                                     ; preds = %if.end124
  %70 = load i64, ptr @block_start, align 8
  %conv128 = trunc i64 %70 to i32
  %idxprom129 = zext i32 %conv128 to i64
  %arrayidx130 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom129
  br label %cond.end132

cond.false131:                                    ; preds = %if.end124
  br label %cond.end132

cond.end132:                                      ; preds = %cond.false131, %cond.true127
  %cond133 = phi ptr [ %arrayidx130, %cond.true127 ], [ null, %cond.false131 ]
  %71 = load i32, ptr @strstart, align 4
  %conv134 = zext i32 %71 to i64
  %72 = load i64, ptr @block_start, align 8
  %sub135 = sub nsw i64 %conv134, %72
  %call136 = call i64 @flush_block(ptr noundef %cond133, i64 noundef %sub135, i32 noundef 1)
  store i64 %call136, ptr %retval, align 8
  br label %return

return:                                           ; preds = %cond.end132, %if.then
  %73 = load i64, ptr %retval, align 8
  ret i64 %73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @deflate_fast() #0 {
entry:
  %hash_head = alloca i32, align 4
  %flush = alloca i32, align 4
  %match_length = alloca i32, align 4
  store i32 0, ptr %match_length, align 4
  store i32 2, ptr @prev_length, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %0 = load i32, ptr @lookahead, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end88

while.body:                                       ; preds = %while.cond
  %1 = load i32, ptr @ins_h, align 4
  %shl = shl i32 %1, 5
  %2 = load i32, ptr @strstart, align 4
  %add = add i32 %2, 3
  %sub = sub i32 %add, 1
  %idxprom = zext i32 %sub to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %3 to i32
  %xor = xor i32 %shl, %conv
  %and = and i32 %xor, 32767
  store i32 %and, ptr @ins_h, align 4
  %4 = load i32, ptr @ins_h, align 4
  %idxprom1 = zext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom1
  %5 = load i16, ptr %arrayidx2, align 2
  %conv3 = zext i16 %5 to i32
  store i32 %conv3, ptr %hash_head, align 4
  %conv4 = trunc i32 %conv3 to i16
  %6 = load i32, ptr @strstart, align 4
  %and5 = and i32 %6, 32767
  %idxprom6 = zext i32 %and5 to i64
  %arrayidx7 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom6
  store i16 %conv4, ptr %arrayidx7, align 2
  %7 = load i32, ptr @strstart, align 4
  %conv8 = trunc i32 %7 to i16
  %8 = load i32, ptr @ins_h, align 4
  %idxprom9 = zext i32 %8 to i64
  %arrayidx10 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom9
  store i16 %conv8, ptr %arrayidx10, align 2
  %9 = load i32, ptr %hash_head, align 4
  %cmp11 = icmp ne i32 %9, 0
  br i1 %cmp11, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %while.body
  %10 = load i32, ptr @strstart, align 4
  %11 = load i32, ptr %hash_head, align 4
  %sub13 = sub i32 %10, %11
  %cmp14 = icmp ule i32 %sub13, 32506
  br i1 %cmp14, label %if.then, label %if.end19

if.then:                                          ; preds = %land.lhs.true
  %12 = load i32, ptr %hash_head, align 4
  %call = call i32 @longest_match(i32 noundef %12)
  store i32 %call, ptr %match_length, align 4
  %13 = load i32, ptr %match_length, align 4
  %14 = load i32, ptr @lookahead, align 4
  %cmp16 = icmp ugt i32 %13, %14
  br i1 %cmp16, label %if.then18, label %if.end

if.then18:                                        ; preds = %if.then
  %15 = load i32, ptr @lookahead, align 4
  store i32 %15, ptr %match_length, align 4
  br label %if.end

if.end:                                           ; preds = %if.then18, %if.then
  br label %if.end19

if.end19:                                         ; preds = %if.end, %land.lhs.true, %while.body
  %16 = load i32, ptr %match_length, align 4
  %cmp20 = icmp uge i32 %16, 3
  br i1 %cmp20, label %if.then22, label %if.else64

if.then22:                                        ; preds = %if.end19
  %17 = load i32, ptr @strstart, align 4
  %18 = load i32, ptr @match_start, align 4
  %sub23 = sub i32 %17, %18
  %19 = load i32, ptr %match_length, align 4
  %sub24 = sub i32 %19, 3
  %call25 = call i32 @ct_tally(i32 noundef %sub23, i32 noundef %sub24)
  store i32 %call25, ptr %flush, align 4
  %20 = load i32, ptr %match_length, align 4
  %21 = load i32, ptr @lookahead, align 4
  %sub26 = sub i32 %21, %20
  store i32 %sub26, ptr @lookahead, align 4
  %22 = load i32, ptr %match_length, align 4
  %23 = load i32, ptr @max_lazy_match, align 4
  %cmp27 = icmp ule i32 %22, %23
  br i1 %cmp27, label %if.then29, label %if.else

if.then29:                                        ; preds = %if.then22
  %24 = load i32, ptr %match_length, align 4
  %dec = add i32 %24, -1
  store i32 %dec, ptr %match_length, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then29
  %25 = load i32, ptr @strstart, align 4
  %inc = add i32 %25, 1
  store i32 %inc, ptr @strstart, align 4
  %26 = load i32, ptr @ins_h, align 4
  %shl30 = shl i32 %26, 5
  %27 = load i32, ptr @strstart, align 4
  %add31 = add i32 %27, 3
  %sub32 = sub i32 %add31, 1
  %idxprom33 = zext i32 %sub32 to i64
  %arrayidx34 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom33
  %28 = load i8, ptr %arrayidx34, align 1
  %conv35 = zext i8 %28 to i32
  %xor36 = xor i32 %shl30, %conv35
  %and37 = and i32 %xor36, 32767
  store i32 %and37, ptr @ins_h, align 4
  %29 = load i32, ptr @ins_h, align 4
  %idxprom38 = zext i32 %29 to i64
  %arrayidx39 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom38
  %30 = load i16, ptr %arrayidx39, align 2
  %conv40 = zext i16 %30 to i32
  store i32 %conv40, ptr %hash_head, align 4
  %conv41 = trunc i32 %conv40 to i16
  %31 = load i32, ptr @strstart, align 4
  %and42 = and i32 %31, 32767
  %idxprom43 = zext i32 %and42 to i64
  %arrayidx44 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom43
  store i16 %conv41, ptr %arrayidx44, align 2
  %32 = load i32, ptr @strstart, align 4
  %conv45 = trunc i32 %32 to i16
  %33 = load i32, ptr @ins_h, align 4
  %idxprom46 = zext i32 %33 to i64
  %arrayidx47 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom46
  store i16 %conv45, ptr %arrayidx47, align 2
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %34 = load i32, ptr %match_length, align 4
  %dec48 = add i32 %34, -1
  store i32 %dec48, ptr %match_length, align 4
  %cmp49 = icmp ne i32 %dec48, 0
  br i1 %cmp49, label %do.body, label %do.end, !llvm.loop !31

do.end:                                           ; preds = %do.cond
  %35 = load i32, ptr @strstart, align 4
  %inc51 = add i32 %35, 1
  store i32 %inc51, ptr @strstart, align 4
  br label %if.end63

if.else:                                          ; preds = %if.then22
  %36 = load i32, ptr %match_length, align 4
  %37 = load i32, ptr @strstart, align 4
  %add52 = add i32 %37, %36
  store i32 %add52, ptr @strstart, align 4
  store i32 0, ptr %match_length, align 4
  %38 = load i32, ptr @strstart, align 4
  %idxprom53 = zext i32 %38 to i64
  %arrayidx54 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom53
  %39 = load i8, ptr %arrayidx54, align 1
  %conv55 = zext i8 %39 to i32
  store i32 %conv55, ptr @ins_h, align 4
  %40 = load i32, ptr @ins_h, align 4
  %shl56 = shl i32 %40, 5
  %41 = load i32, ptr @strstart, align 4
  %add57 = add i32 %41, 1
  %idxprom58 = zext i32 %add57 to i64
  %arrayidx59 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom58
  %42 = load i8, ptr %arrayidx59, align 1
  %conv60 = zext i8 %42 to i32
  %xor61 = xor i32 %shl56, %conv60
  %and62 = and i32 %xor61, 32767
  store i32 %and62, ptr @ins_h, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.else, %do.end
  br label %if.end71

if.else64:                                        ; preds = %if.end19
  %43 = load i32, ptr @strstart, align 4
  %idxprom65 = zext i32 %43 to i64
  %arrayidx66 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom65
  %44 = load i8, ptr %arrayidx66, align 1
  %conv67 = zext i8 %44 to i32
  %call68 = call i32 @ct_tally(i32 noundef 0, i32 noundef %conv67)
  store i32 %call68, ptr %flush, align 4
  %45 = load i32, ptr @lookahead, align 4
  %dec69 = add i32 %45, -1
  store i32 %dec69, ptr @lookahead, align 4
  %46 = load i32, ptr @strstart, align 4
  %inc70 = add i32 %46, 1
  store i32 %inc70, ptr @strstart, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.else64, %if.end63
  %47 = load i32, ptr %flush, align 4
  %tobool = icmp ne i32 %47, 0
  br i1 %tobool, label %if.then72, label %if.end82

if.then72:                                        ; preds = %if.end71
  %48 = load i64, ptr @block_start, align 8
  %cmp73 = icmp sge i64 %48, 0
  br i1 %cmp73, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then72
  %49 = load i64, ptr @block_start, align 8
  %conv75 = trunc i64 %49 to i32
  %idxprom76 = zext i32 %conv75 to i64
  %arrayidx77 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom76
  br label %cond.end

cond.false:                                       ; preds = %if.then72
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %arrayidx77, %cond.true ], [ null, %cond.false ]
  %50 = load i32, ptr @strstart, align 4
  %conv78 = zext i32 %50 to i64
  %51 = load i64, ptr @block_start, align 8
  %sub79 = sub nsw i64 %conv78, %51
  %call80 = call i64 @flush_block(ptr noundef %cond, i64 noundef %sub79, i32 noundef 0)
  %52 = load i32, ptr @strstart, align 4
  %conv81 = zext i32 %52 to i64
  store i64 %conv81, ptr @block_start, align 8
  br label %if.end82

if.end82:                                         ; preds = %cond.end, %if.end71
  br label %while.cond83

while.cond83:                                     ; preds = %while.body87, %if.end82
  %53 = load i32, ptr @lookahead, align 4
  %cmp84 = icmp ult i32 %53, 262
  br i1 %cmp84, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond83
  %54 = load i32, ptr @eofile, align 4
  %tobool86 = icmp ne i32 %54, 0
  %lnot = xor i1 %tobool86, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond83
  %55 = phi i1 [ false, %while.cond83 ], [ %lnot, %land.rhs ]
  br i1 %55, label %while.body87, label %while.end

while.body87:                                     ; preds = %land.end
  call void @fill_window()
  br label %while.cond83, !llvm.loop !32

while.end:                                        ; preds = %land.end
  br label %while.cond, !llvm.loop !33

while.end88:                                      ; preds = %while.cond
  %56 = load i64, ptr @block_start, align 8
  %cmp89 = icmp sge i64 %56, 0
  br i1 %cmp89, label %cond.true91, label %cond.false95

cond.true91:                                      ; preds = %while.end88
  %57 = load i64, ptr @block_start, align 8
  %conv92 = trunc i64 %57 to i32
  %idxprom93 = zext i32 %conv92 to i64
  %arrayidx94 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom93
  br label %cond.end96

cond.false95:                                     ; preds = %while.end88
  br label %cond.end96

cond.end96:                                       ; preds = %cond.false95, %cond.true91
  %cond97 = phi ptr [ %arrayidx94, %cond.true91 ], [ null, %cond.false95 ]
  %58 = load i32, ptr @strstart, align 4
  %conv98 = zext i32 %58 to i64
  %59 = load i64, ptr @block_start, align 8
  %sub99 = sub nsw i64 %conv98, %59
  %call100 = call i64 @flush_block(ptr noundef %cond97, i64 noundef %sub99, i32 noundef 1)
  ret i64 %call100
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ct_init(ptr noundef %attr, ptr noundef %methodp) #0 {
entry:
  %attr.addr = alloca ptr, align 8
  %methodp.addr = alloca ptr, align 8
  %n = alloca i32, align 4
  %bits = alloca i32, align 4
  %length = alloca i32, align 4
  %code = alloca i32, align 4
  %dist = alloca i32, align 4
  store ptr %attr, ptr %attr.addr, align 8
  store ptr %methodp, ptr %methodp.addr, align 8
  %0 = load ptr, ptr %attr.addr, align 8
  store ptr %0, ptr @file_type, align 8
  %1 = load ptr, ptr %methodp.addr, align 8
  store ptr %1, ptr @file_method, align 8
  store i64 0, ptr @input_len, align 8
  store i64 0, ptr @compressed_len, align 8
  %2 = load i16, ptr getelementptr inbounds (%struct.ct_data, ptr @static_dtree, i32 0, i32 1), align 2
  %conv = zext i16 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, ptr %length, align 4
  store i32 0, ptr %code, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %3 = load i32, ptr %code, align 4
  %cmp2 = icmp slt i32 %3, 28
  br i1 %cmp2, label %for.body, label %for.end16

for.body:                                         ; preds = %for.cond
  %4 = load i32, ptr %length, align 4
  %5 = load i32, ptr %code, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [29 x i32], ptr @base_length, i64 0, i64 %idxprom
  store i32 %4, ptr %arrayidx, align 4
  store i32 0, ptr %n, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %6 = load i32, ptr %n, align 4
  %7 = load i32, ptr %code, align 4
  %idxprom5 = sext i32 %7 to i64
  %arrayidx6 = getelementptr inbounds [29 x i32], ptr @extra_lbits, i64 0, i64 %idxprom5
  %8 = load i32, ptr %arrayidx6, align 4
  %shl = shl i32 1, %8
  %cmp7 = icmp slt i32 %6, %shl
  br i1 %cmp7, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond4
  %9 = load i32, ptr %code, align 4
  %conv10 = trunc i32 %9 to i8
  %10 = load i32, ptr %length, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, ptr %length, align 4
  %idxprom11 = sext i32 %10 to i64
  %arrayidx12 = getelementptr inbounds [256 x i8], ptr @length_code, i64 0, i64 %idxprom11
  store i8 %conv10, ptr %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body9
  %11 = load i32, ptr %n, align 4
  %inc13 = add nsw i32 %11, 1
  store i32 %inc13, ptr %n, align 4
  br label %for.cond4, !llvm.loop !34

for.end:                                          ; preds = %for.cond4
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %12 = load i32, ptr %code, align 4
  %inc15 = add nsw i32 %12, 1
  store i32 %inc15, ptr %code, align 4
  br label %for.cond, !llvm.loop !35

for.end16:                                        ; preds = %for.cond
  %13 = load i32, ptr %code, align 4
  %conv17 = trunc i32 %13 to i8
  %14 = load i32, ptr %length, align 4
  %sub = sub nsw i32 %14, 1
  %idxprom18 = sext i32 %sub to i64
  %arrayidx19 = getelementptr inbounds [256 x i8], ptr @length_code, i64 0, i64 %idxprom18
  store i8 %conv17, ptr %arrayidx19, align 1
  store i32 0, ptr %dist, align 4
  store i32 0, ptr %code, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc40, %for.end16
  %15 = load i32, ptr %code, align 4
  %cmp21 = icmp slt i32 %15, 16
  br i1 %cmp21, label %for.body23, label %for.end42

for.body23:                                       ; preds = %for.cond20
  %16 = load i32, ptr %dist, align 4
  %17 = load i32, ptr %code, align 4
  %idxprom24 = sext i32 %17 to i64
  %arrayidx25 = getelementptr inbounds [30 x i32], ptr @base_dist, i64 0, i64 %idxprom24
  store i32 %16, ptr %arrayidx25, align 4
  store i32 0, ptr %n, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc37, %for.body23
  %18 = load i32, ptr %n, align 4
  %19 = load i32, ptr %code, align 4
  %idxprom27 = sext i32 %19 to i64
  %arrayidx28 = getelementptr inbounds [30 x i32], ptr @extra_dbits, i64 0, i64 %idxprom27
  %20 = load i32, ptr %arrayidx28, align 4
  %shl29 = shl i32 1, %20
  %cmp30 = icmp slt i32 %18, %shl29
  br i1 %cmp30, label %for.body32, label %for.end39

for.body32:                                       ; preds = %for.cond26
  %21 = load i32, ptr %code, align 4
  %conv33 = trunc i32 %21 to i8
  %22 = load i32, ptr %dist, align 4
  %inc34 = add nsw i32 %22, 1
  store i32 %inc34, ptr %dist, align 4
  %idxprom35 = sext i32 %22 to i64
  %arrayidx36 = getelementptr inbounds [512 x i8], ptr @dist_code, i64 0, i64 %idxprom35
  store i8 %conv33, ptr %arrayidx36, align 1
  br label %for.inc37

for.inc37:                                        ; preds = %for.body32
  %23 = load i32, ptr %n, align 4
  %inc38 = add nsw i32 %23, 1
  store i32 %inc38, ptr %n, align 4
  br label %for.cond26, !llvm.loop !36

for.end39:                                        ; preds = %for.cond26
  br label %for.inc40

for.inc40:                                        ; preds = %for.end39
  %24 = load i32, ptr %code, align 4
  %inc41 = add nsw i32 %24, 1
  store i32 %inc41, ptr %code, align 4
  br label %for.cond20, !llvm.loop !37

for.end42:                                        ; preds = %for.cond20
  %25 = load i32, ptr %dist, align 4
  %shr = ashr i32 %25, 7
  store i32 %shr, ptr %dist, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc65, %for.end42
  %26 = load i32, ptr %code, align 4
  %cmp44 = icmp slt i32 %26, 30
  br i1 %cmp44, label %for.body46, label %for.end67

for.body46:                                       ; preds = %for.cond43
  %27 = load i32, ptr %dist, align 4
  %shl47 = shl i32 %27, 7
  %28 = load i32, ptr %code, align 4
  %idxprom48 = sext i32 %28 to i64
  %arrayidx49 = getelementptr inbounds [30 x i32], ptr @base_dist, i64 0, i64 %idxprom48
  store i32 %shl47, ptr %arrayidx49, align 4
  store i32 0, ptr %n, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc62, %for.body46
  %29 = load i32, ptr %n, align 4
  %30 = load i32, ptr %code, align 4
  %idxprom51 = sext i32 %30 to i64
  %arrayidx52 = getelementptr inbounds [30 x i32], ptr @extra_dbits, i64 0, i64 %idxprom51
  %31 = load i32, ptr %arrayidx52, align 4
  %sub53 = sub nsw i32 %31, 7
  %shl54 = shl i32 1, %sub53
  %cmp55 = icmp slt i32 %29, %shl54
  br i1 %cmp55, label %for.body57, label %for.end64

for.body57:                                       ; preds = %for.cond50
  %32 = load i32, ptr %code, align 4
  %conv58 = trunc i32 %32 to i8
  %33 = load i32, ptr %dist, align 4
  %inc59 = add nsw i32 %33, 1
  store i32 %inc59, ptr %dist, align 4
  %add = add nsw i32 256, %33
  %idxprom60 = sext i32 %add to i64
  %arrayidx61 = getelementptr inbounds [512 x i8], ptr @dist_code, i64 0, i64 %idxprom60
  store i8 %conv58, ptr %arrayidx61, align 1
  br label %for.inc62

for.inc62:                                        ; preds = %for.body57
  %34 = load i32, ptr %n, align 4
  %inc63 = add nsw i32 %34, 1
  store i32 %inc63, ptr %n, align 4
  br label %for.cond50, !llvm.loop !38

for.end64:                                        ; preds = %for.cond50
  br label %for.inc65

for.inc65:                                        ; preds = %for.end64
  %35 = load i32, ptr %code, align 4
  %inc66 = add nsw i32 %35, 1
  store i32 %inc66, ptr %code, align 4
  br label %for.cond43, !llvm.loop !39

for.end67:                                        ; preds = %for.cond43
  store i32 0, ptr %bits, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc74, %for.end67
  %36 = load i32, ptr %bits, align 4
  %cmp69 = icmp sle i32 %36, 15
  br i1 %cmp69, label %for.body71, label %for.end76

for.body71:                                       ; preds = %for.cond68
  %37 = load i32, ptr %bits, align 4
  %idxprom72 = sext i32 %37 to i64
  %arrayidx73 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom72
  store i16 0, ptr %arrayidx73, align 2
  br label %for.inc74

for.inc74:                                        ; preds = %for.body71
  %38 = load i32, ptr %bits, align 4
  %inc75 = add nsw i32 %38, 1
  store i32 %inc75, ptr %bits, align 4
  br label %for.cond68, !llvm.loop !40

for.end76:                                        ; preds = %for.cond68
  store i32 0, ptr %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end76
  %39 = load i32, ptr %n, align 4
  %cmp77 = icmp sle i32 %39, 143
  br i1 %cmp77, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %40 = load i32, ptr %n, align 4
  %inc79 = add nsw i32 %40, 1
  store i32 %inc79, ptr %n, align 4
  %idxprom80 = sext i32 %40 to i64
  %arrayidx81 = getelementptr inbounds [288 x %struct.ct_data], ptr @static_ltree, i64 0, i64 %idxprom80
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx81, i32 0, i32 1
  store i16 8, ptr %dl, align 2
  %41 = load i16, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 8), align 16
  %inc82 = add i16 %41, 1
  store i16 %inc82, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 8), align 16
  br label %while.cond, !llvm.loop !41

while.end:                                        ; preds = %while.cond
  br label %while.cond83

while.cond83:                                     ; preds = %while.body86, %while.end
  %42 = load i32, ptr %n, align 4
  %cmp84 = icmp sle i32 %42, 255
  br i1 %cmp84, label %while.body86, label %while.end92

while.body86:                                     ; preds = %while.cond83
  %43 = load i32, ptr %n, align 4
  %inc87 = add nsw i32 %43, 1
  store i32 %inc87, ptr %n, align 4
  %idxprom88 = sext i32 %43 to i64
  %arrayidx89 = getelementptr inbounds [288 x %struct.ct_data], ptr @static_ltree, i64 0, i64 %idxprom88
  %dl90 = getelementptr inbounds %struct.ct_data, ptr %arrayidx89, i32 0, i32 1
  store i16 9, ptr %dl90, align 2
  %44 = load i16, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 9), align 2
  %inc91 = add i16 %44, 1
  store i16 %inc91, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 9), align 2
  br label %while.cond83, !llvm.loop !42

while.end92:                                      ; preds = %while.cond83
  br label %while.cond93

while.cond93:                                     ; preds = %while.body96, %while.end92
  %45 = load i32, ptr %n, align 4
  %cmp94 = icmp sle i32 %45, 279
  br i1 %cmp94, label %while.body96, label %while.end102

while.body96:                                     ; preds = %while.cond93
  %46 = load i32, ptr %n, align 4
  %inc97 = add nsw i32 %46, 1
  store i32 %inc97, ptr %n, align 4
  %idxprom98 = sext i32 %46 to i64
  %arrayidx99 = getelementptr inbounds [288 x %struct.ct_data], ptr @static_ltree, i64 0, i64 %idxprom98
  %dl100 = getelementptr inbounds %struct.ct_data, ptr %arrayidx99, i32 0, i32 1
  store i16 7, ptr %dl100, align 2
  %47 = load i16, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 7), align 2
  %inc101 = add i16 %47, 1
  store i16 %inc101, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 7), align 2
  br label %while.cond93, !llvm.loop !43

while.end102:                                     ; preds = %while.cond93
  br label %while.cond103

while.cond103:                                    ; preds = %while.body106, %while.end102
  %48 = load i32, ptr %n, align 4
  %cmp104 = icmp sle i32 %48, 287
  br i1 %cmp104, label %while.body106, label %while.end112

while.body106:                                    ; preds = %while.cond103
  %49 = load i32, ptr %n, align 4
  %inc107 = add nsw i32 %49, 1
  store i32 %inc107, ptr %n, align 4
  %idxprom108 = sext i32 %49 to i64
  %arrayidx109 = getelementptr inbounds [288 x %struct.ct_data], ptr @static_ltree, i64 0, i64 %idxprom108
  %dl110 = getelementptr inbounds %struct.ct_data, ptr %arrayidx109, i32 0, i32 1
  store i16 8, ptr %dl110, align 2
  %50 = load i16, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 8), align 16
  %inc111 = add i16 %50, 1
  store i16 %inc111, ptr getelementptr inbounds ([16 x i16], ptr @bl_count, i64 0, i64 8), align 16
  br label %while.cond103, !llvm.loop !44

while.end112:                                     ; preds = %while.cond103
  call void @gen_codes(ptr noundef @static_ltree, i32 noundef 287)
  store i32 0, ptr %n, align 4
  br label %for.cond113

for.cond113:                                      ; preds = %for.inc123, %while.end112
  %51 = load i32, ptr %n, align 4
  %cmp114 = icmp slt i32 %51, 30
  br i1 %cmp114, label %for.body116, label %for.end125

for.body116:                                      ; preds = %for.cond113
  %52 = load i32, ptr %n, align 4
  %idxprom117 = sext i32 %52 to i64
  %arrayidx118 = getelementptr inbounds [30 x %struct.ct_data], ptr @static_dtree, i64 0, i64 %idxprom117
  %dl119 = getelementptr inbounds %struct.ct_data, ptr %arrayidx118, i32 0, i32 1
  store i16 5, ptr %dl119, align 2
  %53 = load i32, ptr %n, align 4
  %call = call i32 @bi_reverse(i32 noundef %53, i32 noundef 5)
  %conv120 = trunc i32 %call to i16
  %54 = load i32, ptr %n, align 4
  %idxprom121 = sext i32 %54 to i64
  %arrayidx122 = getelementptr inbounds [30 x %struct.ct_data], ptr @static_dtree, i64 0, i64 %idxprom121
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx122, i32 0, i32 0
  store i16 %conv120, ptr %fc, align 4
  br label %for.inc123

for.inc123:                                       ; preds = %for.body116
  %55 = load i32, ptr %n, align 4
  %inc124 = add nsw i32 %55, 1
  store i32 %inc124, ptr %n, align 4
  br label %for.cond113, !llvm.loop !45

for.end125:                                       ; preds = %for.cond113
  call void @init_block()
  br label %return

return:                                           ; preds = %for.end125, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @gen_codes(ptr noundef %tree, i32 noundef %max_code) #0 {
entry:
  %tree.addr = alloca ptr, align 8
  %max_code.addr = alloca i32, align 4
  %next_code = alloca [16 x i16], align 16
  %code = alloca i16, align 2
  %bits = alloca i32, align 4
  %n = alloca i32, align 4
  %len = alloca i32, align 4
  store ptr %tree, ptr %tree.addr, align 8
  store i32 %max_code, ptr %max_code.addr, align 4
  store i16 0, ptr %code, align 2
  store i32 1, ptr %bits, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %bits, align 4
  %cmp = icmp sle i32 %0, 15
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i16, ptr %code, align 2
  %conv = zext i16 %1 to i32
  %2 = load i32, ptr %bits, align 4
  %sub = sub nsw i32 %2, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom
  %3 = load i16, ptr %arrayidx, align 2
  %conv1 = zext i16 %3 to i32
  %add = add nsw i32 %conv, %conv1
  %shl = shl i32 %add, 1
  %conv2 = trunc i32 %shl to i16
  store i16 %conv2, ptr %code, align 2
  %4 = load i32, ptr %bits, align 4
  %idxprom3 = sext i32 %4 to i64
  %arrayidx4 = getelementptr inbounds [16 x i16], ptr %next_code, i64 0, i64 %idxprom3
  store i16 %conv2, ptr %arrayidx4, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %bits, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %bits, align 4
  br label %for.cond, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %n, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc21, %for.end
  %6 = load i32, ptr %n, align 4
  %7 = load i32, ptr %max_code.addr, align 4
  %cmp6 = icmp sle i32 %6, %7
  br i1 %cmp6, label %for.body8, label %for.end23

for.body8:                                        ; preds = %for.cond5
  %8 = load ptr, ptr %tree.addr, align 8
  %9 = load i32, ptr %n, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds %struct.ct_data, ptr %8, i64 %idxprom9
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx10, i32 0, i32 1
  %10 = load i16, ptr %dl, align 2
  %conv11 = zext i16 %10 to i32
  store i32 %conv11, ptr %len, align 4
  %11 = load i32, ptr %len, align 4
  %cmp12 = icmp eq i32 %11, 0
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.body8
  br label %for.inc21

if.end:                                           ; preds = %for.body8
  %12 = load i32, ptr %len, align 4
  %idxprom14 = sext i32 %12 to i64
  %arrayidx15 = getelementptr inbounds [16 x i16], ptr %next_code, i64 0, i64 %idxprom14
  %13 = load i16, ptr %arrayidx15, align 2
  %inc16 = add i16 %13, 1
  store i16 %inc16, ptr %arrayidx15, align 2
  %conv17 = zext i16 %13 to i32
  %14 = load i32, ptr %len, align 4
  %call = call i32 @bi_reverse(i32 noundef %conv17, i32 noundef %14)
  %conv18 = trunc i32 %call to i16
  %15 = load ptr, ptr %tree.addr, align 8
  %16 = load i32, ptr %n, align 4
  %idxprom19 = sext i32 %16 to i64
  %arrayidx20 = getelementptr inbounds %struct.ct_data, ptr %15, i64 %idxprom19
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx20, i32 0, i32 0
  store i16 %conv18, ptr %fc, align 2
  br label %for.inc21

for.inc21:                                        ; preds = %if.end, %if.then
  %17 = load i32, ptr %n, align 4
  %inc22 = add nsw i32 %17, 1
  store i32 %inc22, ptr %n, align 4
  br label %for.cond5, !llvm.loop !47

for.end23:                                        ; preds = %for.cond5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_block() #0 {
entry:
  %n = alloca i32, align 4
  store i32 0, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %n, align 4
  %cmp = icmp slt i32 %0, 286
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %n, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 %idxprom
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx, i32 0, i32 0
  store i16 0, ptr %fc, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, ptr %n, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, ptr %n, align 4
  br label %for.cond, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %n, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc7, %for.end
  %3 = load i32, ptr %n, align 4
  %cmp2 = icmp slt i32 %3, 30
  br i1 %cmp2, label %for.body3, label %for.end9

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, ptr %n, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [61 x %struct.ct_data], ptr @dyn_dtree, i64 0, i64 %idxprom4
  %fc6 = getelementptr inbounds %struct.ct_data, ptr %arrayidx5, i32 0, i32 0
  store i16 0, ptr %fc6, align 4
  br label %for.inc7

for.inc7:                                         ; preds = %for.body3
  %5 = load i32, ptr %n, align 4
  %inc8 = add nsw i32 %5, 1
  store i32 %inc8, ptr %n, align 4
  br label %for.cond1, !llvm.loop !49

for.end9:                                         ; preds = %for.cond1
  store i32 0, ptr %n, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc16, %for.end9
  %6 = load i32, ptr %n, align 4
  %cmp11 = icmp slt i32 %6, 19
  br i1 %cmp11, label %for.body12, label %for.end18

for.body12:                                       ; preds = %for.cond10
  %7 = load i32, ptr %n, align 4
  %idxprom13 = sext i32 %7 to i64
  %arrayidx14 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom13
  %fc15 = getelementptr inbounds %struct.ct_data, ptr %arrayidx14, i32 0, i32 0
  store i16 0, ptr %fc15, align 4
  br label %for.inc16

for.inc16:                                        ; preds = %for.body12
  %8 = load i32, ptr %n, align 4
  %inc17 = add nsw i32 %8, 1
  store i32 %inc17, ptr %n, align 4
  br label %for.cond10, !llvm.loop !50

for.end18:                                        ; preds = %for.cond10
  store i16 1, ptr getelementptr inbounds ([573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 256), align 16
  store i64 0, ptr @static_len, align 8
  store i64 0, ptr @opt_len, align 8
  store i32 0, ptr @last_flags, align 4
  store i32 0, ptr @last_dist, align 4
  store i32 0, ptr @last_lit, align 4
  store i8 0, ptr @flags, align 1
  store i8 1, ptr @flag_bit, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @flush_block(ptr noundef %buf, i64 noundef %stored_len, i32 noundef %eof) #0 {
entry:
  %buf.addr = alloca ptr, align 8
  %stored_len.addr = alloca i64, align 8
  %eof.addr = alloca i32, align 4
  %opt_lenb = alloca i64, align 8
  %static_lenb = alloca i64, align 8
  %max_blindex = alloca i32, align 4
  store ptr %buf, ptr %buf.addr, align 8
  store i64 %stored_len, ptr %stored_len.addr, align 8
  store i32 %eof, ptr %eof.addr, align 4
  %0 = load i8, ptr @flags, align 1
  %1 = load i32, ptr @last_flags, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds [4096 x i8], ptr @flag_buf, i64 0, i64 %idxprom
  store i8 %0, ptr %arrayidx, align 1
  %2 = load ptr, ptr @file_type, align 8
  %3 = load i16, ptr %2, align 2
  %conv = zext i16 %3 to i32
  %cmp = icmp eq i32 %conv, 65535
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @set_file_type()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @build_tree(ptr noundef @l_desc)
  call void @build_tree(ptr noundef @d_desc)
  %call = call i32 @build_bl_tree()
  store i32 %call, ptr %max_blindex, align 4
  %4 = load i64, ptr @opt_len, align 8
  %add = add i64 %4, 3
  %add2 = add i64 %add, 7
  %shr = lshr i64 %add2, 3
  store i64 %shr, ptr %opt_lenb, align 8
  %5 = load i64, ptr @static_len, align 8
  %add3 = add i64 %5, 3
  %add4 = add i64 %add3, 7
  %shr5 = lshr i64 %add4, 3
  store i64 %shr5, ptr %static_lenb, align 8
  %6 = load i64, ptr %stored_len.addr, align 8
  %7 = load i64, ptr @input_len, align 8
  %add6 = add i64 %7, %6
  store i64 %add6, ptr @input_len, align 8
  %8 = load i64, ptr %static_lenb, align 8
  %9 = load i64, ptr %opt_lenb, align 8
  %cmp7 = icmp ule i64 %8, %9
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  %10 = load i64, ptr %static_lenb, align 8
  store i64 %10, ptr %opt_lenb, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end
  %11 = load i64, ptr %stored_len.addr, align 8
  %12 = load i64, ptr %opt_lenb, align 8
  %cmp11 = icmp ule i64 %11, %12
  br i1 %cmp11, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end10
  %13 = load i32, ptr %eof.addr, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %land.lhs.true
  %14 = load i64, ptr @compressed_len, align 8
  %cmp14 = icmp eq i64 %14, 0
  br i1 %cmp14, label %land.lhs.true16, label %if.else

land.lhs.true16:                                  ; preds = %land.lhs.true13
  br i1 false, label %if.then17, label %if.else

if.then17:                                        ; preds = %land.lhs.true16
  %15 = load ptr, ptr %buf.addr, align 8
  %cmp18 = icmp eq ptr %15, null
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.then17
  call void @error(ptr noundef @.str.158)
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.then17
  %16 = load ptr, ptr %buf.addr, align 8
  %17 = load i64, ptr %stored_len.addr, align 8
  %conv22 = trunc i64 %17 to i32
  call void @copy_block(ptr noundef %16, i32 noundef %conv22, i32 noundef 0)
  %18 = load i64, ptr %stored_len.addr, align 8
  %shl = shl i64 %18, 3
  store i64 %shl, ptr @compressed_len, align 8
  %19 = load ptr, ptr @file_method, align 8
  store i32 0, ptr %19, align 4
  br label %if.end53

if.else:                                          ; preds = %land.lhs.true16, %land.lhs.true13, %land.lhs.true, %if.end10
  %20 = load i64, ptr %stored_len.addr, align 8
  %add23 = add i64 %20, 4
  %21 = load i64, ptr %opt_lenb, align 8
  %cmp24 = icmp ule i64 %add23, %21
  br i1 %cmp24, label %land.lhs.true26, label %if.else37

land.lhs.true26:                                  ; preds = %if.else
  %22 = load ptr, ptr %buf.addr, align 8
  %cmp27 = icmp ne ptr %22, null
  br i1 %cmp27, label %if.then29, label %if.else37

if.then29:                                        ; preds = %land.lhs.true26
  %23 = load i32, ptr %eof.addr, align 4
  %add30 = add nsw i32 0, %23
  call void @send_bits(i32 noundef %add30, i32 noundef 3)
  %24 = load i64, ptr @compressed_len, align 8
  %add31 = add i64 %24, 3
  %add32 = add i64 %add31, 7
  %and = and i64 %add32, -8
  store i64 %and, ptr @compressed_len, align 8
  %25 = load i64, ptr %stored_len.addr, align 8
  %add33 = add i64 %25, 4
  %shl34 = shl i64 %add33, 3
  %26 = load i64, ptr @compressed_len, align 8
  %add35 = add i64 %26, %shl34
  store i64 %add35, ptr @compressed_len, align 8
  %27 = load ptr, ptr %buf.addr, align 8
  %28 = load i64, ptr %stored_len.addr, align 8
  %conv36 = trunc i64 %28 to i32
  call void @copy_block(ptr noundef %27, i32 noundef %conv36, i32 noundef 1)
  br label %if.end52

if.else37:                                        ; preds = %land.lhs.true26, %if.else
  %29 = load i64, ptr %static_lenb, align 8
  %30 = load i64, ptr %opt_lenb, align 8
  %cmp38 = icmp eq i64 %29, %30
  br i1 %cmp38, label %if.then40, label %if.else44

if.then40:                                        ; preds = %if.else37
  %31 = load i32, ptr %eof.addr, align 4
  %add41 = add nsw i32 2, %31
  call void @send_bits(i32 noundef %add41, i32 noundef 3)
  call void @compress_block(ptr noundef @static_ltree, ptr noundef @static_dtree)
  %32 = load i64, ptr @static_len, align 8
  %add42 = add i64 3, %32
  %33 = load i64, ptr @compressed_len, align 8
  %add43 = add i64 %33, %add42
  store i64 %add43, ptr @compressed_len, align 8
  br label %if.end51

if.else44:                                        ; preds = %if.else37
  %34 = load i32, ptr %eof.addr, align 4
  %add45 = add nsw i32 4, %34
  call void @send_bits(i32 noundef %add45, i32 noundef 3)
  %35 = load i32, ptr getelementptr inbounds (%struct.tree_desc, ptr @l_desc, i32 0, i32 6), align 4
  %add46 = add nsw i32 %35, 1
  %36 = load i32, ptr getelementptr inbounds (%struct.tree_desc, ptr @d_desc, i32 0, i32 6), align 4
  %add47 = add nsw i32 %36, 1
  %37 = load i32, ptr %max_blindex, align 4
  %add48 = add nsw i32 %37, 1
  call void @send_all_trees(i32 noundef %add46, i32 noundef %add47, i32 noundef %add48)
  call void @compress_block(ptr noundef @dyn_ltree, ptr noundef @dyn_dtree)
  %38 = load i64, ptr @opt_len, align 8
  %add49 = add i64 3, %38
  %39 = load i64, ptr @compressed_len, align 8
  %add50 = add i64 %39, %add49
  store i64 %add50, ptr @compressed_len, align 8
  br label %if.end51

if.end51:                                         ; preds = %if.else44, %if.then40
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then29
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end21
  call void @init_block()
  %40 = load i32, ptr %eof.addr, align 4
  %tobool54 = icmp ne i32 %40, 0
  br i1 %tobool54, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end53
  call void @bi_windup()
  %41 = load i64, ptr @compressed_len, align 8
  %add56 = add i64 %41, 7
  store i64 %add56, ptr @compressed_len, align 8
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end53
  %42 = load i64, ptr @compressed_len, align 8
  %shr58 = lshr i64 %42, 3
  ret i64 %shr58
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @set_file_type() #0 {
entry:
  %n = alloca i32, align 4
  %ascii_freq = alloca i32, align 4
  %bin_freq = alloca i32, align 4
  store i32 0, ptr %n, align 4
  store i32 0, ptr %ascii_freq, align 4
  store i32 0, ptr %bin_freq, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, ptr %n, align 4
  %cmp = icmp slt i32 %0, 7
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, ptr %n, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, ptr %n, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 %idxprom
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx, i32 0, i32 0
  %2 = load i16, ptr %fc, align 4
  %conv = zext i16 %2 to i32
  %3 = load i32, ptr %bin_freq, align 4
  %add = add i32 %3, %conv
  store i32 %add, ptr %bin_freq, align 4
  br label %while.cond, !llvm.loop !51

while.end:                                        ; preds = %while.cond
  br label %while.cond1

while.cond1:                                      ; preds = %while.body4, %while.end
  %4 = load i32, ptr %n, align 4
  %cmp2 = icmp slt i32 %4, 128
  br i1 %cmp2, label %while.body4, label %while.end11

while.body4:                                      ; preds = %while.cond1
  %5 = load i32, ptr %n, align 4
  %inc5 = add nsw i32 %5, 1
  store i32 %inc5, ptr %n, align 4
  %idxprom6 = sext i32 %5 to i64
  %arrayidx7 = getelementptr inbounds [573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 %idxprom6
  %fc8 = getelementptr inbounds %struct.ct_data, ptr %arrayidx7, i32 0, i32 0
  %6 = load i16, ptr %fc8, align 4
  %conv9 = zext i16 %6 to i32
  %7 = load i32, ptr %ascii_freq, align 4
  %add10 = add i32 %7, %conv9
  store i32 %add10, ptr %ascii_freq, align 4
  br label %while.cond1, !llvm.loop !52

while.end11:                                      ; preds = %while.cond1
  br label %while.cond12

while.cond12:                                     ; preds = %while.body15, %while.end11
  %8 = load i32, ptr %n, align 4
  %cmp13 = icmp slt i32 %8, 256
  br i1 %cmp13, label %while.body15, label %while.end22

while.body15:                                     ; preds = %while.cond12
  %9 = load i32, ptr %n, align 4
  %inc16 = add nsw i32 %9, 1
  store i32 %inc16, ptr %n, align 4
  %idxprom17 = sext i32 %9 to i64
  %arrayidx18 = getelementptr inbounds [573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 %idxprom17
  %fc19 = getelementptr inbounds %struct.ct_data, ptr %arrayidx18, i32 0, i32 0
  %10 = load i16, ptr %fc19, align 4
  %conv20 = zext i16 %10 to i32
  %11 = load i32, ptr %bin_freq, align 4
  %add21 = add i32 %11, %conv20
  store i32 %add21, ptr %bin_freq, align 4
  br label %while.cond12, !llvm.loop !53

while.end22:                                      ; preds = %while.cond12
  %12 = load i32, ptr %bin_freq, align 4
  %13 = load i32, ptr %ascii_freq, align 4
  %shr = lshr i32 %13, 2
  %cmp23 = icmp ugt i32 %12, %shr
  %14 = zext i1 %cmp23 to i64
  %cond = select i1 %cmp23, i32 0, i32 1
  %conv25 = trunc i32 %cond to i16
  %15 = load ptr, ptr @file_type, align 8
  store i16 %conv25, ptr %15, align 2
  %16 = load ptr, ptr @file_type, align 8
  %17 = load i16, ptr %16, align 2
  %conv26 = zext i16 %17 to i32
  %cmp27 = icmp eq i32 %conv26, 0
  br i1 %cmp27, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end22
  br i1 false, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @warn(ptr noundef @.str.1.159, ptr noundef @.str.2.160)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.end22
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @build_tree(ptr noundef %desc) #0 {
entry:
  %desc.addr = alloca ptr, align 8
  %tree = alloca ptr, align 8
  %stree = alloca ptr, align 8
  %elems = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %max_code = alloca i32, align 4
  %node = alloca i32, align 4
  %new = alloca i32, align 4
  store ptr %desc, ptr %desc.addr, align 8
  %0 = load ptr, ptr %desc.addr, align 8
  %dyn_tree = getelementptr inbounds %struct.tree_desc, ptr %0, i32 0, i32 0
  %1 = load ptr, ptr %dyn_tree, align 8
  store ptr %1, ptr %tree, align 8
  %2 = load ptr, ptr %desc.addr, align 8
  %static_tree = getelementptr inbounds %struct.tree_desc, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %static_tree, align 8
  store ptr %3, ptr %stree, align 8
  %4 = load ptr, ptr %desc.addr, align 8
  %elems1 = getelementptr inbounds %struct.tree_desc, ptr %4, i32 0, i32 4
  %5 = load i32, ptr %elems1, align 4
  store i32 %5, ptr %elems, align 4
  store i32 -1, ptr %max_code, align 4
  %6 = load i32, ptr %elems, align 4
  store i32 %6, ptr %node, align 4
  store i32 0, ptr @heap_len, align 4
  store i32 573, ptr @heap_max, align 4
  store i32 0, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32, ptr %n, align 4
  %8 = load i32, ptr %elems, align 4
  %cmp = icmp slt i32 %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load ptr, ptr %tree, align 8
  %10 = load i32, ptr %n, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds %struct.ct_data, ptr %9, i64 %idxprom
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx, i32 0, i32 0
  %11 = load i16, ptr %fc, align 2
  %conv = zext i16 %11 to i32
  %cmp2 = icmp ne i32 %conv, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %12 = load i32, ptr %n, align 4
  store i32 %12, ptr %max_code, align 4
  %13 = load i32, ptr @heap_len, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, ptr @heap_len, align 4
  %idxprom4 = sext i32 %inc to i64
  %arrayidx5 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom4
  store i32 %12, ptr %arrayidx5, align 4
  %14 = load i32, ptr %n, align 4
  %idxprom6 = sext i32 %14 to i64
  %arrayidx7 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom6
  store i8 0, ptr %arrayidx7, align 1
  br label %if.end

if.else:                                          ; preds = %for.body
  %15 = load ptr, ptr %tree, align 8
  %16 = load i32, ptr %n, align 4
  %idxprom8 = sext i32 %16 to i64
  %arrayidx9 = getelementptr inbounds %struct.ct_data, ptr %15, i64 %idxprom8
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx9, i32 0, i32 1
  store i16 0, ptr %dl, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i32, ptr %n, align 4
  %inc10 = add nsw i32 %17, 1
  store i32 %inc10, ptr %n, align 4
  br label %for.cond, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %if.end29, %for.end
  %18 = load i32, ptr @heap_len, align 4
  %cmp11 = icmp slt i32 %18, 2
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %19 = load i32, ptr %max_code, align 4
  %cmp13 = icmp slt i32 %19, 2
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %20 = load i32, ptr %max_code, align 4
  %inc15 = add nsw i32 %20, 1
  store i32 %inc15, ptr %max_code, align 4
  br label %cond.end

cond.false:                                       ; preds = %while.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %inc15, %cond.true ], [ 0, %cond.false ]
  %21 = load i32, ptr @heap_len, align 4
  %inc16 = add nsw i32 %21, 1
  store i32 %inc16, ptr @heap_len, align 4
  %idxprom17 = sext i32 %inc16 to i64
  %arrayidx18 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom17
  store i32 %cond, ptr %arrayidx18, align 4
  store i32 %cond, ptr %new, align 4
  %22 = load ptr, ptr %tree, align 8
  %23 = load i32, ptr %new, align 4
  %idxprom19 = sext i32 %23 to i64
  %arrayidx20 = getelementptr inbounds %struct.ct_data, ptr %22, i64 %idxprom19
  %fc21 = getelementptr inbounds %struct.ct_data, ptr %arrayidx20, i32 0, i32 0
  store i16 1, ptr %fc21, align 2
  %24 = load i32, ptr %new, align 4
  %idxprom22 = sext i32 %24 to i64
  %arrayidx23 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom22
  store i8 0, ptr %arrayidx23, align 1
  %25 = load i64, ptr @opt_len, align 8
  %dec = add i64 %25, -1
  store i64 %dec, ptr @opt_len, align 8
  %26 = load ptr, ptr %stree, align 8
  %tobool = icmp ne ptr %26, null
  br i1 %tobool, label %if.then24, label %if.end29

if.then24:                                        ; preds = %cond.end
  %27 = load ptr, ptr %stree, align 8
  %28 = load i32, ptr %new, align 4
  %idxprom25 = sext i32 %28 to i64
  %arrayidx26 = getelementptr inbounds %struct.ct_data, ptr %27, i64 %idxprom25
  %dl27 = getelementptr inbounds %struct.ct_data, ptr %arrayidx26, i32 0, i32 1
  %29 = load i16, ptr %dl27, align 2
  %conv28 = zext i16 %29 to i64
  %30 = load i64, ptr @static_len, align 8
  %sub = sub i64 %30, %conv28
  store i64 %sub, ptr @static_len, align 8
  br label %if.end29

if.end29:                                         ; preds = %if.then24, %cond.end
  br label %while.cond, !llvm.loop !55

while.end:                                        ; preds = %while.cond
  %31 = load i32, ptr %max_code, align 4
  %32 = load ptr, ptr %desc.addr, align 8
  %max_code30 = getelementptr inbounds %struct.tree_desc, ptr %32, i32 0, i32 6
  store i32 %31, ptr %max_code30, align 4
  %33 = load i32, ptr @heap_len, align 4
  %div = sdiv i32 %33, 2
  store i32 %div, ptr %n, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc35, %while.end
  %34 = load i32, ptr %n, align 4
  %cmp32 = icmp sge i32 %34, 1
  br i1 %cmp32, label %for.body34, label %for.end37

for.body34:                                       ; preds = %for.cond31
  %35 = load ptr, ptr %tree, align 8
  %36 = load i32, ptr %n, align 4
  call void @pqdownheap(ptr noundef %35, i32 noundef %36)
  br label %for.inc35

for.inc35:                                        ; preds = %for.body34
  %37 = load i32, ptr %n, align 4
  %dec36 = add nsw i32 %37, -1
  store i32 %dec36, ptr %n, align 4
  br label %for.cond31, !llvm.loop !56

for.end37:                                        ; preds = %for.cond31
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.end37
  %38 = load i32, ptr getelementptr inbounds ([573 x i32], ptr @heap, i64 0, i64 1), align 4
  store i32 %38, ptr %n, align 4
  %39 = load i32, ptr @heap_len, align 4
  %dec38 = add nsw i32 %39, -1
  store i32 %dec38, ptr @heap_len, align 4
  %idxprom39 = sext i32 %39 to i64
  %arrayidx40 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom39
  %40 = load i32, ptr %arrayidx40, align 4
  store i32 %40, ptr getelementptr inbounds ([573 x i32], ptr @heap, i64 0, i64 1), align 4
  %41 = load ptr, ptr %tree, align 8
  call void @pqdownheap(ptr noundef %41, i32 noundef 1)
  %42 = load i32, ptr getelementptr inbounds ([573 x i32], ptr @heap, i64 0, i64 1), align 4
  store i32 %42, ptr %m, align 4
  %43 = load i32, ptr %n, align 4
  %44 = load i32, ptr @heap_max, align 4
  %dec41 = add nsw i32 %44, -1
  store i32 %dec41, ptr @heap_max, align 4
  %idxprom42 = sext i32 %dec41 to i64
  %arrayidx43 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom42
  store i32 %43, ptr %arrayidx43, align 4
  %45 = load i32, ptr %m, align 4
  %46 = load i32, ptr @heap_max, align 4
  %dec44 = add nsw i32 %46, -1
  store i32 %dec44, ptr @heap_max, align 4
  %idxprom45 = sext i32 %dec44 to i64
  %arrayidx46 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom45
  store i32 %45, ptr %arrayidx46, align 4
  %47 = load ptr, ptr %tree, align 8
  %48 = load i32, ptr %n, align 4
  %idxprom47 = sext i32 %48 to i64
  %arrayidx48 = getelementptr inbounds %struct.ct_data, ptr %47, i64 %idxprom47
  %fc49 = getelementptr inbounds %struct.ct_data, ptr %arrayidx48, i32 0, i32 0
  %49 = load i16, ptr %fc49, align 2
  %conv50 = zext i16 %49 to i32
  %50 = load ptr, ptr %tree, align 8
  %51 = load i32, ptr %m, align 4
  %idxprom51 = sext i32 %51 to i64
  %arrayidx52 = getelementptr inbounds %struct.ct_data, ptr %50, i64 %idxprom51
  %fc53 = getelementptr inbounds %struct.ct_data, ptr %arrayidx52, i32 0, i32 0
  %52 = load i16, ptr %fc53, align 2
  %conv54 = zext i16 %52 to i32
  %add = add nsw i32 %conv50, %conv54
  %conv55 = trunc i32 %add to i16
  %53 = load ptr, ptr %tree, align 8
  %54 = load i32, ptr %node, align 4
  %idxprom56 = sext i32 %54 to i64
  %arrayidx57 = getelementptr inbounds %struct.ct_data, ptr %53, i64 %idxprom56
  %fc58 = getelementptr inbounds %struct.ct_data, ptr %arrayidx57, i32 0, i32 0
  store i16 %conv55, ptr %fc58, align 2
  %55 = load i32, ptr %n, align 4
  %idxprom59 = sext i32 %55 to i64
  %arrayidx60 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom59
  %56 = load i8, ptr %arrayidx60, align 1
  %conv61 = zext i8 %56 to i32
  %57 = load i32, ptr %m, align 4
  %idxprom62 = sext i32 %57 to i64
  %arrayidx63 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom62
  %58 = load i8, ptr %arrayidx63, align 1
  %conv64 = zext i8 %58 to i32
  %cmp65 = icmp sge i32 %conv61, %conv64
  br i1 %cmp65, label %cond.true67, label %cond.false71

cond.true67:                                      ; preds = %do.body
  %59 = load i32, ptr %n, align 4
  %idxprom68 = sext i32 %59 to i64
  %arrayidx69 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom68
  %60 = load i8, ptr %arrayidx69, align 1
  %conv70 = zext i8 %60 to i32
  br label %cond.end75

cond.false71:                                     ; preds = %do.body
  %61 = load i32, ptr %m, align 4
  %idxprom72 = sext i32 %61 to i64
  %arrayidx73 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom72
  %62 = load i8, ptr %arrayidx73, align 1
  %conv74 = zext i8 %62 to i32
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false71, %cond.true67
  %cond76 = phi i32 [ %conv70, %cond.true67 ], [ %conv74, %cond.false71 ]
  %add77 = add nsw i32 %cond76, 1
  %conv78 = trunc i32 %add77 to i8
  %63 = load i32, ptr %node, align 4
  %idxprom79 = sext i32 %63 to i64
  %arrayidx80 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom79
  store i8 %conv78, ptr %arrayidx80, align 1
  %64 = load i32, ptr %node, align 4
  %conv81 = trunc i32 %64 to i16
  %65 = load ptr, ptr %tree, align 8
  %66 = load i32, ptr %m, align 4
  %idxprom82 = sext i32 %66 to i64
  %arrayidx83 = getelementptr inbounds %struct.ct_data, ptr %65, i64 %idxprom82
  %dl84 = getelementptr inbounds %struct.ct_data, ptr %arrayidx83, i32 0, i32 1
  store i16 %conv81, ptr %dl84, align 2
  %67 = load ptr, ptr %tree, align 8
  %68 = load i32, ptr %n, align 4
  %idxprom85 = sext i32 %68 to i64
  %arrayidx86 = getelementptr inbounds %struct.ct_data, ptr %67, i64 %idxprom85
  %dl87 = getelementptr inbounds %struct.ct_data, ptr %arrayidx86, i32 0, i32 1
  store i16 %conv81, ptr %dl87, align 2
  %69 = load i32, ptr %node, align 4
  %inc88 = add nsw i32 %69, 1
  store i32 %inc88, ptr %node, align 4
  store i32 %69, ptr getelementptr inbounds ([573 x i32], ptr @heap, i64 0, i64 1), align 4
  %70 = load ptr, ptr %tree, align 8
  call void @pqdownheap(ptr noundef %70, i32 noundef 1)
  br label %do.cond

do.cond:                                          ; preds = %cond.end75
  %71 = load i32, ptr @heap_len, align 4
  %cmp89 = icmp sge i32 %71, 2
  br i1 %cmp89, label %do.body, label %do.end, !llvm.loop !57

do.end:                                           ; preds = %do.cond
  %72 = load i32, ptr getelementptr inbounds ([573 x i32], ptr @heap, i64 0, i64 1), align 4
  %73 = load i32, ptr @heap_max, align 4
  %dec91 = add nsw i32 %73, -1
  store i32 %dec91, ptr @heap_max, align 4
  %idxprom92 = sext i32 %dec91 to i64
  %arrayidx93 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom92
  store i32 %72, ptr %arrayidx93, align 4
  %74 = load ptr, ptr %desc.addr, align 8
  call void @gen_bitlen(ptr noundef %74)
  %75 = load ptr, ptr %tree, align 8
  %76 = load i32, ptr %max_code, align 4
  call void @gen_codes(ptr noundef %75, i32 noundef %76)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @build_bl_tree() #0 {
entry:
  %max_blindex = alloca i32, align 4
  %0 = load i32, ptr getelementptr inbounds (%struct.tree_desc, ptr @l_desc, i32 0, i32 6), align 4
  call void @scan_tree(ptr noundef @dyn_ltree, i32 noundef %0)
  %1 = load i32, ptr getelementptr inbounds (%struct.tree_desc, ptr @d_desc, i32 0, i32 6), align 4
  call void @scan_tree(ptr noundef @dyn_dtree, i32 noundef %1)
  call void @build_tree(ptr noundef @bl_desc)
  store i32 18, ptr %max_blindex, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, ptr %max_blindex, align 4
  %cmp = icmp sge i32 %2, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, ptr %max_blindex, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [19 x i8], ptr @bl_order, i64 0, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %idxprom1 = zext i8 %4 to i64
  %arrayidx2 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom1
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx2, i32 0, i32 1
  %5 = load i16, ptr %dl, align 2
  %conv = zext i16 %5 to i32
  %cmp3 = icmp ne i32 %conv, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, ptr %max_blindex, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, ptr %max_blindex, align 4
  br label %for.cond, !llvm.loop !58

for.end:                                          ; preds = %if.then, %for.cond
  %7 = load i32, ptr %max_blindex, align 4
  %add = add nsw i32 %7, 1
  %mul = mul nsw i32 3, %add
  %add5 = add nsw i32 %mul, 5
  %add6 = add nsw i32 %add5, 5
  %add7 = add nsw i32 %add6, 4
  %conv8 = sext i32 %add7 to i64
  %8 = load i64, ptr @opt_len, align 8
  %add9 = add i64 %8, %conv8
  store i64 %add9, ptr @opt_len, align 8
  %9 = load i32, ptr %max_blindex, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compress_block(ptr noundef %ltree, ptr noundef %dtree) #0 {
entry:
  %ltree.addr = alloca ptr, align 8
  %dtree.addr = alloca ptr, align 8
  %dist = alloca i32, align 4
  %lc = alloca i32, align 4
  %lx = alloca i32, align 4
  %dx = alloca i32, align 4
  %fx = alloca i32, align 4
  %flag = alloca i8, align 1
  %code = alloca i32, align 4
  %extra = alloca i32, align 4
  store ptr %ltree, ptr %ltree.addr, align 8
  store ptr %dtree, ptr %dtree.addr, align 8
  store i32 0, ptr %lx, align 4
  store i32 0, ptr %dx, align 4
  store i32 0, ptr %fx, align 4
  store i8 0, ptr %flag, align 1
  %0 = load i32, ptr @last_lit, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end75

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32, ptr %lx, align 4
  %and = and i32 %1, 7
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %2 = load i32, ptr %fx, align 4
  %inc = add i32 %2, 1
  store i32 %inc, ptr %fx, align 4
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds [4096 x i8], ptr @flag_buf, i64 0, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  store i8 %3, ptr %flag, align 1
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  %4 = load i32, ptr %lx, align 4
  %inc3 = add i32 %4, 1
  store i32 %inc3, ptr %lx, align 4
  %idxprom4 = zext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom4
  %5 = load i8, ptr %arrayidx5, align 1
  %conv = zext i8 %5 to i32
  store i32 %conv, ptr %lc, align 4
  %6 = load i8, ptr %flag, align 1
  %conv6 = zext i8 %6 to i32
  %and7 = and i32 %conv6, 1
  %cmp8 = icmp eq i32 %and7, 0
  br i1 %cmp8, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.end
  %7 = load ptr, ptr %ltree.addr, align 8
  %8 = load i32, ptr %lc, align 4
  %idxprom11 = sext i32 %8 to i64
  %arrayidx12 = getelementptr inbounds %struct.ct_data, ptr %7, i64 %idxprom11
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx12, i32 0, i32 0
  %9 = load i16, ptr %fc, align 2
  %conv13 = zext i16 %9 to i32
  %10 = load ptr, ptr %ltree.addr, align 8
  %11 = load i32, ptr %lc, align 4
  %idxprom14 = sext i32 %11 to i64
  %arrayidx15 = getelementptr inbounds %struct.ct_data, ptr %10, i64 %idxprom14
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx15, i32 0, i32 1
  %12 = load i16, ptr %dl, align 2
  %conv16 = zext i16 %12 to i32
  call void @send_bits(i32 noundef %conv13, i32 noundef %conv16)
  br label %if.end69

if.else:                                          ; preds = %if.end
  %13 = load i32, ptr %lc, align 4
  %idxprom17 = sext i32 %13 to i64
  %arrayidx18 = getelementptr inbounds [256 x i8], ptr @length_code, i64 0, i64 %idxprom17
  %14 = load i8, ptr %arrayidx18, align 1
  %conv19 = zext i8 %14 to i32
  store i32 %conv19, ptr %code, align 4
  %15 = load ptr, ptr %ltree.addr, align 8
  %16 = load i32, ptr %code, align 4
  %add = add i32 %16, 256
  %add20 = add i32 %add, 1
  %idxprom21 = zext i32 %add20 to i64
  %arrayidx22 = getelementptr inbounds %struct.ct_data, ptr %15, i64 %idxprom21
  %fc23 = getelementptr inbounds %struct.ct_data, ptr %arrayidx22, i32 0, i32 0
  %17 = load i16, ptr %fc23, align 2
  %conv24 = zext i16 %17 to i32
  %18 = load ptr, ptr %ltree.addr, align 8
  %19 = load i32, ptr %code, align 4
  %add25 = add i32 %19, 256
  %add26 = add i32 %add25, 1
  %idxprom27 = zext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds %struct.ct_data, ptr %18, i64 %idxprom27
  %dl29 = getelementptr inbounds %struct.ct_data, ptr %arrayidx28, i32 0, i32 1
  %20 = load i16, ptr %dl29, align 2
  %conv30 = zext i16 %20 to i32
  call void @send_bits(i32 noundef %conv24, i32 noundef %conv30)
  %21 = load i32, ptr %code, align 4
  %idxprom31 = zext i32 %21 to i64
  %arrayidx32 = getelementptr inbounds [29 x i32], ptr @extra_lbits, i64 0, i64 %idxprom31
  %22 = load i32, ptr %arrayidx32, align 4
  store i32 %22, ptr %extra, align 4
  %23 = load i32, ptr %extra, align 4
  %cmp33 = icmp ne i32 %23, 0
  br i1 %cmp33, label %if.then35, label %if.end38

if.then35:                                        ; preds = %if.else
  %24 = load i32, ptr %code, align 4
  %idxprom36 = zext i32 %24 to i64
  %arrayidx37 = getelementptr inbounds [29 x i32], ptr @base_length, i64 0, i64 %idxprom36
  %25 = load i32, ptr %arrayidx37, align 4
  %26 = load i32, ptr %lc, align 4
  %sub = sub nsw i32 %26, %25
  store i32 %sub, ptr %lc, align 4
  %27 = load i32, ptr %lc, align 4
  %28 = load i32, ptr %extra, align 4
  call void @send_bits(i32 noundef %27, i32 noundef %28)
  br label %if.end38

if.end38:                                         ; preds = %if.then35, %if.else
  %29 = load i32, ptr %dx, align 4
  %inc39 = add i32 %29, 1
  store i32 %inc39, ptr %dx, align 4
  %idxprom40 = zext i32 %29 to i64
  %arrayidx41 = getelementptr inbounds [0 x i16], ptr @d_buf, i64 0, i64 %idxprom40
  %30 = load i16, ptr %arrayidx41, align 2
  %conv42 = zext i16 %30 to i32
  store i32 %conv42, ptr %dist, align 4
  %31 = load i32, ptr %dist, align 4
  %cmp43 = icmp ult i32 %31, 256
  br i1 %cmp43, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end38
  %32 = load i32, ptr %dist, align 4
  %idxprom45 = zext i32 %32 to i64
  %arrayidx46 = getelementptr inbounds [512 x i8], ptr @dist_code, i64 0, i64 %idxprom45
  %33 = load i8, ptr %arrayidx46, align 1
  %conv47 = zext i8 %33 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.end38
  %34 = load i32, ptr %dist, align 4
  %shr = lshr i32 %34, 7
  %add48 = add i32 256, %shr
  %idxprom49 = zext i32 %add48 to i64
  %arrayidx50 = getelementptr inbounds [512 x i8], ptr @dist_code, i64 0, i64 %idxprom49
  %35 = load i8, ptr %arrayidx50, align 1
  %conv51 = zext i8 %35 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv47, %cond.true ], [ %conv51, %cond.false ]
  store i32 %cond, ptr %code, align 4
  %36 = load ptr, ptr %dtree.addr, align 8
  %37 = load i32, ptr %code, align 4
  %idxprom52 = zext i32 %37 to i64
  %arrayidx53 = getelementptr inbounds %struct.ct_data, ptr %36, i64 %idxprom52
  %fc54 = getelementptr inbounds %struct.ct_data, ptr %arrayidx53, i32 0, i32 0
  %38 = load i16, ptr %fc54, align 2
  %conv55 = zext i16 %38 to i32
  %39 = load ptr, ptr %dtree.addr, align 8
  %40 = load i32, ptr %code, align 4
  %idxprom56 = zext i32 %40 to i64
  %arrayidx57 = getelementptr inbounds %struct.ct_data, ptr %39, i64 %idxprom56
  %dl58 = getelementptr inbounds %struct.ct_data, ptr %arrayidx57, i32 0, i32 1
  %41 = load i16, ptr %dl58, align 2
  %conv59 = zext i16 %41 to i32
  call void @send_bits(i32 noundef %conv55, i32 noundef %conv59)
  %42 = load i32, ptr %code, align 4
  %idxprom60 = zext i32 %42 to i64
  %arrayidx61 = getelementptr inbounds [30 x i32], ptr @extra_dbits, i64 0, i64 %idxprom60
  %43 = load i32, ptr %arrayidx61, align 4
  store i32 %43, ptr %extra, align 4
  %44 = load i32, ptr %extra, align 4
  %cmp62 = icmp ne i32 %44, 0
  br i1 %cmp62, label %if.then64, label %if.end68

if.then64:                                        ; preds = %cond.end
  %45 = load i32, ptr %code, align 4
  %idxprom65 = zext i32 %45 to i64
  %arrayidx66 = getelementptr inbounds [30 x i32], ptr @base_dist, i64 0, i64 %idxprom65
  %46 = load i32, ptr %arrayidx66, align 4
  %47 = load i32, ptr %dist, align 4
  %sub67 = sub i32 %47, %46
  store i32 %sub67, ptr %dist, align 4
  %48 = load i32, ptr %dist, align 4
  %49 = load i32, ptr %extra, align 4
  call void @send_bits(i32 noundef %48, i32 noundef %49)
  br label %if.end68

if.end68:                                         ; preds = %if.then64, %cond.end
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then10
  %50 = load i8, ptr %flag, align 1
  %conv70 = zext i8 %50 to i32
  %shr71 = ashr i32 %conv70, 1
  %conv72 = trunc i32 %shr71 to i8
  store i8 %conv72, ptr %flag, align 1
  br label %do.cond

do.cond:                                          ; preds = %if.end69
  %51 = load i32, ptr %lx, align 4
  %52 = load i32, ptr @last_lit, align 4
  %cmp73 = icmp ult i32 %51, %52
  br i1 %cmp73, label %do.body, label %do.end, !llvm.loop !59

do.end:                                           ; preds = %do.cond
  br label %if.end75

if.end75:                                         ; preds = %do.end, %entry
  %53 = load ptr, ptr %ltree.addr, align 8
  %arrayidx76 = getelementptr inbounds %struct.ct_data, ptr %53, i64 256
  %fc77 = getelementptr inbounds %struct.ct_data, ptr %arrayidx76, i32 0, i32 0
  %54 = load i16, ptr %fc77, align 2
  %conv78 = zext i16 %54 to i32
  %55 = load ptr, ptr %ltree.addr, align 8
  %arrayidx79 = getelementptr inbounds %struct.ct_data, ptr %55, i64 256
  %dl80 = getelementptr inbounds %struct.ct_data, ptr %arrayidx79, i32 0, i32 1
  %56 = load i16, ptr %dl80, align 2
  %conv81 = zext i16 %56 to i32
  call void @send_bits(i32 noundef %conv78, i32 noundef %conv81)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @send_all_trees(i32 noundef %lcodes, i32 noundef %dcodes, i32 noundef %blcodes) #0 {
entry:
  %lcodes.addr = alloca i32, align 4
  %dcodes.addr = alloca i32, align 4
  %blcodes.addr = alloca i32, align 4
  %rank = alloca i32, align 4
  store i32 %lcodes, ptr %lcodes.addr, align 4
  store i32 %dcodes, ptr %dcodes.addr, align 4
  store i32 %blcodes, ptr %blcodes.addr, align 4
  %0 = load i32, ptr %lcodes.addr, align 4
  %sub = sub nsw i32 %0, 257
  call void @send_bits(i32 noundef %sub, i32 noundef 5)
  %1 = load i32, ptr %dcodes.addr, align 4
  %sub1 = sub nsw i32 %1, 1
  call void @send_bits(i32 noundef %sub1, i32 noundef 5)
  %2 = load i32, ptr %blcodes.addr, align 4
  %sub2 = sub nsw i32 %2, 4
  call void @send_bits(i32 noundef %sub2, i32 noundef 4)
  store i32 0, ptr %rank, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, ptr %rank, align 4
  %4 = load i32, ptr %blcodes.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, ptr %rank, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [19 x i8], ptr @bl_order, i64 0, i64 %idxprom
  %6 = load i8, ptr %arrayidx, align 1
  %idxprom3 = zext i8 %6 to i64
  %arrayidx4 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom3
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx4, i32 0, i32 1
  %7 = load i16, ptr %dl, align 2
  %conv = zext i16 %7 to i32
  call void @send_bits(i32 noundef %conv, i32 noundef 3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %rank, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, ptr %rank, align 4
  br label %for.cond, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %9 = load i32, ptr %lcodes.addr, align 4
  %sub5 = sub nsw i32 %9, 1
  call void @send_tree(ptr noundef @dyn_ltree, i32 noundef %sub5)
  %10 = load i32, ptr %dcodes.addr, align 4
  %sub6 = sub nsw i32 %10, 1
  call void @send_tree(ptr noundef @dyn_dtree, i32 noundef %sub6)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @send_tree(ptr noundef %tree, i32 noundef %max_code) #0 {
entry:
  %tree.addr = alloca ptr, align 8
  %max_code.addr = alloca i32, align 4
  %n = alloca i32, align 4
  %prevlen = alloca i32, align 4
  %curlen = alloca i32, align 4
  %nextlen = alloca i32, align 4
  %count = alloca i32, align 4
  %max_count = alloca i32, align 4
  %min_count = alloca i32, align 4
  store ptr %tree, ptr %tree.addr, align 8
  store i32 %max_code, ptr %max_code.addr, align 4
  store i32 -1, ptr %prevlen, align 4
  %0 = load ptr, ptr %tree.addr, align 8
  %arrayidx = getelementptr inbounds %struct.ct_data, ptr %0, i64 0
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx, i32 0, i32 1
  %1 = load i16, ptr %dl, align 2
  %conv = zext i16 %1 to i32
  store i32 %conv, ptr %nextlen, align 4
  store i32 0, ptr %count, align 4
  store i32 7, ptr %max_count, align 4
  store i32 4, ptr %min_count, align 4
  %2 = load i32, ptr %nextlen, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 138, ptr %max_count, align 4
  store i32 3, ptr %min_count, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, ptr %n, align 4
  %4 = load i32, ptr %max_code.addr, align 4
  %cmp2 = icmp sle i32 %3, %4
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, ptr %nextlen, align 4
  store i32 %5, ptr %curlen, align 4
  %6 = load ptr, ptr %tree.addr, align 8
  %7 = load i32, ptr %n, align 4
  %add = add nsw i32 %7, 1
  %idxprom = sext i32 %add to i64
  %arrayidx4 = getelementptr inbounds %struct.ct_data, ptr %6, i64 %idxprom
  %dl5 = getelementptr inbounds %struct.ct_data, ptr %arrayidx4, i32 0, i32 1
  %8 = load i16, ptr %dl5, align 2
  %conv6 = zext i16 %8 to i32
  store i32 %conv6, ptr %nextlen, align 4
  %9 = load i32, ptr %count, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, ptr %count, align 4
  %10 = load i32, ptr %max_count, align 4
  %cmp7 = icmp slt i32 %inc, %10
  br i1 %cmp7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %11 = load i32, ptr %curlen, align 4
  %12 = load i32, ptr %nextlen, align 4
  %cmp9 = icmp eq i32 %11, %12
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true
  br label %for.inc

if.else:                                          ; preds = %land.lhs.true, %for.body
  %13 = load i32, ptr %count, align 4
  %14 = load i32, ptr %min_count, align 4
  %cmp12 = icmp slt i32 %13, %14
  br i1 %cmp12, label %if.then14, label %if.else24

if.then14:                                        ; preds = %if.else
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then14
  %15 = load i32, ptr %curlen, align 4
  %idxprom15 = sext i32 %15 to i64
  %arrayidx16 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom15
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx16, i32 0, i32 0
  %16 = load i16, ptr %fc, align 4
  %conv17 = zext i16 %16 to i32
  %17 = load i32, ptr %curlen, align 4
  %idxprom18 = sext i32 %17 to i64
  %arrayidx19 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom18
  %dl20 = getelementptr inbounds %struct.ct_data, ptr %arrayidx19, i32 0, i32 1
  %18 = load i16, ptr %dl20, align 2
  %conv21 = zext i16 %18 to i32
  call void @send_bits(i32 noundef %conv17, i32 noundef %conv21)
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %19 = load i32, ptr %count, align 4
  %dec = add nsw i32 %19, -1
  store i32 %dec, ptr %count, align 4
  %cmp22 = icmp ne i32 %dec, 0
  br i1 %cmp22, label %do.body, label %do.end, !llvm.loop !61

do.end:                                           ; preds = %do.cond
  br label %if.end56

if.else24:                                        ; preds = %if.else
  %20 = load i32, ptr %curlen, align 4
  %cmp25 = icmp ne i32 %20, 0
  br i1 %cmp25, label %if.then27, label %if.else43

if.then27:                                        ; preds = %if.else24
  %21 = load i32, ptr %curlen, align 4
  %22 = load i32, ptr %prevlen, align 4
  %cmp28 = icmp ne i32 %21, %22
  br i1 %cmp28, label %if.then30, label %if.end40

if.then30:                                        ; preds = %if.then27
  %23 = load i32, ptr %curlen, align 4
  %idxprom31 = sext i32 %23 to i64
  %arrayidx32 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom31
  %fc33 = getelementptr inbounds %struct.ct_data, ptr %arrayidx32, i32 0, i32 0
  %24 = load i16, ptr %fc33, align 4
  %conv34 = zext i16 %24 to i32
  %25 = load i32, ptr %curlen, align 4
  %idxprom35 = sext i32 %25 to i64
  %arrayidx36 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom35
  %dl37 = getelementptr inbounds %struct.ct_data, ptr %arrayidx36, i32 0, i32 1
  %26 = load i16, ptr %dl37, align 2
  %conv38 = zext i16 %26 to i32
  call void @send_bits(i32 noundef %conv34, i32 noundef %conv38)
  %27 = load i32, ptr %count, align 4
  %dec39 = add nsw i32 %27, -1
  store i32 %dec39, ptr %count, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then30, %if.then27
  %28 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 16), align 16
  %conv41 = zext i16 %28 to i32
  %29 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 16, i32 1), align 2
  %conv42 = zext i16 %29 to i32
  call void @send_bits(i32 noundef %conv41, i32 noundef %conv42)
  %30 = load i32, ptr %count, align 4
  %sub = sub nsw i32 %30, 3
  call void @send_bits(i32 noundef %sub, i32 noundef 2)
  br label %if.end55

if.else43:                                        ; preds = %if.else24
  %31 = load i32, ptr %count, align 4
  %cmp44 = icmp sle i32 %31, 10
  br i1 %cmp44, label %if.then46, label %if.else50

if.then46:                                        ; preds = %if.else43
  %32 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 17), align 4
  %conv47 = zext i16 %32 to i32
  %33 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 17, i32 1), align 2
  %conv48 = zext i16 %33 to i32
  call void @send_bits(i32 noundef %conv47, i32 noundef %conv48)
  %34 = load i32, ptr %count, align 4
  %sub49 = sub nsw i32 %34, 3
  call void @send_bits(i32 noundef %sub49, i32 noundef 3)
  br label %if.end54

if.else50:                                        ; preds = %if.else43
  %35 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 18), align 8
  %conv51 = zext i16 %35 to i32
  %36 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 18, i32 1), align 2
  %conv52 = zext i16 %36 to i32
  call void @send_bits(i32 noundef %conv51, i32 noundef %conv52)
  %37 = load i32, ptr %count, align 4
  %sub53 = sub nsw i32 %37, 11
  call void @send_bits(i32 noundef %sub53, i32 noundef 7)
  br label %if.end54

if.end54:                                         ; preds = %if.else50, %if.then46
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end40
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %do.end
  br label %if.end57

if.end57:                                         ; preds = %if.end56
  store i32 0, ptr %count, align 4
  %38 = load i32, ptr %curlen, align 4
  store i32 %38, ptr %prevlen, align 4
  %39 = load i32, ptr %nextlen, align 4
  %cmp58 = icmp eq i32 %39, 0
  br i1 %cmp58, label %if.then60, label %if.else61

if.then60:                                        ; preds = %if.end57
  store i32 138, ptr %max_count, align 4
  store i32 3, ptr %min_count, align 4
  br label %if.end67

if.else61:                                        ; preds = %if.end57
  %40 = load i32, ptr %curlen, align 4
  %41 = load i32, ptr %nextlen, align 4
  %cmp62 = icmp eq i32 %40, %41
  br i1 %cmp62, label %if.then64, label %if.else65

if.then64:                                        ; preds = %if.else61
  store i32 6, ptr %max_count, align 4
  store i32 3, ptr %min_count, align 4
  br label %if.end66

if.else65:                                        ; preds = %if.else61
  store i32 7, ptr %max_count, align 4
  store i32 4, ptr %min_count, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.else65, %if.then64
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %if.then60
  br label %for.inc

for.inc:                                          ; preds = %if.end67, %if.then11
  %42 = load i32, ptr %n, align 4
  %inc68 = add nsw i32 %42, 1
  store i32 %inc68, ptr %n, align 4
  br label %for.cond, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @scan_tree(ptr noundef %tree, i32 noundef %max_code) #0 {
entry:
  %tree.addr = alloca ptr, align 8
  %max_code.addr = alloca i32, align 4
  %n = alloca i32, align 4
  %prevlen = alloca i32, align 4
  %curlen = alloca i32, align 4
  %nextlen = alloca i32, align 4
  %count = alloca i32, align 4
  %max_count = alloca i32, align 4
  %min_count = alloca i32, align 4
  store ptr %tree, ptr %tree.addr, align 8
  store i32 %max_code, ptr %max_code.addr, align 4
  store i32 -1, ptr %prevlen, align 4
  %0 = load ptr, ptr %tree.addr, align 8
  %arrayidx = getelementptr inbounds %struct.ct_data, ptr %0, i64 0
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx, i32 0, i32 1
  %1 = load i16, ptr %dl, align 2
  %conv = zext i16 %1 to i32
  store i32 %conv, ptr %nextlen, align 4
  store i32 0, ptr %count, align 4
  store i32 7, ptr %max_count, align 4
  store i32 4, ptr %min_count, align 4
  %2 = load i32, ptr %nextlen, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 138, ptr %max_count, align 4
  store i32 3, ptr %min_count, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load ptr, ptr %tree.addr, align 8
  %4 = load i32, ptr %max_code.addr, align 4
  %add = add nsw i32 %4, 1
  %idxprom = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds %struct.ct_data, ptr %3, i64 %idxprom
  %dl3 = getelementptr inbounds %struct.ct_data, ptr %arrayidx2, i32 0, i32 1
  store i16 -1, ptr %dl3, align 2
  store i32 0, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i32, ptr %n, align 4
  %6 = load i32, ptr %max_code.addr, align 4
  %cmp4 = icmp sle i32 %5, %6
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %nextlen, align 4
  store i32 %7, ptr %curlen, align 4
  %8 = load ptr, ptr %tree.addr, align 8
  %9 = load i32, ptr %n, align 4
  %add6 = add nsw i32 %9, 1
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds %struct.ct_data, ptr %8, i64 %idxprom7
  %dl9 = getelementptr inbounds %struct.ct_data, ptr %arrayidx8, i32 0, i32 1
  %10 = load i16, ptr %dl9, align 2
  %conv10 = zext i16 %10 to i32
  store i32 %conv10, ptr %nextlen, align 4
  %11 = load i32, ptr %count, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, ptr %count, align 4
  %12 = load i32, ptr %max_count, align 4
  %cmp11 = icmp slt i32 %inc, %12
  br i1 %cmp11, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %13 = load i32, ptr %curlen, align 4
  %14 = load i32, ptr %nextlen, align 4
  %cmp13 = icmp eq i32 %13, %14
  br i1 %cmp13, label %if.then15, label %if.else

if.then15:                                        ; preds = %land.lhs.true
  br label %for.inc

if.else:                                          ; preds = %land.lhs.true, %for.body
  %15 = load i32, ptr %count, align 4
  %16 = load i32, ptr %min_count, align 4
  %cmp16 = icmp slt i32 %15, %16
  br i1 %cmp16, label %if.then18, label %if.else24

if.then18:                                        ; preds = %if.else
  %17 = load i32, ptr %count, align 4
  %18 = load i32, ptr %curlen, align 4
  %idxprom19 = sext i32 %18 to i64
  %arrayidx20 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom19
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx20, i32 0, i32 0
  %19 = load i16, ptr %fc, align 4
  %conv21 = zext i16 %19 to i32
  %add22 = add nsw i32 %conv21, %17
  %conv23 = trunc i32 %add22 to i16
  store i16 %conv23, ptr %fc, align 4
  br label %if.end46

if.else24:                                        ; preds = %if.else
  %20 = load i32, ptr %curlen, align 4
  %cmp25 = icmp ne i32 %20, 0
  br i1 %cmp25, label %if.then27, label %if.else37

if.then27:                                        ; preds = %if.else24
  %21 = load i32, ptr %curlen, align 4
  %22 = load i32, ptr %prevlen, align 4
  %cmp28 = icmp ne i32 %21, %22
  br i1 %cmp28, label %if.then30, label %if.end35

if.then30:                                        ; preds = %if.then27
  %23 = load i32, ptr %curlen, align 4
  %idxprom31 = sext i32 %23 to i64
  %arrayidx32 = getelementptr inbounds [39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 %idxprom31
  %fc33 = getelementptr inbounds %struct.ct_data, ptr %arrayidx32, i32 0, i32 0
  %24 = load i16, ptr %fc33, align 4
  %inc34 = add i16 %24, 1
  store i16 %inc34, ptr %fc33, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then30, %if.then27
  %25 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 16), align 16
  %inc36 = add i16 %25, 1
  store i16 %inc36, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 16), align 16
  br label %if.end45

if.else37:                                        ; preds = %if.else24
  %26 = load i32, ptr %count, align 4
  %cmp38 = icmp sle i32 %26, 10
  br i1 %cmp38, label %if.then40, label %if.else42

if.then40:                                        ; preds = %if.else37
  %27 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 17), align 4
  %inc41 = add i16 %27, 1
  store i16 %inc41, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 17), align 4
  br label %if.end44

if.else42:                                        ; preds = %if.else37
  %28 = load i16, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 18), align 8
  %inc43 = add i16 %28, 1
  store i16 %inc43, ptr getelementptr inbounds ([39 x %struct.ct_data], ptr @bl_tree, i64 0, i64 18), align 8
  br label %if.end44

if.end44:                                         ; preds = %if.else42, %if.then40
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end35
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then18
  br label %if.end47

if.end47:                                         ; preds = %if.end46
  store i32 0, ptr %count, align 4
  %29 = load i32, ptr %curlen, align 4
  store i32 %29, ptr %prevlen, align 4
  %30 = load i32, ptr %nextlen, align 4
  %cmp48 = icmp eq i32 %30, 0
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.end47
  store i32 138, ptr %max_count, align 4
  store i32 3, ptr %min_count, align 4
  br label %if.end57

if.else51:                                        ; preds = %if.end47
  %31 = load i32, ptr %curlen, align 4
  %32 = load i32, ptr %nextlen, align 4
  %cmp52 = icmp eq i32 %31, %32
  br i1 %cmp52, label %if.then54, label %if.else55

if.then54:                                        ; preds = %if.else51
  store i32 6, ptr %max_count, align 4
  store i32 3, ptr %min_count, align 4
  br label %if.end56

if.else55:                                        ; preds = %if.else51
  store i32 7, ptr %max_count, align 4
  store i32 4, ptr %min_count, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.else55, %if.then54
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then50
  br label %for.inc

for.inc:                                          ; preds = %if.end57, %if.then15
  %33 = load i32, ptr %n, align 4
  %inc58 = add nsw i32 %33, 1
  store i32 %inc58, ptr %n, align 4
  br label %for.cond, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @pqdownheap(ptr noundef %tree, i32 noundef %k) #0 {
entry:
  %tree.addr = alloca ptr, align 8
  %k.addr = alloca i32, align 4
  %v = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %tree, ptr %tree.addr, align 8
  store i32 %k, ptr %k.addr, align 4
  %0 = load i32, ptr %k.addr, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom
  %1 = load i32, ptr %arrayidx, align 4
  store i32 %1, ptr %v, align 4
  %2 = load i32, ptr %k.addr, align 4
  %shl = shl i32 %2, 1
  store i32 %shl, ptr %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end80, %entry
  %3 = load i32, ptr %j, align 4
  %4 = load i32, ptr @heap_len, align 4
  %cmp = icmp sle i32 %3, %4
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i32, ptr %j, align 4
  %6 = load i32, ptr @heap_len, align 4
  %cmp1 = icmp slt i32 %5, %6
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %7 = load ptr, ptr %tree.addr, align 8
  %8 = load i32, ptr %j, align 4
  %add = add nsw i32 %8, 1
  %idxprom2 = sext i32 %add to i64
  %arrayidx3 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom2
  %9 = load i32, ptr %arrayidx3, align 4
  %idxprom4 = sext i32 %9 to i64
  %arrayidx5 = getelementptr inbounds %struct.ct_data, ptr %7, i64 %idxprom4
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx5, i32 0, i32 0
  %10 = load i16, ptr %fc, align 2
  %conv = zext i16 %10 to i32
  %11 = load ptr, ptr %tree.addr, align 8
  %12 = load i32, ptr %j, align 4
  %idxprom6 = sext i32 %12 to i64
  %arrayidx7 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom6
  %13 = load i32, ptr %arrayidx7, align 4
  %idxprom8 = sext i32 %13 to i64
  %arrayidx9 = getelementptr inbounds %struct.ct_data, ptr %11, i64 %idxprom8
  %fc10 = getelementptr inbounds %struct.ct_data, ptr %arrayidx9, i32 0, i32 0
  %14 = load i16, ptr %fc10, align 2
  %conv11 = zext i16 %14 to i32
  %cmp12 = icmp slt i32 %conv, %conv11
  br i1 %cmp12, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %15 = load ptr, ptr %tree.addr, align 8
  %16 = load i32, ptr %j, align 4
  %add14 = add nsw i32 %16, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom15
  %17 = load i32, ptr %arrayidx16, align 4
  %idxprom17 = sext i32 %17 to i64
  %arrayidx18 = getelementptr inbounds %struct.ct_data, ptr %15, i64 %idxprom17
  %fc19 = getelementptr inbounds %struct.ct_data, ptr %arrayidx18, i32 0, i32 0
  %18 = load i16, ptr %fc19, align 2
  %conv20 = zext i16 %18 to i32
  %19 = load ptr, ptr %tree.addr, align 8
  %20 = load i32, ptr %j, align 4
  %idxprom21 = sext i32 %20 to i64
  %arrayidx22 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom21
  %21 = load i32, ptr %arrayidx22, align 4
  %idxprom23 = sext i32 %21 to i64
  %arrayidx24 = getelementptr inbounds %struct.ct_data, ptr %19, i64 %idxprom23
  %fc25 = getelementptr inbounds %struct.ct_data, ptr %arrayidx24, i32 0, i32 0
  %22 = load i16, ptr %fc25, align 2
  %conv26 = zext i16 %22 to i32
  %cmp27 = icmp eq i32 %conv20, %conv26
  br i1 %cmp27, label %land.lhs.true29, label %if.end

land.lhs.true29:                                  ; preds = %lor.lhs.false
  %23 = load i32, ptr %j, align 4
  %add30 = add nsw i32 %23, 1
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom31
  %24 = load i32, ptr %arrayidx32, align 4
  %idxprom33 = sext i32 %24 to i64
  %arrayidx34 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom33
  %25 = load i8, ptr %arrayidx34, align 1
  %conv35 = zext i8 %25 to i32
  %26 = load i32, ptr %j, align 4
  %idxprom36 = sext i32 %26 to i64
  %arrayidx37 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom36
  %27 = load i32, ptr %arrayidx37, align 4
  %idxprom38 = sext i32 %27 to i64
  %arrayidx39 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom38
  %28 = load i8, ptr %arrayidx39, align 1
  %conv40 = zext i8 %28 to i32
  %cmp41 = icmp sle i32 %conv35, %conv40
  br i1 %cmp41, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true29, %land.lhs.true
  %29 = load i32, ptr %j, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, ptr %j, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true29, %lor.lhs.false, %while.body
  %30 = load ptr, ptr %tree.addr, align 8
  %31 = load i32, ptr %v, align 4
  %idxprom43 = sext i32 %31 to i64
  %arrayidx44 = getelementptr inbounds %struct.ct_data, ptr %30, i64 %idxprom43
  %fc45 = getelementptr inbounds %struct.ct_data, ptr %arrayidx44, i32 0, i32 0
  %32 = load i16, ptr %fc45, align 2
  %conv46 = zext i16 %32 to i32
  %33 = load ptr, ptr %tree.addr, align 8
  %34 = load i32, ptr %j, align 4
  %idxprom47 = sext i32 %34 to i64
  %arrayidx48 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom47
  %35 = load i32, ptr %arrayidx48, align 4
  %idxprom49 = sext i32 %35 to i64
  %arrayidx50 = getelementptr inbounds %struct.ct_data, ptr %33, i64 %idxprom49
  %fc51 = getelementptr inbounds %struct.ct_data, ptr %arrayidx50, i32 0, i32 0
  %36 = load i16, ptr %fc51, align 2
  %conv52 = zext i16 %36 to i32
  %cmp53 = icmp slt i32 %conv46, %conv52
  br i1 %cmp53, label %if.then79, label %lor.lhs.false55

lor.lhs.false55:                                  ; preds = %if.end
  %37 = load ptr, ptr %tree.addr, align 8
  %38 = load i32, ptr %v, align 4
  %idxprom56 = sext i32 %38 to i64
  %arrayidx57 = getelementptr inbounds %struct.ct_data, ptr %37, i64 %idxprom56
  %fc58 = getelementptr inbounds %struct.ct_data, ptr %arrayidx57, i32 0, i32 0
  %39 = load i16, ptr %fc58, align 2
  %conv59 = zext i16 %39 to i32
  %40 = load ptr, ptr %tree.addr, align 8
  %41 = load i32, ptr %j, align 4
  %idxprom60 = sext i32 %41 to i64
  %arrayidx61 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom60
  %42 = load i32, ptr %arrayidx61, align 4
  %idxprom62 = sext i32 %42 to i64
  %arrayidx63 = getelementptr inbounds %struct.ct_data, ptr %40, i64 %idxprom62
  %fc64 = getelementptr inbounds %struct.ct_data, ptr %arrayidx63, i32 0, i32 0
  %43 = load i16, ptr %fc64, align 2
  %conv65 = zext i16 %43 to i32
  %cmp66 = icmp eq i32 %conv59, %conv65
  br i1 %cmp66, label %land.lhs.true68, label %if.end80

land.lhs.true68:                                  ; preds = %lor.lhs.false55
  %44 = load i32, ptr %v, align 4
  %idxprom69 = sext i32 %44 to i64
  %arrayidx70 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom69
  %45 = load i8, ptr %arrayidx70, align 1
  %conv71 = zext i8 %45 to i32
  %46 = load i32, ptr %j, align 4
  %idxprom72 = sext i32 %46 to i64
  %arrayidx73 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom72
  %47 = load i32, ptr %arrayidx73, align 4
  %idxprom74 = sext i32 %47 to i64
  %arrayidx75 = getelementptr inbounds [573 x i8], ptr @depth, i64 0, i64 %idxprom74
  %48 = load i8, ptr %arrayidx75, align 1
  %conv76 = zext i8 %48 to i32
  %cmp77 = icmp sle i32 %conv71, %conv76
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %land.lhs.true68, %if.end
  br label %while.end

if.end80:                                         ; preds = %land.lhs.true68, %lor.lhs.false55
  %49 = load i32, ptr %j, align 4
  %idxprom81 = sext i32 %49 to i64
  %arrayidx82 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom81
  %50 = load i32, ptr %arrayidx82, align 4
  %51 = load i32, ptr %k.addr, align 4
  %idxprom83 = sext i32 %51 to i64
  %arrayidx84 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom83
  store i32 %50, ptr %arrayidx84, align 4
  %52 = load i32, ptr %j, align 4
  store i32 %52, ptr %k.addr, align 4
  %53 = load i32, ptr %j, align 4
  %shl85 = shl i32 %53, 1
  store i32 %shl85, ptr %j, align 4
  br label %while.cond, !llvm.loop !64

while.end:                                        ; preds = %if.then79, %while.cond
  %54 = load i32, ptr %v, align 4
  %55 = load i32, ptr %k.addr, align 4
  %idxprom86 = sext i32 %55 to i64
  %arrayidx87 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom86
  store i32 %54, ptr %arrayidx87, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @gen_bitlen(ptr noundef %desc) #0 {
entry:
  %desc.addr = alloca ptr, align 8
  %tree = alloca ptr, align 8
  %extra = alloca ptr, align 8
  %base = alloca i32, align 4
  %max_code = alloca i32, align 4
  %max_length = alloca i32, align 4
  %stree = alloca ptr, align 8
  %h = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %bits = alloca i32, align 4
  %xbits = alloca i32, align 4
  %f = alloca i16, align 2
  %overflow = alloca i32, align 4
  store ptr %desc, ptr %desc.addr, align 8
  %0 = load ptr, ptr %desc.addr, align 8
  %dyn_tree = getelementptr inbounds %struct.tree_desc, ptr %0, i32 0, i32 0
  %1 = load ptr, ptr %dyn_tree, align 8
  store ptr %1, ptr %tree, align 8
  %2 = load ptr, ptr %desc.addr, align 8
  %extra_bits = getelementptr inbounds %struct.tree_desc, ptr %2, i32 0, i32 2
  %3 = load ptr, ptr %extra_bits, align 8
  store ptr %3, ptr %extra, align 8
  %4 = load ptr, ptr %desc.addr, align 8
  %extra_base = getelementptr inbounds %struct.tree_desc, ptr %4, i32 0, i32 3
  %5 = load i32, ptr %extra_base, align 8
  store i32 %5, ptr %base, align 4
  %6 = load ptr, ptr %desc.addr, align 8
  %max_code1 = getelementptr inbounds %struct.tree_desc, ptr %6, i32 0, i32 6
  %7 = load i32, ptr %max_code1, align 4
  store i32 %7, ptr %max_code, align 4
  %8 = load ptr, ptr %desc.addr, align 8
  %max_length2 = getelementptr inbounds %struct.tree_desc, ptr %8, i32 0, i32 5
  %9 = load i32, ptr %max_length2, align 8
  store i32 %9, ptr %max_length, align 4
  %10 = load ptr, ptr %desc.addr, align 8
  %static_tree = getelementptr inbounds %struct.tree_desc, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %static_tree, align 8
  store ptr %11, ptr %stree, align 8
  store i32 0, ptr %overflow, align 4
  store i32 0, ptr %bits, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %bits, align 4
  %cmp = icmp sle i32 %12, 15
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %bits, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom
  store i16 0, ptr %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %bits, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %bits, align 4
  br label %for.cond, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %15 = load ptr, ptr %tree, align 8
  %16 = load i32, ptr @heap_max, align 4
  %idxprom3 = sext i32 %16 to i64
  %arrayidx4 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom3
  %17 = load i32, ptr %arrayidx4, align 4
  %idxprom5 = sext i32 %17 to i64
  %arrayidx6 = getelementptr inbounds %struct.ct_data, ptr %15, i64 %idxprom5
  %dl = getelementptr inbounds %struct.ct_data, ptr %arrayidx6, i32 0, i32 1
  store i16 0, ptr %dl, align 2
  %18 = load i32, ptr @heap_max, align 4
  %add = add nsw i32 %18, 1
  store i32 %add, ptr %h, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc56, %for.end
  %19 = load i32, ptr %h, align 4
  %cmp8 = icmp slt i32 %19, 573
  br i1 %cmp8, label %for.body9, label %for.end58

for.body9:                                        ; preds = %for.cond7
  %20 = load i32, ptr %h, align 4
  %idxprom10 = sext i32 %20 to i64
  %arrayidx11 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom10
  %21 = load i32, ptr %arrayidx11, align 4
  store i32 %21, ptr %n, align 4
  %22 = load ptr, ptr %tree, align 8
  %23 = load ptr, ptr %tree, align 8
  %24 = load i32, ptr %n, align 4
  %idxprom12 = sext i32 %24 to i64
  %arrayidx13 = getelementptr inbounds %struct.ct_data, ptr %23, i64 %idxprom12
  %dl14 = getelementptr inbounds %struct.ct_data, ptr %arrayidx13, i32 0, i32 1
  %25 = load i16, ptr %dl14, align 2
  %idxprom15 = zext i16 %25 to i64
  %arrayidx16 = getelementptr inbounds %struct.ct_data, ptr %22, i64 %idxprom15
  %dl17 = getelementptr inbounds %struct.ct_data, ptr %arrayidx16, i32 0, i32 1
  %26 = load i16, ptr %dl17, align 2
  %conv = zext i16 %26 to i32
  %add18 = add nsw i32 %conv, 1
  store i32 %add18, ptr %bits, align 4
  %27 = load i32, ptr %bits, align 4
  %28 = load i32, ptr %max_length, align 4
  %cmp19 = icmp sgt i32 %27, %28
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %for.body9
  %29 = load i32, ptr %max_length, align 4
  store i32 %29, ptr %bits, align 4
  %30 = load i32, ptr %overflow, align 4
  %inc21 = add nsw i32 %30, 1
  store i32 %inc21, ptr %overflow, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body9
  %31 = load i32, ptr %bits, align 4
  %conv22 = trunc i32 %31 to i16
  %32 = load ptr, ptr %tree, align 8
  %33 = load i32, ptr %n, align 4
  %idxprom23 = sext i32 %33 to i64
  %arrayidx24 = getelementptr inbounds %struct.ct_data, ptr %32, i64 %idxprom23
  %dl25 = getelementptr inbounds %struct.ct_data, ptr %arrayidx24, i32 0, i32 1
  store i16 %conv22, ptr %dl25, align 2
  %34 = load i32, ptr %n, align 4
  %35 = load i32, ptr %max_code, align 4
  %cmp26 = icmp sgt i32 %34, %35
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end
  br label %for.inc56

if.end29:                                         ; preds = %if.end
  %36 = load i32, ptr %bits, align 4
  %idxprom30 = sext i32 %36 to i64
  %arrayidx31 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom30
  %37 = load i16, ptr %arrayidx31, align 2
  %inc32 = add i16 %37, 1
  store i16 %inc32, ptr %arrayidx31, align 2
  store i32 0, ptr %xbits, align 4
  %38 = load i32, ptr %n, align 4
  %39 = load i32, ptr %base, align 4
  %cmp33 = icmp sge i32 %38, %39
  br i1 %cmp33, label %if.then35, label %if.end38

if.then35:                                        ; preds = %if.end29
  %40 = load ptr, ptr %extra, align 8
  %41 = load i32, ptr %n, align 4
  %42 = load i32, ptr %base, align 4
  %sub = sub nsw i32 %41, %42
  %idxprom36 = sext i32 %sub to i64
  %arrayidx37 = getelementptr inbounds i32, ptr %40, i64 %idxprom36
  %43 = load i32, ptr %arrayidx37, align 4
  store i32 %43, ptr %xbits, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then35, %if.end29
  %44 = load ptr, ptr %tree, align 8
  %45 = load i32, ptr %n, align 4
  %idxprom39 = sext i32 %45 to i64
  %arrayidx40 = getelementptr inbounds %struct.ct_data, ptr %44, i64 %idxprom39
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx40, i32 0, i32 0
  %46 = load i16, ptr %fc, align 2
  store i16 %46, ptr %f, align 2
  %47 = load i16, ptr %f, align 2
  %conv41 = zext i16 %47 to i64
  %48 = load i32, ptr %bits, align 4
  %49 = load i32, ptr %xbits, align 4
  %add42 = add nsw i32 %48, %49
  %conv43 = sext i32 %add42 to i64
  %mul = mul i64 %conv41, %conv43
  %50 = load i64, ptr @opt_len, align 8
  %add44 = add i64 %50, %mul
  store i64 %add44, ptr @opt_len, align 8
  %51 = load ptr, ptr %stree, align 8
  %tobool = icmp ne ptr %51, null
  br i1 %tobool, label %if.then45, label %if.end55

if.then45:                                        ; preds = %if.end38
  %52 = load i16, ptr %f, align 2
  %conv46 = zext i16 %52 to i64
  %53 = load ptr, ptr %stree, align 8
  %54 = load i32, ptr %n, align 4
  %idxprom47 = sext i32 %54 to i64
  %arrayidx48 = getelementptr inbounds %struct.ct_data, ptr %53, i64 %idxprom47
  %dl49 = getelementptr inbounds %struct.ct_data, ptr %arrayidx48, i32 0, i32 1
  %55 = load i16, ptr %dl49, align 2
  %conv50 = zext i16 %55 to i32
  %56 = load i32, ptr %xbits, align 4
  %add51 = add nsw i32 %conv50, %56
  %conv52 = sext i32 %add51 to i64
  %mul53 = mul i64 %conv46, %conv52
  %57 = load i64, ptr @static_len, align 8
  %add54 = add i64 %57, %mul53
  store i64 %add54, ptr @static_len, align 8
  br label %if.end55

if.end55:                                         ; preds = %if.then45, %if.end38
  br label %for.inc56

for.inc56:                                        ; preds = %if.end55, %if.then28
  %58 = load i32, ptr %h, align 4
  %inc57 = add nsw i32 %58, 1
  store i32 %inc57, ptr %h, align 4
  br label %for.cond7, !llvm.loop !66

for.end58:                                        ; preds = %for.cond7
  %59 = load i32, ptr %overflow, align 4
  %cmp59 = icmp eq i32 %59, 0
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %for.end58
  br label %for.end130

if.end62:                                         ; preds = %for.end58
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end62
  %60 = load i32, ptr %max_length, align 4
  %sub63 = sub nsw i32 %60, 1
  store i32 %sub63, ptr %bits, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.body
  %61 = load i32, ptr %bits, align 4
  %idxprom64 = sext i32 %61 to i64
  %arrayidx65 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom64
  %62 = load i16, ptr %arrayidx65, align 2
  %conv66 = zext i16 %62 to i32
  %cmp67 = icmp eq i32 %conv66, 0
  br i1 %cmp67, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %63 = load i32, ptr %bits, align 4
  %dec = add nsw i32 %63, -1
  store i32 %dec, ptr %bits, align 4
  br label %while.cond, !llvm.loop !67

while.end:                                        ; preds = %while.cond
  %64 = load i32, ptr %bits, align 4
  %idxprom69 = sext i32 %64 to i64
  %arrayidx70 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom69
  %65 = load i16, ptr %arrayidx70, align 2
  %dec71 = add i16 %65, -1
  store i16 %dec71, ptr %arrayidx70, align 2
  %66 = load i32, ptr %bits, align 4
  %add72 = add nsw i32 %66, 1
  %idxprom73 = sext i32 %add72 to i64
  %arrayidx74 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom73
  %67 = load i16, ptr %arrayidx74, align 2
  %conv75 = zext i16 %67 to i32
  %add76 = add nsw i32 %conv75, 2
  %conv77 = trunc i32 %add76 to i16
  store i16 %conv77, ptr %arrayidx74, align 2
  %68 = load i32, ptr %max_length, align 4
  %idxprom78 = sext i32 %68 to i64
  %arrayidx79 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom78
  %69 = load i16, ptr %arrayidx79, align 2
  %dec80 = add i16 %69, -1
  store i16 %dec80, ptr %arrayidx79, align 2
  %70 = load i32, ptr %overflow, align 4
  %sub81 = sub nsw i32 %70, 2
  store i32 %sub81, ptr %overflow, align 4
  br label %do.cond

do.cond:                                          ; preds = %while.end
  %71 = load i32, ptr %overflow, align 4
  %cmp82 = icmp sgt i32 %71, 0
  br i1 %cmp82, label %do.body, label %do.end, !llvm.loop !68

do.end:                                           ; preds = %do.cond
  %72 = load i32, ptr %max_length, align 4
  store i32 %72, ptr %bits, align 4
  br label %for.cond84

for.cond84:                                       ; preds = %for.inc128, %do.end
  %73 = load i32, ptr %bits, align 4
  %cmp85 = icmp ne i32 %73, 0
  br i1 %cmp85, label %for.body87, label %for.end130

for.body87:                                       ; preds = %for.cond84
  %74 = load i32, ptr %bits, align 4
  %idxprom88 = sext i32 %74 to i64
  %arrayidx89 = getelementptr inbounds [16 x i16], ptr @bl_count, i64 0, i64 %idxprom88
  %75 = load i16, ptr %arrayidx89, align 2
  %conv90 = zext i16 %75 to i32
  store i32 %conv90, ptr %n, align 4
  br label %while.cond91

while.cond91:                                     ; preds = %if.end125, %if.then100, %for.body87
  %76 = load i32, ptr %n, align 4
  %cmp92 = icmp ne i32 %76, 0
  br i1 %cmp92, label %while.body94, label %while.end127

while.body94:                                     ; preds = %while.cond91
  %77 = load i32, ptr %h, align 4
  %dec95 = add nsw i32 %77, -1
  store i32 %dec95, ptr %h, align 4
  %idxprom96 = sext i32 %dec95 to i64
  %arrayidx97 = getelementptr inbounds [573 x i32], ptr @heap, i64 0, i64 %idxprom96
  %78 = load i32, ptr %arrayidx97, align 4
  store i32 %78, ptr %m, align 4
  %79 = load i32, ptr %m, align 4
  %80 = load i32, ptr %max_code, align 4
  %cmp98 = icmp sgt i32 %79, %80
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %while.body94
  br label %while.cond91, !llvm.loop !69

if.end101:                                        ; preds = %while.body94
  %81 = load ptr, ptr %tree, align 8
  %82 = load i32, ptr %m, align 4
  %idxprom102 = sext i32 %82 to i64
  %arrayidx103 = getelementptr inbounds %struct.ct_data, ptr %81, i64 %idxprom102
  %dl104 = getelementptr inbounds %struct.ct_data, ptr %arrayidx103, i32 0, i32 1
  %83 = load i16, ptr %dl104, align 2
  %conv105 = zext i16 %83 to i32
  %84 = load i32, ptr %bits, align 4
  %cmp106 = icmp ne i32 %conv105, %84
  br i1 %cmp106, label %if.then108, label %if.end125

if.then108:                                       ; preds = %if.end101
  %85 = load i32, ptr %bits, align 4
  %conv109 = sext i32 %85 to i64
  %86 = load ptr, ptr %tree, align 8
  %87 = load i32, ptr %m, align 4
  %idxprom110 = sext i32 %87 to i64
  %arrayidx111 = getelementptr inbounds %struct.ct_data, ptr %86, i64 %idxprom110
  %dl112 = getelementptr inbounds %struct.ct_data, ptr %arrayidx111, i32 0, i32 1
  %88 = load i16, ptr %dl112, align 2
  %conv113 = zext i16 %88 to i64
  %sub114 = sub nsw i64 %conv109, %conv113
  %89 = load ptr, ptr %tree, align 8
  %90 = load i32, ptr %m, align 4
  %idxprom115 = sext i32 %90 to i64
  %arrayidx116 = getelementptr inbounds %struct.ct_data, ptr %89, i64 %idxprom115
  %fc117 = getelementptr inbounds %struct.ct_data, ptr %arrayidx116, i32 0, i32 0
  %91 = load i16, ptr %fc117, align 2
  %conv118 = zext i16 %91 to i64
  %mul119 = mul nsw i64 %sub114, %conv118
  %92 = load i64, ptr @opt_len, align 8
  %add120 = add i64 %92, %mul119
  store i64 %add120, ptr @opt_len, align 8
  %93 = load i32, ptr %bits, align 4
  %conv121 = trunc i32 %93 to i16
  %94 = load ptr, ptr %tree, align 8
  %95 = load i32, ptr %m, align 4
  %idxprom122 = sext i32 %95 to i64
  %arrayidx123 = getelementptr inbounds %struct.ct_data, ptr %94, i64 %idxprom122
  %dl124 = getelementptr inbounds %struct.ct_data, ptr %arrayidx123, i32 0, i32 1
  store i16 %conv121, ptr %dl124, align 2
  br label %if.end125

if.end125:                                        ; preds = %if.then108, %if.end101
  %96 = load i32, ptr %n, align 4
  %dec126 = add nsw i32 %96, -1
  store i32 %dec126, ptr %n, align 4
  br label %while.cond91, !llvm.loop !69

while.end127:                                     ; preds = %while.cond91
  br label %for.inc128

for.inc128:                                       ; preds = %while.end127
  %97 = load i32, ptr %bits, align 4
  %dec129 = add nsw i32 %97, -1
  store i32 %dec129, ptr %bits, align 4
  br label %for.cond84, !llvm.loop !70

for.end130:                                       ; preds = %if.then61, %for.cond84
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ct_tally(i32 noundef %dist, i32 noundef %lc) #0 {
entry:
  %retval = alloca i32, align 4
  %dist.addr = alloca i32, align 4
  %lc.addr = alloca i32, align 4
  %out_length = alloca i64, align 8
  %in_length = alloca i64, align 8
  %dcode = alloca i32, align 4
  store i32 %dist, ptr %dist.addr, align 4
  store i32 %lc, ptr %lc.addr, align 4
  %0 = load i32, ptr %lc.addr, align 4
  %conv = trunc i32 %0 to i8
  %1 = load i32, ptr @last_lit, align 4
  %inc = add i32 %1, 1
  store i32 %inc, ptr @last_lit, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  store i8 %conv, ptr %arrayidx, align 1
  %2 = load i32, ptr %dist.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, ptr %lc.addr, align 4
  %idxprom2 = sext i32 %3 to i64
  %arrayidx3 = getelementptr inbounds [573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 %idxprom2
  %fc = getelementptr inbounds %struct.ct_data, ptr %arrayidx3, i32 0, i32 0
  %4 = load i16, ptr %fc, align 4
  %inc4 = add i16 %4, 1
  store i16 %inc4, ptr %fc, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load i32, ptr %dist.addr, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, ptr %dist.addr, align 4
  %6 = load i32, ptr %lc.addr, align 4
  %idxprom5 = sext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds [256 x i8], ptr @length_code, i64 0, i64 %idxprom5
  %7 = load i8, ptr %arrayidx6, align 1
  %conv7 = zext i8 %7 to i32
  %add = add nsw i32 %conv7, 256
  %add8 = add nsw i32 %add, 1
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds [573 x %struct.ct_data], ptr @dyn_ltree, i64 0, i64 %idxprom9
  %fc11 = getelementptr inbounds %struct.ct_data, ptr %arrayidx10, i32 0, i32 0
  %8 = load i16, ptr %fc11, align 4
  %inc12 = add i16 %8, 1
  store i16 %inc12, ptr %fc11, align 4
  %9 = load i32, ptr %dist.addr, align 4
  %cmp13 = icmp slt i32 %9, 256
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %10 = load i32, ptr %dist.addr, align 4
  %idxprom15 = sext i32 %10 to i64
  %arrayidx16 = getelementptr inbounds [512 x i8], ptr @dist_code, i64 0, i64 %idxprom15
  %11 = load i8, ptr %arrayidx16, align 1
  %conv17 = zext i8 %11 to i32
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %12 = load i32, ptr %dist.addr, align 4
  %shr = ashr i32 %12, 7
  %add18 = add nsw i32 256, %shr
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds [512 x i8], ptr @dist_code, i64 0, i64 %idxprom19
  %13 = load i8, ptr %arrayidx20, align 1
  %conv21 = zext i8 %13 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv17, %cond.true ], [ %conv21, %cond.false ]
  %idxprom22 = sext i32 %cond to i64
  %arrayidx23 = getelementptr inbounds [61 x %struct.ct_data], ptr @dyn_dtree, i64 0, i64 %idxprom22
  %fc24 = getelementptr inbounds %struct.ct_data, ptr %arrayidx23, i32 0, i32 0
  %14 = load i16, ptr %fc24, align 4
  %inc25 = add i16 %14, 1
  store i16 %inc25, ptr %fc24, align 4
  %15 = load i32, ptr %dist.addr, align 4
  %conv26 = trunc i32 %15 to i16
  %16 = load i32, ptr @last_dist, align 4
  %inc27 = add i32 %16, 1
  store i32 %inc27, ptr @last_dist, align 4
  %idxprom28 = zext i32 %16 to i64
  %arrayidx29 = getelementptr inbounds [0 x i16], ptr @d_buf, i64 0, i64 %idxprom28
  store i16 %conv26, ptr %arrayidx29, align 2
  %17 = load i8, ptr @flag_bit, align 1
  %conv30 = zext i8 %17 to i32
  %18 = load i8, ptr @flags, align 1
  %conv31 = zext i8 %18 to i32
  %or = or i32 %conv31, %conv30
  %conv32 = trunc i32 %or to i8
  store i8 %conv32, ptr @flags, align 1
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  %19 = load i8, ptr @flag_bit, align 1
  %conv33 = zext i8 %19 to i32
  %shl = shl i32 %conv33, 1
  %conv34 = trunc i32 %shl to i8
  store i8 %conv34, ptr @flag_bit, align 1
  %20 = load i32, ptr @last_lit, align 4
  %and = and i32 %20, 7
  %cmp35 = icmp eq i32 %and, 0
  br i1 %cmp35, label %if.then37, label %if.end41

if.then37:                                        ; preds = %if.end
  %21 = load i8, ptr @flags, align 1
  %22 = load i32, ptr @last_flags, align 4
  %inc38 = add i32 %22, 1
  store i32 %inc38, ptr @last_flags, align 4
  %idxprom39 = zext i32 %22 to i64
  %arrayidx40 = getelementptr inbounds [4096 x i8], ptr @flag_buf, i64 0, i64 %idxprom39
  store i8 %21, ptr %arrayidx40, align 1
  store i8 0, ptr @flags, align 1
  store i8 1, ptr @flag_bit, align 1
  br label %if.end41

if.end41:                                         ; preds = %if.then37, %if.end
  %23 = load i32, ptr @level, align 4
  %cmp42 = icmp sgt i32 %23, 2
  br i1 %cmp42, label %land.lhs.true, label %if.end72

land.lhs.true:                                    ; preds = %if.end41
  %24 = load i32, ptr @last_lit, align 4
  %and44 = and i32 %24, 4095
  %cmp45 = icmp eq i32 %and44, 0
  br i1 %cmp45, label %if.then47, label %if.end72

if.then47:                                        ; preds = %land.lhs.true
  %25 = load i32, ptr @last_lit, align 4
  %conv48 = zext i32 %25 to i64
  %mul = mul i64 %conv48, 8
  store i64 %mul, ptr %out_length, align 8
  %26 = load i32, ptr @strstart, align 4
  %conv49 = zext i32 %26 to i64
  %27 = load i64, ptr @block_start, align 8
  %sub = sub i64 %conv49, %27
  store i64 %sub, ptr %in_length, align 8
  store i32 0, ptr %dcode, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then47
  %28 = load i32, ptr %dcode, align 4
  %cmp50 = icmp slt i32 %28, 30
  br i1 %cmp50, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %29 = load i32, ptr %dcode, align 4
  %idxprom52 = sext i32 %29 to i64
  %arrayidx53 = getelementptr inbounds [61 x %struct.ct_data], ptr @dyn_dtree, i64 0, i64 %idxprom52
  %fc54 = getelementptr inbounds %struct.ct_data, ptr %arrayidx53, i32 0, i32 0
  %30 = load i16, ptr %fc54, align 4
  %conv55 = zext i16 %30 to i64
  %31 = load i32, ptr %dcode, align 4
  %idxprom56 = sext i32 %31 to i64
  %arrayidx57 = getelementptr inbounds [30 x i32], ptr @extra_dbits, i64 0, i64 %idxprom56
  %32 = load i32, ptr %arrayidx57, align 4
  %conv58 = sext i32 %32 to i64
  %add59 = add nsw i64 5, %conv58
  %mul60 = mul i64 %conv55, %add59
  %33 = load i64, ptr %out_length, align 8
  %add61 = add i64 %33, %mul60
  store i64 %add61, ptr %out_length, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %34 = load i32, ptr %dcode, align 4
  %inc62 = add nsw i32 %34, 1
  store i32 %inc62, ptr %dcode, align 4
  br label %for.cond, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %35 = load i64, ptr %out_length, align 8
  %shr63 = lshr i64 %35, 3
  store i64 %shr63, ptr %out_length, align 8
  %36 = load i32, ptr @last_dist, align 4
  %37 = load i32, ptr @last_lit, align 4
  %div = udiv i32 %37, 2
  %cmp64 = icmp ult i32 %36, %div
  br i1 %cmp64, label %land.lhs.true66, label %if.end71

land.lhs.true66:                                  ; preds = %for.end
  %38 = load i64, ptr %out_length, align 8
  %39 = load i64, ptr %in_length, align 8
  %div67 = udiv i64 %39, 2
  %cmp68 = icmp ult i64 %38, %div67
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %land.lhs.true66
  store i32 1, ptr %retval, align 4
  br label %return

if.end71:                                         ; preds = %land.lhs.true66, %for.end
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %land.lhs.true, %if.end41
  %40 = load i32, ptr @last_lit, align 4
  %cmp73 = icmp eq i32 %40, 32767
  br i1 %cmp73, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end72
  %41 = load i32, ptr @last_dist, align 4
  %cmp75 = icmp eq i32 %41, 32768
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end72
  %42 = phi i1 [ true, %if.end72 ], [ %cmp75, %lor.rhs ]
  %lor.ext = zext i1 %42 to i32
  store i32 %lor.ext, ptr %retval, align 4
  br label %return

return:                                           ; preds = %lor.end, %if.then70
  %43 = load i32, ptr %retval, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bi_init(i32 noundef %zipfile) #0 {
entry:
  %zipfile.addr = alloca i32, align 4
  store i32 %zipfile, ptr %zipfile.addr, align 4
  %0 = load i32, ptr %zipfile.addr, align 4
  store i32 %0, ptr @zfile, align 4
  store i16 0, ptr @bi_buf, align 2
  store i32 0, ptr @bi_valid, align 4
  %1 = load i32, ptr @zfile, align 4
  %cmp = icmp ne i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr @file_read, ptr @read_buf, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @send_bits(i32 noundef %value, i32 noundef %length) #0 {
entry:
  %value.addr = alloca i32, align 4
  %length.addr = alloca i32, align 4
  store i32 %value, ptr %value.addr, align 4
  store i32 %length, ptr %length.addr, align 4
  %0 = load i32, ptr @bi_valid, align 4
  %1 = load i32, ptr %length.addr, align 4
  %sub = sub nsw i32 16, %1
  %cmp = icmp sgt i32 %0, %sub
  br i1 %cmp, label %if.then, label %if.else42

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %value.addr, align 4
  %3 = load i32, ptr @bi_valid, align 4
  %shl = shl i32 %2, %3
  %4 = load i16, ptr @bi_buf, align 2
  %conv = zext i16 %4 to i32
  %or = or i32 %conv, %shl
  %conv1 = trunc i32 %or to i16
  store i16 %conv1, ptr @bi_buf, align 2
  %5 = load i32, ptr @outcnt, align 4
  %cmp2 = icmp ult i32 %5, 16382
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %6 = load i16, ptr @bi_buf, align 2
  %conv5 = zext i16 %6 to i32
  %and = and i32 %conv5, 255
  %conv6 = trunc i32 %and to i8
  %7 = load i32, ptr @outcnt, align 4
  %inc = add i32 %7, 1
  store i32 %inc, ptr @outcnt, align 4
  %idxprom = zext i32 %7 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom
  store i8 %conv6, ptr %arrayidx, align 1
  %8 = load i16, ptr @bi_buf, align 2
  %conv7 = zext i16 %8 to i32
  %shr = ashr i32 %conv7, 8
  %conv8 = trunc i32 %shr to i8
  %9 = load i32, ptr @outcnt, align 4
  %inc9 = add i32 %9, 1
  store i32 %inc9, ptr @outcnt, align 4
  %idxprom10 = zext i32 %9 to i64
  %arrayidx11 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom10
  store i8 %conv8, ptr %arrayidx11, align 1
  br label %if.end31

if.else:                                          ; preds = %if.then
  %10 = load i16, ptr @bi_buf, align 2
  %conv12 = zext i16 %10 to i32
  %and13 = and i32 %conv12, 255
  %conv14 = trunc i32 %and13 to i8
  %11 = load i32, ptr @outcnt, align 4
  %inc15 = add i32 %11, 1
  store i32 %inc15, ptr @outcnt, align 4
  %idxprom16 = zext i32 %11 to i64
  %arrayidx17 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom16
  store i8 %conv14, ptr %arrayidx17, align 1
  %12 = load i32, ptr @outcnt, align 4
  %cmp18 = icmp eq i32 %12, 16384
  br i1 %cmp18, label %if.then20, label %if.end

if.then20:                                        ; preds = %if.else
  call void @flush_outbuf()
  br label %if.end

if.end:                                           ; preds = %if.then20, %if.else
  %13 = load i16, ptr @bi_buf, align 2
  %conv21 = zext i16 %13 to i32
  %shr22 = ashr i32 %conv21, 8
  %conv23 = trunc i32 %shr22 to i8
  %14 = load i32, ptr @outcnt, align 4
  %inc24 = add i32 %14, 1
  store i32 %inc24, ptr @outcnt, align 4
  %idxprom25 = zext i32 %14 to i64
  %arrayidx26 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom25
  store i8 %conv23, ptr %arrayidx26, align 1
  %15 = load i32, ptr @outcnt, align 4
  %cmp27 = icmp eq i32 %15, 16384
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end
  call void @flush_outbuf()
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.then4
  %16 = load i32, ptr %value.addr, align 4
  %conv32 = trunc i32 %16 to i16
  %conv33 = zext i16 %conv32 to i32
  %17 = load i32, ptr @bi_valid, align 4
  %conv34 = sext i32 %17 to i64
  %sub35 = sub i64 16, %conv34
  %sh_prom = trunc i64 %sub35 to i32
  %shr36 = ashr i32 %conv33, %sh_prom
  %conv37 = trunc i32 %shr36 to i16
  store i16 %conv37, ptr @bi_buf, align 2
  %18 = load i32, ptr %length.addr, align 4
  %conv38 = sext i32 %18 to i64
  %sub39 = sub i64 %conv38, 16
  %19 = load i32, ptr @bi_valid, align 4
  %conv40 = sext i32 %19 to i64
  %add = add i64 %conv40, %sub39
  %conv41 = trunc i64 %add to i32
  store i32 %conv41, ptr @bi_valid, align 4
  br label %if.end48

if.else42:                                        ; preds = %entry
  %20 = load i32, ptr %value.addr, align 4
  %21 = load i32, ptr @bi_valid, align 4
  %shl43 = shl i32 %20, %21
  %22 = load i16, ptr @bi_buf, align 2
  %conv44 = zext i16 %22 to i32
  %or45 = or i32 %conv44, %shl43
  %conv46 = trunc i32 %or45 to i16
  store i16 %conv46, ptr @bi_buf, align 2
  %23 = load i32, ptr %length.addr, align 4
  %24 = load i32, ptr @bi_valid, align 4
  %add47 = add nsw i32 %24, %23
  store i32 %add47, ptr @bi_valid, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.else42, %if.end31
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bi_reverse(i32 noundef %code, i32 noundef %len) #0 {
entry:
  %code.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %code, ptr %code.addr, align 4
  store i32 %len, ptr %len.addr, align 4
  store i32 0, ptr %res, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, ptr %code.addr, align 4
  %and = and i32 %0, 1
  %1 = load i32, ptr %res, align 4
  %or = or i32 %1, %and
  store i32 %or, ptr %res, align 4
  %2 = load i32, ptr %code.addr, align 4
  %shr = lshr i32 %2, 1
  store i32 %shr, ptr %code.addr, align 4
  %3 = load i32, ptr %res, align 4
  %shl = shl i32 %3, 1
  store i32 %shl, ptr %res, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %4 = load i32, ptr %len.addr, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, ptr %len.addr, align 4
  %cmp = icmp sgt i32 %dec, 0
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !72

do.end:                                           ; preds = %do.cond
  %5 = load i32, ptr %res, align 4
  %shr1 = lshr i32 %5, 1
  ret i32 %shr1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bi_windup() #0 {
entry:
  %0 = load i32, ptr @bi_valid, align 4
  %cmp = icmp sgt i32 %0, 8
  br i1 %cmp, label %if.then, label %if.else29

if.then:                                          ; preds = %entry
  %1 = load i32, ptr @outcnt, align 4
  %cmp1 = icmp ult i32 %1, 16382
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %2 = load i16, ptr @bi_buf, align 2
  %conv = zext i16 %2 to i32
  %and = and i32 %conv, 255
  %conv3 = trunc i32 %and to i8
  %3 = load i32, ptr @outcnt, align 4
  %inc = add i32 %3, 1
  store i32 %inc, ptr @outcnt, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom
  store i8 %conv3, ptr %arrayidx, align 1
  %4 = load i16, ptr @bi_buf, align 2
  %conv4 = zext i16 %4 to i32
  %shr = ashr i32 %conv4, 8
  %conv5 = trunc i32 %shr to i8
  %5 = load i32, ptr @outcnt, align 4
  %inc6 = add i32 %5, 1
  store i32 %inc6, ptr @outcnt, align 4
  %idxprom7 = zext i32 %5 to i64
  %arrayidx8 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom7
  store i8 %conv5, ptr %arrayidx8, align 1
  br label %if.end28

if.else:                                          ; preds = %if.then
  %6 = load i16, ptr @bi_buf, align 2
  %conv9 = zext i16 %6 to i32
  %and10 = and i32 %conv9, 255
  %conv11 = trunc i32 %and10 to i8
  %7 = load i32, ptr @outcnt, align 4
  %inc12 = add i32 %7, 1
  store i32 %inc12, ptr @outcnt, align 4
  %idxprom13 = zext i32 %7 to i64
  %arrayidx14 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom13
  store i8 %conv11, ptr %arrayidx14, align 1
  %8 = load i32, ptr @outcnt, align 4
  %cmp15 = icmp eq i32 %8, 16384
  br i1 %cmp15, label %if.then17, label %if.end

if.then17:                                        ; preds = %if.else
  call void @flush_outbuf()
  br label %if.end

if.end:                                           ; preds = %if.then17, %if.else
  %9 = load i16, ptr @bi_buf, align 2
  %conv18 = zext i16 %9 to i32
  %shr19 = ashr i32 %conv18, 8
  %conv20 = trunc i32 %shr19 to i8
  %10 = load i32, ptr @outcnt, align 4
  %inc21 = add i32 %10, 1
  store i32 %inc21, ptr @outcnt, align 4
  %idxprom22 = zext i32 %10 to i64
  %arrayidx23 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom22
  store i8 %conv20, ptr %arrayidx23, align 1
  %11 = load i32, ptr @outcnt, align 4
  %cmp24 = icmp eq i32 %11, 16384
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end
  call void @flush_outbuf()
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then2
  br label %if.end42

if.else29:                                        ; preds = %entry
  %12 = load i32, ptr @bi_valid, align 4
  %cmp30 = icmp sgt i32 %12, 0
  br i1 %cmp30, label %if.then32, label %if.end41

if.then32:                                        ; preds = %if.else29
  %13 = load i16, ptr @bi_buf, align 2
  %conv33 = trunc i16 %13 to i8
  %14 = load i32, ptr @outcnt, align 4
  %inc34 = add i32 %14, 1
  store i32 %inc34, ptr @outcnt, align 4
  %idxprom35 = zext i32 %14 to i64
  %arrayidx36 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom35
  store i8 %conv33, ptr %arrayidx36, align 1
  %15 = load i32, ptr @outcnt, align 4
  %cmp37 = icmp eq i32 %15, 16384
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then32
  call void @flush_outbuf()
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.then32
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.else29
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.end28
  store i16 0, ptr @bi_buf, align 2
  store i32 0, ptr @bi_valid, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @copy_block(ptr noundef %buf, i32 noundef %len, i32 noundef %header) #0 {
entry:
  %buf.addr = alloca ptr, align 8
  %len.addr = alloca i32, align 4
  %header.addr = alloca i32, align 4
  store ptr %buf, ptr %buf.addr, align 8
  store i32 %len, ptr %len.addr, align 4
  store i32 %header, ptr %header.addr, align 4
  call void @bi_windup()
  %0 = load i32, ptr %header.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end76

if.then:                                          ; preds = %entry
  %1 = load i32, ptr @outcnt, align 4
  %cmp = icmp ult i32 %1, 16382
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %2 = load i32, ptr %len.addr, align 4
  %conv = trunc i32 %2 to i16
  %conv2 = zext i16 %conv to i32
  %and = and i32 %conv2, 255
  %conv3 = trunc i32 %and to i8
  %3 = load i32, ptr @outcnt, align 4
  %inc = add i32 %3, 1
  store i32 %inc, ptr @outcnt, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom
  store i8 %conv3, ptr %arrayidx, align 1
  %4 = load i32, ptr %len.addr, align 4
  %conv4 = trunc i32 %4 to i16
  %conv5 = zext i16 %conv4 to i32
  %shr = ashr i32 %conv5, 8
  %conv6 = trunc i32 %shr to i8
  %5 = load i32, ptr @outcnt, align 4
  %inc7 = add i32 %5, 1
  store i32 %inc7, ptr @outcnt, align 4
  %idxprom8 = zext i32 %5 to i64
  %arrayidx9 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom8
  store i8 %conv6, ptr %arrayidx9, align 1
  br label %if.end31

if.else:                                          ; preds = %if.then
  %6 = load i32, ptr %len.addr, align 4
  %conv10 = trunc i32 %6 to i16
  %conv11 = zext i16 %conv10 to i32
  %and12 = and i32 %conv11, 255
  %conv13 = trunc i32 %and12 to i8
  %7 = load i32, ptr @outcnt, align 4
  %inc14 = add i32 %7, 1
  store i32 %inc14, ptr @outcnt, align 4
  %idxprom15 = zext i32 %7 to i64
  %arrayidx16 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom15
  store i8 %conv13, ptr %arrayidx16, align 1
  %8 = load i32, ptr @outcnt, align 4
  %cmp17 = icmp eq i32 %8, 16384
  br i1 %cmp17, label %if.then19, label %if.end

if.then19:                                        ; preds = %if.else
  call void @flush_outbuf()
  br label %if.end

if.end:                                           ; preds = %if.then19, %if.else
  %9 = load i32, ptr %len.addr, align 4
  %conv20 = trunc i32 %9 to i16
  %conv21 = zext i16 %conv20 to i32
  %shr22 = ashr i32 %conv21, 8
  %conv23 = trunc i32 %shr22 to i8
  %10 = load i32, ptr @outcnt, align 4
  %inc24 = add i32 %10, 1
  store i32 %inc24, ptr @outcnt, align 4
  %idxprom25 = zext i32 %10 to i64
  %arrayidx26 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom25
  store i8 %conv23, ptr %arrayidx26, align 1
  %11 = load i32, ptr @outcnt, align 4
  %cmp27 = icmp eq i32 %11, 16384
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end
  call void @flush_outbuf()
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %if.then1
  %12 = load i32, ptr @outcnt, align 4
  %cmp32 = icmp ult i32 %12, 16382
  br i1 %cmp32, label %if.then34, label %if.else50

if.then34:                                        ; preds = %if.end31
  %13 = load i32, ptr %len.addr, align 4
  %neg = xor i32 %13, -1
  %conv35 = trunc i32 %neg to i16
  %conv36 = zext i16 %conv35 to i32
  %and37 = and i32 %conv36, 255
  %conv38 = trunc i32 %and37 to i8
  %14 = load i32, ptr @outcnt, align 4
  %inc39 = add i32 %14, 1
  store i32 %inc39, ptr @outcnt, align 4
  %idxprom40 = zext i32 %14 to i64
  %arrayidx41 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom40
  store i8 %conv38, ptr %arrayidx41, align 1
  %15 = load i32, ptr %len.addr, align 4
  %neg42 = xor i32 %15, -1
  %conv43 = trunc i32 %neg42 to i16
  %conv44 = zext i16 %conv43 to i32
  %shr45 = ashr i32 %conv44, 8
  %conv46 = trunc i32 %shr45 to i8
  %16 = load i32, ptr @outcnt, align 4
  %inc47 = add i32 %16, 1
  store i32 %inc47, ptr @outcnt, align 4
  %idxprom48 = zext i32 %16 to i64
  %arrayidx49 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom48
  store i8 %conv46, ptr %arrayidx49, align 1
  br label %if.end75

if.else50:                                        ; preds = %if.end31
  %17 = load i32, ptr %len.addr, align 4
  %neg51 = xor i32 %17, -1
  %conv52 = trunc i32 %neg51 to i16
  %conv53 = zext i16 %conv52 to i32
  %and54 = and i32 %conv53, 255
  %conv55 = trunc i32 %and54 to i8
  %18 = load i32, ptr @outcnt, align 4
  %inc56 = add i32 %18, 1
  store i32 %inc56, ptr @outcnt, align 4
  %idxprom57 = zext i32 %18 to i64
  %arrayidx58 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom57
  store i8 %conv55, ptr %arrayidx58, align 1
  %19 = load i32, ptr @outcnt, align 4
  %cmp59 = icmp eq i32 %19, 16384
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.else50
  call void @flush_outbuf()
  br label %if.end62

if.end62:                                         ; preds = %if.then61, %if.else50
  %20 = load i32, ptr %len.addr, align 4
  %neg63 = xor i32 %20, -1
  %conv64 = trunc i32 %neg63 to i16
  %conv65 = zext i16 %conv64 to i32
  %shr66 = ashr i32 %conv65, 8
  %conv67 = trunc i32 %shr66 to i8
  %21 = load i32, ptr @outcnt, align 4
  %inc68 = add i32 %21, 1
  store i32 %inc68, ptr @outcnt, align 4
  %idxprom69 = zext i32 %21 to i64
  %arrayidx70 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom69
  store i8 %conv67, ptr %arrayidx70, align 1
  %22 = load i32, ptr @outcnt, align 4
  %cmp71 = icmp eq i32 %22, 16384
  br i1 %cmp71, label %if.then73, label %if.end74

if.then73:                                        ; preds = %if.end62
  call void @flush_outbuf()
  br label %if.end74

if.end74:                                         ; preds = %if.then73, %if.end62
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.then34
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end84, %if.end76
  %23 = load i32, ptr %len.addr, align 4
  %dec = add i32 %23, -1
  store i32 %dec, ptr %len.addr, align 4
  %tobool77 = icmp ne i32 %23, 0
  br i1 %tobool77, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %24 = load ptr, ptr %buf.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %24, i32 1
  store ptr %incdec.ptr, ptr %buf.addr, align 8
  %25 = load i8, ptr %24, align 1
  %26 = load i32, ptr @outcnt, align 4
  %inc78 = add i32 %26, 1
  store i32 %inc78, ptr @outcnt, align 4
  %idxprom79 = zext i32 %26 to i64
  %arrayidx80 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom79
  store i8 %25, ptr %arrayidx80, align 1
  %27 = load i32, ptr @outcnt, align 4
  %cmp81 = icmp eq i32 %27, 16384
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %while.body
  call void @flush_outbuf()
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %while.body
  br label %while.cond, !llvm.loop !73

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @check_zipfile(i32 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i32, align 4
  %h = alloca ptr, align 8
  store i32 %in, ptr %in.addr, align 4
  %0 = load i32, ptr @inptr, align 4
  %idx.ext = zext i32 %0 to i64
  %add.ptr = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext
  store ptr %add.ptr, ptr %h, align 8
  %1 = load i32, ptr %in.addr, align 4
  store i32 %1, ptr @ifd, align 4
  %2 = load ptr, ptr %h, align 8
  %add.ptr1 = getelementptr inbounds i8, ptr %2, i64 26
  %arrayidx = getelementptr inbounds i8, ptr %add.ptr1, i64 0
  %3 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %3 to i16
  %conv2 = zext i16 %conv to i32
  %4 = load ptr, ptr %h, align 8
  %add.ptr3 = getelementptr inbounds i8, ptr %4, i64 26
  %arrayidx4 = getelementptr inbounds i8, ptr %add.ptr3, i64 1
  %5 = load i8, ptr %arrayidx4, align 1
  %conv5 = zext i8 %5 to i16
  %conv6 = zext i16 %conv5 to i32
  %shl = shl i32 %conv6, 8
  %or = or i32 %conv2, %shl
  %add = add nsw i32 30, %or
  %6 = load ptr, ptr %h, align 8
  %add.ptr7 = getelementptr inbounds i8, ptr %6, i64 28
  %arrayidx8 = getelementptr inbounds i8, ptr %add.ptr7, i64 0
  %7 = load i8, ptr %arrayidx8, align 1
  %conv9 = zext i8 %7 to i16
  %conv10 = zext i16 %conv9 to i32
  %8 = load ptr, ptr %h, align 8
  %add.ptr11 = getelementptr inbounds i8, ptr %8, i64 28
  %arrayidx12 = getelementptr inbounds i8, ptr %add.ptr11, i64 1
  %9 = load i8, ptr %arrayidx12, align 1
  %conv13 = zext i8 %9 to i16
  %conv14 = zext i16 %conv13 to i32
  %shl15 = shl i32 %conv14, 8
  %or16 = or i32 %conv10, %shl15
  %add17 = add nsw i32 %add, %or16
  %10 = load i32, ptr @inptr, align 4
  %add18 = add i32 %10, %add17
  store i32 %add18, ptr @inptr, align 4
  %11 = load i32, ptr @inptr, align 4
  %12 = load i32, ptr @insize, align 4
  %cmp = icmp ugt i32 %11, %12
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %13 = load ptr, ptr %h, align 8
  %arrayidx20 = getelementptr inbounds i8, ptr %13, i64 0
  %14 = load i8, ptr %arrayidx20, align 1
  %conv21 = zext i8 %14 to i16
  %conv22 = zext i16 %conv21 to i32
  %15 = load ptr, ptr %h, align 8
  %arrayidx23 = getelementptr inbounds i8, ptr %15, i64 1
  %16 = load i8, ptr %arrayidx23, align 1
  %conv24 = zext i8 %16 to i16
  %conv25 = zext i16 %conv24 to i32
  %shl26 = shl i32 %conv25, 8
  %or27 = or i32 %conv22, %shl26
  %conv28 = sext i32 %or27 to i64
  %17 = load ptr, ptr %h, align 8
  %add.ptr29 = getelementptr inbounds i8, ptr %17, i64 2
  %arrayidx30 = getelementptr inbounds i8, ptr %add.ptr29, i64 0
  %18 = load i8, ptr %arrayidx30, align 1
  %conv31 = zext i8 %18 to i16
  %conv32 = zext i16 %conv31 to i32
  %19 = load ptr, ptr %h, align 8
  %add.ptr33 = getelementptr inbounds i8, ptr %19, i64 2
  %arrayidx34 = getelementptr inbounds i8, ptr %add.ptr33, i64 1
  %20 = load i8, ptr %arrayidx34, align 1
  %conv35 = zext i8 %20 to i16
  %conv36 = zext i16 %conv35 to i32
  %shl37 = shl i32 %conv36, 8
  %or38 = or i32 %conv32, %shl37
  %conv39 = sext i32 %or38 to i64
  %shl40 = shl i64 %conv39, 16
  %or41 = or i64 %conv28, %shl40
  %cmp42 = icmp ne i64 %or41, 67324752
  br i1 %cmp42, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %21 = load ptr, ptr @stderr, align 8
  %22 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.177, ptr noundef %22, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %23 = load ptr, ptr %h, align 8
  %arrayidx44 = getelementptr inbounds i8, ptr %23, i64 8
  %24 = load i8, ptr %arrayidx44, align 1
  %conv45 = zext i8 %24 to i32
  store i32 %conv45, ptr @method, align 4
  %25 = load i32, ptr @method, align 4
  %cmp46 = icmp ne i32 %25, 0
  br i1 %cmp46, label %land.lhs.true, label %if.end52

land.lhs.true:                                    ; preds = %if.end
  %26 = load i32, ptr @method, align 4
  %cmp48 = icmp ne i32 %26, 8
  br i1 %cmp48, label %if.then50, label %if.end52

if.then50:                                        ; preds = %land.lhs.true
  %27 = load ptr, ptr @stderr, align 8
  %28 = load ptr, ptr @progname, align 8
  %call51 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %27, ptr noundef @.str.1.178, ptr noundef %28, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end52:                                         ; preds = %land.lhs.true, %if.end
  %29 = load ptr, ptr %h, align 8
  %arrayidx53 = getelementptr inbounds i8, ptr %29, i64 6
  %30 = load i8, ptr %arrayidx53, align 1
  %conv54 = zext i8 %30 to i32
  %and = and i32 %conv54, 1
  store i32 %and, ptr @decrypt, align 4
  %cmp55 = icmp ne i32 %and, 0
  br i1 %cmp55, label %if.then57, label %if.end59

if.then57:                                        ; preds = %if.end52
  %31 = load ptr, ptr @stderr, align 8
  %32 = load ptr, ptr @progname, align 8
  %call58 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %31, ptr noundef @.str.2.179, ptr noundef %32, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end59:                                         ; preds = %if.end52
  %33 = load ptr, ptr %h, align 8
  %arrayidx60 = getelementptr inbounds i8, ptr %33, i64 6
  %34 = load i8, ptr %arrayidx60, align 1
  %conv61 = zext i8 %34 to i32
  %and62 = and i32 %conv61, 8
  %cmp63 = icmp ne i32 %and62, 0
  %conv64 = zext i1 %cmp63 to i32
  store i32 %conv64, ptr @ext_header, align 4
  store i32 1, ptr @pkzip, align 4
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end59, %if.then57, %if.then50, %if.then
  %35 = load i32, ptr %retval, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @unzip(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  %orig_crc = alloca i64, align 8
  %orig_len = alloca i64, align 8
  %n = alloca i32, align 4
  %buf = alloca [16 x i8], align 16
  %res = alloca i32, align 4
  %n48 = alloca i64, align 8
  %c = alloca i8, align 1
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  store i64 0, ptr %orig_crc, align 8
  store i64 0, ptr %orig_len, align 8
  %0 = load i32, ptr %in.addr, align 4
  store i32 %0, ptr @ifd, align 4
  %1 = load i32, ptr %out.addr, align 4
  store i32 %1, ptr @ofd, align 4
  %call = call i64 @updcrc(ptr noundef null, i32 noundef 0)
  %2 = load i32, ptr @pkzip, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, ptr @ext_header, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %4 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 14), align 1
  %conv = zext i8 %4 to i16
  %conv2 = zext i16 %conv to i32
  %5 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 15), align 1
  %conv3 = zext i8 %5 to i16
  %conv4 = zext i16 %conv3 to i32
  %shl = shl i32 %conv4, 8
  %or = or i32 %conv2, %shl
  %conv5 = sext i32 %or to i64
  %6 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 16), align 1
  %conv6 = zext i8 %6 to i16
  %conv7 = zext i16 %conv6 to i32
  %7 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 17), align 1
  %conv8 = zext i8 %7 to i16
  %conv9 = zext i16 %conv8 to i32
  %shl10 = shl i32 %conv9, 8
  %or11 = or i32 %conv7, %shl10
  %conv12 = sext i32 %or11 to i64
  %shl13 = shl i64 %conv12, 16
  %or14 = or i64 %conv5, %shl13
  store i64 %or14, ptr %orig_crc, align 8
  %8 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 22), align 1
  %conv15 = zext i8 %8 to i16
  %conv16 = zext i16 %conv15 to i32
  %9 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 23), align 1
  %conv17 = zext i8 %9 to i16
  %conv18 = zext i16 %conv17 to i32
  %shl19 = shl i32 %conv18, 8
  %or20 = or i32 %conv16, %shl19
  %conv21 = sext i32 %or20 to i64
  %10 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 24), align 1
  %conv22 = zext i8 %10 to i16
  %conv23 = zext i16 %conv22 to i32
  %11 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 25), align 1
  %conv24 = zext i8 %11 to i16
  %conv25 = zext i16 %conv24 to i32
  %shl26 = shl i32 %conv25, 8
  %or27 = or i32 %conv23, %shl26
  %conv28 = sext i32 %or27 to i64
  %shl29 = shl i64 %conv28, 16
  %or30 = or i64 %conv21, %shl29
  store i64 %or30, ptr %orig_len, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %12 = load i32, ptr @method, align 4
  %cmp = icmp eq i32 %12, 8
  br i1 %cmp, label %if.then32, label %if.else42

if.then32:                                        ; preds = %if.end
  %call33 = call i32 @inflate()
  store i32 %call33, ptr %res, align 4
  %13 = load i32, ptr %res, align 4
  %cmp34 = icmp eq i32 %13, 3
  br i1 %cmp34, label %if.then36, label %if.else

if.then36:                                        ; preds = %if.then32
  call void @error(ptr noundef @.str.3.182)
  br label %if.end41

if.else:                                          ; preds = %if.then32
  %14 = load i32, ptr %res, align 4
  %cmp37 = icmp ne i32 %14, 0
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.else
  call void @error(ptr noundef @.str.4.183)
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %if.else
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.then36
  br label %if.end120

if.else42:                                        ; preds = %if.end
  %15 = load i32, ptr @pkzip, align 4
  %tobool43 = icmp ne i32 %15, 0
  br i1 %tobool43, label %land.lhs.true44, label %if.else118

land.lhs.true44:                                  ; preds = %if.else42
  %16 = load i32, ptr @method, align 4
  %cmp45 = icmp eq i32 %16, 0
  br i1 %cmp45, label %if.then47, label %if.else118

if.then47:                                        ; preds = %land.lhs.true44
  %17 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 22), align 1
  %conv49 = zext i8 %17 to i16
  %conv50 = zext i16 %conv49 to i32
  %18 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 23), align 1
  %conv51 = zext i8 %18 to i16
  %conv52 = zext i16 %conv51 to i32
  %shl53 = shl i32 %conv52, 8
  %or54 = or i32 %conv50, %shl53
  %conv55 = sext i32 %or54 to i64
  %19 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 24), align 1
  %conv56 = zext i8 %19 to i16
  %conv57 = zext i16 %conv56 to i32
  %20 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 25), align 1
  %conv58 = zext i8 %20 to i16
  %conv59 = zext i16 %conv58 to i32
  %shl60 = shl i32 %conv59, 8
  %or61 = or i32 %conv57, %shl60
  %conv62 = sext i32 %or61 to i64
  %shl63 = shl i64 %conv62, 16
  %or64 = or i64 %conv55, %shl63
  store i64 %or64, ptr %n48, align 8
  %21 = load i64, ptr %n48, align 8
  %22 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 18), align 1
  %conv65 = zext i8 %22 to i16
  %conv66 = zext i16 %conv65 to i32
  %23 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 19), align 1
  %conv67 = zext i8 %23 to i16
  %conv68 = zext i16 %conv67 to i32
  %shl69 = shl i32 %conv68, 8
  %or70 = or i32 %conv66, %shl69
  %conv71 = sext i32 %or70 to i64
  %24 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 20), align 1
  %conv72 = zext i8 %24 to i16
  %conv73 = zext i16 %conv72 to i32
  %25 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 21), align 1
  %conv74 = zext i8 %25 to i16
  %conv75 = zext i16 %conv74 to i32
  %shl76 = shl i32 %conv75, 8
  %or77 = or i32 %conv73, %shl76
  %conv78 = sext i32 %or77 to i64
  %shl79 = shl i64 %conv78, 16
  %or80 = or i64 %conv71, %shl79
  %26 = load i32, ptr @decrypt, align 4
  %tobool81 = icmp ne i32 %26, 0
  %27 = zext i1 %tobool81 to i64
  %cond = select i1 %tobool81, i32 12, i32 0
  %conv82 = sext i32 %cond to i64
  %sub = sub i64 %or80, %conv82
  %cmp83 = icmp ne i64 %21, %sub
  br i1 %cmp83, label %if.then85, label %if.end103

if.then85:                                        ; preds = %if.then47
  %28 = load ptr, ptr @stderr, align 8
  %29 = load i64, ptr %n48, align 8
  %30 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 18), align 1
  %conv86 = zext i8 %30 to i16
  %conv87 = zext i16 %conv86 to i32
  %31 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 19), align 1
  %conv88 = zext i8 %31 to i16
  %conv89 = zext i16 %conv88 to i32
  %shl90 = shl i32 %conv89, 8
  %or91 = or i32 %conv87, %shl90
  %conv92 = sext i32 %or91 to i64
  %32 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 20), align 1
  %conv93 = zext i8 %32 to i16
  %conv94 = zext i16 %conv93 to i32
  %33 = load i8, ptr getelementptr inbounds (i8, ptr @inbuf, i64 21), align 1
  %conv95 = zext i8 %33 to i16
  %conv96 = zext i16 %conv95 to i32
  %shl97 = shl i32 %conv96, 8
  %or98 = or i32 %conv94, %shl97
  %conv99 = sext i32 %or98 to i64
  %shl100 = shl i64 %conv99, 16
  %or101 = or i64 %conv92, %shl100
  %call102 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %28, ptr noundef @.str.5.184, i64 noundef %29, i64 noundef %or101)
  call void @error(ptr noundef @.str.6.185)
  br label %if.end103

if.end103:                                        ; preds = %if.then85, %if.then47
  br label %while.cond

while.cond:                                       ; preds = %if.end117, %if.end103
  %34 = load i64, ptr %n48, align 8
  %dec = add i64 %34, -1
  store i64 %dec, ptr %n48, align 8
  %tobool104 = icmp ne i64 %34, 0
  br i1 %tobool104, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %35 = load i32, ptr @inptr, align 4
  %36 = load i32, ptr @insize, align 4
  %cmp105 = icmp ult i32 %35, %36
  br i1 %cmp105, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %37 = load i32, ptr @inptr, align 4
  %inc = add i32 %37, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %37 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %38 = load i8, ptr %arrayidx, align 1
  %conv107 = zext i8 %38 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call108 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond109 = phi i32 [ %conv107, %cond.true ], [ %call108, %cond.false ]
  %conv110 = trunc i32 %cond109 to i8
  store i8 %conv110, ptr %c, align 1
  %39 = load i8, ptr %c, align 1
  %40 = load i32, ptr @outcnt, align 4
  %inc111 = add i32 %40, 1
  store i32 %inc111, ptr @outcnt, align 4
  %idxprom112 = zext i32 %40 to i64
  %arrayidx113 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom112
  store i8 %39, ptr %arrayidx113, align 1
  %41 = load i32, ptr @outcnt, align 4
  %cmp114 = icmp eq i32 %41, 32768
  br i1 %cmp114, label %if.then116, label %if.end117

if.then116:                                       ; preds = %cond.end
  call void @flush_window()
  br label %if.end117

if.end117:                                        ; preds = %if.then116, %cond.end
  br label %while.cond, !llvm.loop !74

while.end:                                        ; preds = %while.cond
  call void @flush_window()
  br label %if.end119

if.else118:                                       ; preds = %land.lhs.true44, %if.else42
  call void @error(ptr noundef @.str.7.186)
  br label %if.end119

if.end119:                                        ; preds = %if.else118, %while.end
  br label %if.end120

if.end120:                                        ; preds = %if.end119, %if.end41
  %42 = load i32, ptr @pkzip, align 4
  %tobool121 = icmp ne i32 %42, 0
  br i1 %tobool121, label %if.else192, label %if.then122

if.then122:                                       ; preds = %if.end120
  store i32 0, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then122
  %43 = load i32, ptr %n, align 4
  %cmp123 = icmp slt i32 %43, 8
  br i1 %cmp123, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %44 = load i32, ptr @inptr, align 4
  %45 = load i32, ptr @insize, align 4
  %cmp125 = icmp ult i32 %44, %45
  br i1 %cmp125, label %cond.true127, label %cond.false132

cond.true127:                                     ; preds = %for.body
  %46 = load i32, ptr @inptr, align 4
  %inc128 = add i32 %46, 1
  store i32 %inc128, ptr @inptr, align 4
  %idxprom129 = zext i32 %46 to i64
  %arrayidx130 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom129
  %47 = load i8, ptr %arrayidx130, align 1
  %conv131 = zext i8 %47 to i32
  br label %cond.end134

cond.false132:                                    ; preds = %for.body
  %call133 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end134

cond.end134:                                      ; preds = %cond.false132, %cond.true127
  %cond135 = phi i32 [ %conv131, %cond.true127 ], [ %call133, %cond.false132 ]
  %conv136 = trunc i32 %cond135 to i8
  %48 = load i32, ptr %n, align 4
  %idxprom137 = sext i32 %48 to i64
  %arrayidx138 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 %idxprom137
  store i8 %conv136, ptr %arrayidx138, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end134
  %49 = load i32, ptr %n, align 4
  %inc139 = add nsw i32 %49, 1
  store i32 %inc139, ptr %n, align 4
  br label %for.cond, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx140 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %50 = load i8, ptr %arrayidx140, align 16
  %conv141 = zext i8 %50 to i16
  %conv142 = zext i16 %conv141 to i32
  %arrayidx143 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 1
  %51 = load i8, ptr %arrayidx143, align 1
  %conv144 = zext i8 %51 to i16
  %conv145 = zext i16 %conv144 to i32
  %shl146 = shl i32 %conv145, 8
  %or147 = or i32 %conv142, %shl146
  %conv148 = sext i32 %or147 to i64
  %arraydecay = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay, i64 2
  %arrayidx149 = getelementptr inbounds i8, ptr %add.ptr, i64 0
  %52 = load i8, ptr %arrayidx149, align 1
  %conv150 = zext i8 %52 to i16
  %conv151 = zext i16 %conv150 to i32
  %arraydecay152 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr153 = getelementptr inbounds i8, ptr %arraydecay152, i64 2
  %arrayidx154 = getelementptr inbounds i8, ptr %add.ptr153, i64 1
  %53 = load i8, ptr %arrayidx154, align 1
  %conv155 = zext i8 %53 to i16
  %conv156 = zext i16 %conv155 to i32
  %shl157 = shl i32 %conv156, 8
  %or158 = or i32 %conv151, %shl157
  %conv159 = sext i32 %or158 to i64
  %shl160 = shl i64 %conv159, 16
  %or161 = or i64 %conv148, %shl160
  store i64 %or161, ptr %orig_crc, align 8
  %arraydecay162 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr163 = getelementptr inbounds i8, ptr %arraydecay162, i64 4
  %arrayidx164 = getelementptr inbounds i8, ptr %add.ptr163, i64 0
  %54 = load i8, ptr %arrayidx164, align 1
  %conv165 = zext i8 %54 to i16
  %conv166 = zext i16 %conv165 to i32
  %arraydecay167 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr168 = getelementptr inbounds i8, ptr %arraydecay167, i64 4
  %arrayidx169 = getelementptr inbounds i8, ptr %add.ptr168, i64 1
  %55 = load i8, ptr %arrayidx169, align 1
  %conv170 = zext i8 %55 to i16
  %conv171 = zext i16 %conv170 to i32
  %shl172 = shl i32 %conv171, 8
  %or173 = or i32 %conv166, %shl172
  %conv174 = sext i32 %or173 to i64
  %arraydecay175 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr176 = getelementptr inbounds i8, ptr %arraydecay175, i64 4
  %add.ptr177 = getelementptr inbounds i8, ptr %add.ptr176, i64 2
  %arrayidx178 = getelementptr inbounds i8, ptr %add.ptr177, i64 0
  %56 = load i8, ptr %arrayidx178, align 1
  %conv179 = zext i8 %56 to i16
  %conv180 = zext i16 %conv179 to i32
  %arraydecay181 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr182 = getelementptr inbounds i8, ptr %arraydecay181, i64 4
  %add.ptr183 = getelementptr inbounds i8, ptr %add.ptr182, i64 2
  %arrayidx184 = getelementptr inbounds i8, ptr %add.ptr183, i64 1
  %57 = load i8, ptr %arrayidx184, align 1
  %conv185 = zext i8 %57 to i16
  %conv186 = zext i16 %conv185 to i32
  %shl187 = shl i32 %conv186, 8
  %or188 = or i32 %conv180, %shl187
  %conv189 = sext i32 %or188 to i64
  %shl190 = shl i64 %conv189, 16
  %or191 = or i64 %conv174, %shl190
  store i64 %or191, ptr %orig_len, align 8
  br label %if.end277

if.else192:                                       ; preds = %if.end120
  %58 = load i32, ptr @ext_header, align 4
  %tobool193 = icmp ne i32 %58, 0
  br i1 %tobool193, label %if.then194, label %if.end276

if.then194:                                       ; preds = %if.else192
  store i32 0, ptr %n, align 4
  br label %for.cond195

for.cond195:                                      ; preds = %for.inc213, %if.then194
  %59 = load i32, ptr %n, align 4
  %cmp196 = icmp slt i32 %59, 16
  br i1 %cmp196, label %for.body198, label %for.end215

for.body198:                                      ; preds = %for.cond195
  %60 = load i32, ptr @inptr, align 4
  %61 = load i32, ptr @insize, align 4
  %cmp199 = icmp ult i32 %60, %61
  br i1 %cmp199, label %cond.true201, label %cond.false206

cond.true201:                                     ; preds = %for.body198
  %62 = load i32, ptr @inptr, align 4
  %inc202 = add i32 %62, 1
  store i32 %inc202, ptr @inptr, align 4
  %idxprom203 = zext i32 %62 to i64
  %arrayidx204 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom203
  %63 = load i8, ptr %arrayidx204, align 1
  %conv205 = zext i8 %63 to i32
  br label %cond.end208

cond.false206:                                    ; preds = %for.body198
  %call207 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end208

cond.end208:                                      ; preds = %cond.false206, %cond.true201
  %cond209 = phi i32 [ %conv205, %cond.true201 ], [ %call207, %cond.false206 ]
  %conv210 = trunc i32 %cond209 to i8
  %64 = load i32, ptr %n, align 4
  %idxprom211 = sext i32 %64 to i64
  %arrayidx212 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 %idxprom211
  store i8 %conv210, ptr %arrayidx212, align 1
  br label %for.inc213

for.inc213:                                       ; preds = %cond.end208
  %65 = load i32, ptr %n, align 4
  %inc214 = add nsw i32 %65, 1
  store i32 %inc214, ptr %n, align 4
  br label %for.cond195, !llvm.loop !76

for.end215:                                       ; preds = %for.cond195
  %arraydecay216 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr217 = getelementptr inbounds i8, ptr %arraydecay216, i64 4
  %arrayidx218 = getelementptr inbounds i8, ptr %add.ptr217, i64 0
  %66 = load i8, ptr %arrayidx218, align 1
  %conv219 = zext i8 %66 to i16
  %conv220 = zext i16 %conv219 to i32
  %arraydecay221 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr222 = getelementptr inbounds i8, ptr %arraydecay221, i64 4
  %arrayidx223 = getelementptr inbounds i8, ptr %add.ptr222, i64 1
  %67 = load i8, ptr %arrayidx223, align 1
  %conv224 = zext i8 %67 to i16
  %conv225 = zext i16 %conv224 to i32
  %shl226 = shl i32 %conv225, 8
  %or227 = or i32 %conv220, %shl226
  %conv228 = sext i32 %or227 to i64
  %arraydecay229 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr230 = getelementptr inbounds i8, ptr %arraydecay229, i64 4
  %add.ptr231 = getelementptr inbounds i8, ptr %add.ptr230, i64 2
  %arrayidx232 = getelementptr inbounds i8, ptr %add.ptr231, i64 0
  %68 = load i8, ptr %arrayidx232, align 1
  %conv233 = zext i8 %68 to i16
  %conv234 = zext i16 %conv233 to i32
  %arraydecay235 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr236 = getelementptr inbounds i8, ptr %arraydecay235, i64 4
  %add.ptr237 = getelementptr inbounds i8, ptr %add.ptr236, i64 2
  %arrayidx238 = getelementptr inbounds i8, ptr %add.ptr237, i64 1
  %69 = load i8, ptr %arrayidx238, align 1
  %conv239 = zext i8 %69 to i16
  %conv240 = zext i16 %conv239 to i32
  %shl241 = shl i32 %conv240, 8
  %or242 = or i32 %conv234, %shl241
  %conv243 = sext i32 %or242 to i64
  %shl244 = shl i64 %conv243, 16
  %or245 = or i64 %conv228, %shl244
  store i64 %or245, ptr %orig_crc, align 8
  %arraydecay246 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr247 = getelementptr inbounds i8, ptr %arraydecay246, i64 12
  %arrayidx248 = getelementptr inbounds i8, ptr %add.ptr247, i64 0
  %70 = load i8, ptr %arrayidx248, align 1
  %conv249 = zext i8 %70 to i16
  %conv250 = zext i16 %conv249 to i32
  %arraydecay251 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr252 = getelementptr inbounds i8, ptr %arraydecay251, i64 12
  %arrayidx253 = getelementptr inbounds i8, ptr %add.ptr252, i64 1
  %71 = load i8, ptr %arrayidx253, align 1
  %conv254 = zext i8 %71 to i16
  %conv255 = zext i16 %conv254 to i32
  %shl256 = shl i32 %conv255, 8
  %or257 = or i32 %conv250, %shl256
  %conv258 = sext i32 %or257 to i64
  %arraydecay259 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr260 = getelementptr inbounds i8, ptr %arraydecay259, i64 12
  %add.ptr261 = getelementptr inbounds i8, ptr %add.ptr260, i64 2
  %arrayidx262 = getelementptr inbounds i8, ptr %add.ptr261, i64 0
  %72 = load i8, ptr %arrayidx262, align 1
  %conv263 = zext i8 %72 to i16
  %conv264 = zext i16 %conv263 to i32
  %arraydecay265 = getelementptr inbounds [16 x i8], ptr %buf, i64 0, i64 0
  %add.ptr266 = getelementptr inbounds i8, ptr %arraydecay265, i64 12
  %add.ptr267 = getelementptr inbounds i8, ptr %add.ptr266, i64 2
  %arrayidx268 = getelementptr inbounds i8, ptr %add.ptr267, i64 1
  %73 = load i8, ptr %arrayidx268, align 1
  %conv269 = zext i8 %73 to i16
  %conv270 = zext i16 %conv269 to i32
  %shl271 = shl i32 %conv270, 8
  %or272 = or i32 %conv264, %shl271
  %conv273 = sext i32 %or272 to i64
  %shl274 = shl i64 %conv273, 16
  %or275 = or i64 %conv258, %shl274
  store i64 %or275, ptr %orig_len, align 8
  br label %if.end276

if.end276:                                        ; preds = %for.end215, %if.else192
  br label %if.end277

if.end277:                                        ; preds = %if.end276, %for.end
  %74 = load i64, ptr %orig_crc, align 8
  %call278 = call i64 @updcrc(ptr noundef @outbuf, i32 noundef 0)
  %cmp279 = icmp ne i64 %74, %call278
  br i1 %cmp279, label %if.then281, label %if.end282

if.then281:                                       ; preds = %if.end277
  call void @error(ptr noundef @.str.8.187)
  br label %if.end282

if.end282:                                        ; preds = %if.then281, %if.end277
  %75 = load i64, ptr %orig_len, align 8
  %76 = load i64, ptr @bytes_out, align 8
  %cmp283 = icmp ne i64 %75, %76
  br i1 %cmp283, label %if.then285, label %if.end286

if.then285:                                       ; preds = %if.end282
  call void @error(ptr noundef @.str.9.188)
  br label %if.end286

if.end286:                                        ; preds = %if.then285, %if.end282
  %77 = load i32, ptr @pkzip, align 4
  %tobool287 = icmp ne i32 %77, 0
  br i1 %tobool287, label %land.lhs.true288, label %if.end337

land.lhs.true288:                                 ; preds = %if.end286
  %78 = load i32, ptr @inptr, align 4
  %add = add i32 %78, 4
  %79 = load i32, ptr @insize, align 4
  %cmp289 = icmp ult i32 %add, %79
  br i1 %cmp289, label %land.lhs.true291, label %if.end337

land.lhs.true291:                                 ; preds = %land.lhs.true288
  %80 = load i32, ptr @inptr, align 4
  %idx.ext = zext i32 %80 to i64
  %add.ptr292 = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext
  %arrayidx293 = getelementptr inbounds i8, ptr %add.ptr292, i64 0
  %81 = load i8, ptr %arrayidx293, align 1
  %conv294 = zext i8 %81 to i16
  %conv295 = zext i16 %conv294 to i32
  %82 = load i32, ptr @inptr, align 4
  %idx.ext296 = zext i32 %82 to i64
  %add.ptr297 = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext296
  %arrayidx298 = getelementptr inbounds i8, ptr %add.ptr297, i64 1
  %83 = load i8, ptr %arrayidx298, align 1
  %conv299 = zext i8 %83 to i16
  %conv300 = zext i16 %conv299 to i32
  %shl301 = shl i32 %conv300, 8
  %or302 = or i32 %conv295, %shl301
  %conv303 = sext i32 %or302 to i64
  %84 = load i32, ptr @inptr, align 4
  %idx.ext304 = zext i32 %84 to i64
  %add.ptr305 = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext304
  %add.ptr306 = getelementptr inbounds i8, ptr %add.ptr305, i64 2
  %arrayidx307 = getelementptr inbounds i8, ptr %add.ptr306, i64 0
  %85 = load i8, ptr %arrayidx307, align 1
  %conv308 = zext i8 %85 to i16
  %conv309 = zext i16 %conv308 to i32
  %86 = load i32, ptr @inptr, align 4
  %idx.ext310 = zext i32 %86 to i64
  %add.ptr311 = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext310
  %add.ptr312 = getelementptr inbounds i8, ptr %add.ptr311, i64 2
  %arrayidx313 = getelementptr inbounds i8, ptr %add.ptr312, i64 1
  %87 = load i8, ptr %arrayidx313, align 1
  %conv314 = zext i8 %87 to i16
  %conv315 = zext i16 %conv314 to i32
  %shl316 = shl i32 %conv315, 8
  %or317 = or i32 %conv309, %shl316
  %conv318 = sext i32 %or317 to i64
  %shl319 = shl i64 %conv318, 16
  %or320 = or i64 %conv303, %shl319
  %cmp321 = icmp eq i64 %or320, 67324752
  br i1 %cmp321, label %if.then323, label %if.end337

if.then323:                                       ; preds = %land.lhs.true291
  %88 = load i32, ptr @to_stdout, align 4
  %tobool324 = icmp ne i32 %88, 0
  br i1 %tobool324, label %if.then325, label %if.else334

if.then325:                                       ; preds = %if.then323
  %89 = load i32, ptr @quiet, align 4
  %tobool326 = icmp ne i32 %89, 0
  br i1 %tobool326, label %if.end329, label %if.then327

if.then327:                                       ; preds = %if.then325
  %90 = load ptr, ptr @stderr, align 8
  %91 = load ptr, ptr @progname, align 8
  %call328 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %90, ptr noundef @.str.10.189, ptr noundef %91, ptr noundef @ifname)
  br label %if.end329

if.end329:                                        ; preds = %if.then327, %if.then325
  %92 = load i32, ptr @exit_code, align 4
  %cmp330 = icmp eq i32 %92, 0
  br i1 %cmp330, label %if.then332, label %if.end333

if.then332:                                       ; preds = %if.end329
  store i32 2, ptr @exit_code, align 4
  br label %if.end333

if.end333:                                        ; preds = %if.then332, %if.end329
  br label %if.end336

if.else334:                                       ; preds = %if.then323
  %93 = load ptr, ptr @stderr, align 8
  %94 = load ptr, ptr @progname, align 8
  %call335 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %93, ptr noundef @.str.11.190, ptr noundef %94, ptr noundef @ifname)
  store i32 1, ptr @exit_code, align 4
  store i32 0, ptr @pkzip, align 4
  store i32 0, ptr @ext_header, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end336:                                        ; preds = %if.end333
  br label %if.end337

if.end337:                                        ; preds = %if.end336, %land.lhs.true291, %land.lhs.true288, %if.end286
  store i32 0, ptr @pkzip, align 4
  store i32 0, ptr @ext_header, align 4
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end337, %if.else334
  %95 = load i32, ptr %retval, align 4
  ret i32 %95
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @huft_build(ptr noundef %b, i32 noundef %n, i32 noundef %s, ptr noundef %d, ptr noundef %e, ptr noundef %t, ptr noundef %m) #0 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %s.addr = alloca i32, align 4
  %d.addr = alloca ptr, align 8
  %e.addr = alloca ptr, align 8
  %t.addr = alloca ptr, align 8
  %m.addr = alloca ptr, align 8
  %a = alloca i32, align 4
  %c = alloca [17 x i32], align 16
  %f = alloca i32, align 4
  %g = alloca i32, align 4
  %h = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %p = alloca ptr, align 8
  %q = alloca ptr, align 8
  %r = alloca %struct.huft, align 8
  %u = alloca [16 x ptr], align 16
  %v = alloca [288 x i32], align 16
  %w = alloca i32, align 4
  %x = alloca [17 x i32], align 16
  %xp = alloca ptr, align 8
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store ptr %b, ptr %b.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  store i32 %s, ptr %s.addr, align 4
  store ptr %d, ptr %d.addr, align 8
  store ptr %e, ptr %e.addr, align 8
  store ptr %t, ptr %t.addr, align 8
  store ptr %m, ptr %m.addr, align 8
  %arraydecay = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay, i8 0, i64 68, i1 false)
  %0 = load ptr, ptr %b.addr, align 8
  store ptr %0, ptr %p, align 8
  %1 = load i32, ptr %n.addr, align 4
  store i32 %1, ptr %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %2 = load ptr, ptr %p, align 8
  %3 = load i32, ptr %2, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %inc = add i32 %4, 1
  store i32 %inc, ptr %arrayidx, align 4
  %5 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i32, ptr %5, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %6 = load i32, ptr %i, align 4
  %dec = add i32 %6, -1
  store i32 %dec, ptr %i, align 4
  %tobool = icmp ne i32 %dec, 0
  br i1 %tobool, label %do.body, label %do.end, !llvm.loop !77

do.end:                                           ; preds = %do.cond
  %arrayidx1 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 0
  %7 = load i32, ptr %arrayidx1, align 16
  %8 = load i32, ptr %n.addr, align 4
  %cmp = icmp eq i32 %7, %8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.end
  %9 = load ptr, ptr %t.addr, align 8
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %m.addr, align 8
  store i32 0, ptr %10, align 4
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %do.end
  %11 = load ptr, ptr %m.addr, align 8
  %12 = load i32, ptr %11, align 4
  store i32 %12, ptr %l, align 4
  store i32 1, ptr %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %13 = load i32, ptr %j, align 4
  %cmp2 = icmp ule i32 %13, 16
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i32, ptr %j, align 4
  %idxprom3 = zext i32 %14 to i64
  %arrayidx4 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom3
  %15 = load i32, ptr %arrayidx4, align 4
  %tobool5 = icmp ne i32 %15, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.body
  br label %for.end

if.end7:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %16 = load i32, ptr %j, align 4
  %inc8 = add i32 %16, 1
  store i32 %inc8, ptr %j, align 4
  br label %for.cond, !llvm.loop !78

for.end:                                          ; preds = %if.then6, %for.cond
  %17 = load i32, ptr %j, align 4
  store i32 %17, ptr %k, align 4
  %18 = load i32, ptr %l, align 4
  %19 = load i32, ptr %j, align 4
  %cmp9 = icmp ult i32 %18, %19
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.end
  %20 = load i32, ptr %j, align 4
  store i32 %20, ptr %l, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %for.end
  store i32 16, ptr %i, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc20, %if.end11
  %21 = load i32, ptr %i, align 4
  %tobool13 = icmp ne i32 %21, 0
  br i1 %tobool13, label %for.body14, label %for.end22

for.body14:                                       ; preds = %for.cond12
  %22 = load i32, ptr %i, align 4
  %idxprom15 = zext i32 %22 to i64
  %arrayidx16 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom15
  %23 = load i32, ptr %arrayidx16, align 4
  %tobool17 = icmp ne i32 %23, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %for.body14
  br label %for.end22

if.end19:                                         ; preds = %for.body14
  br label %for.inc20

for.inc20:                                        ; preds = %if.end19
  %24 = load i32, ptr %i, align 4
  %dec21 = add i32 %24, -1
  store i32 %dec21, ptr %i, align 4
  br label %for.cond12, !llvm.loop !79

for.end22:                                        ; preds = %if.then18, %for.cond12
  %25 = load i32, ptr %i, align 4
  store i32 %25, ptr %g, align 4
  %26 = load i32, ptr %l, align 4
  %27 = load i32, ptr %i, align 4
  %cmp23 = icmp ugt i32 %26, %27
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %for.end22
  %28 = load i32, ptr %i, align 4
  store i32 %28, ptr %l, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %for.end22
  %29 = load i32, ptr %l, align 4
  %30 = load ptr, ptr %m.addr, align 8
  store i32 %29, ptr %30, align 4
  %31 = load i32, ptr %j, align 4
  %shl = shl i32 1, %31
  store i32 %shl, ptr %y, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc34, %if.end25
  %32 = load i32, ptr %j, align 4
  %33 = load i32, ptr %i, align 4
  %cmp27 = icmp ult i32 %32, %33
  br i1 %cmp27, label %for.body28, label %for.end37

for.body28:                                       ; preds = %for.cond26
  %34 = load i32, ptr %j, align 4
  %idxprom29 = zext i32 %34 to i64
  %arrayidx30 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom29
  %35 = load i32, ptr %arrayidx30, align 4
  %36 = load i32, ptr %y, align 4
  %sub = sub i32 %36, %35
  store i32 %sub, ptr %y, align 4
  %cmp31 = icmp slt i32 %sub, 0
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %for.body28
  store i32 2, ptr %retval, align 4
  br label %return

if.end33:                                         ; preds = %for.body28
  br label %for.inc34

for.inc34:                                        ; preds = %if.end33
  %37 = load i32, ptr %j, align 4
  %inc35 = add i32 %37, 1
  store i32 %inc35, ptr %j, align 4
  %38 = load i32, ptr %y, align 4
  %shl36 = shl i32 %38, 1
  store i32 %shl36, ptr %y, align 4
  br label %for.cond26, !llvm.loop !80

for.end37:                                        ; preds = %for.cond26
  %39 = load i32, ptr %i, align 4
  %idxprom38 = zext i32 %39 to i64
  %arrayidx39 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom38
  %40 = load i32, ptr %arrayidx39, align 4
  %41 = load i32, ptr %y, align 4
  %sub40 = sub i32 %41, %40
  store i32 %sub40, ptr %y, align 4
  %cmp41 = icmp slt i32 %sub40, 0
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %for.end37
  store i32 2, ptr %retval, align 4
  br label %return

if.end43:                                         ; preds = %for.end37
  %42 = load i32, ptr %y, align 4
  %43 = load i32, ptr %i, align 4
  %idxprom44 = zext i32 %43 to i64
  %arrayidx45 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom44
  %44 = load i32, ptr %arrayidx45, align 4
  %add = add i32 %44, %42
  store i32 %add, ptr %arrayidx45, align 4
  store i32 0, ptr %j, align 4
  %arrayidx46 = getelementptr inbounds [17 x i32], ptr %x, i64 0, i64 1
  store i32 0, ptr %arrayidx46, align 4
  %arraydecay47 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 0
  %add.ptr = getelementptr inbounds i32, ptr %arraydecay47, i64 1
  store ptr %add.ptr, ptr %p, align 8
  %arraydecay48 = getelementptr inbounds [17 x i32], ptr %x, i64 0, i64 0
  %add.ptr49 = getelementptr inbounds i32, ptr %arraydecay48, i64 2
  store ptr %add.ptr49, ptr %xp, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end43
  %45 = load i32, ptr %i, align 4
  %dec50 = add i32 %45, -1
  store i32 %dec50, ptr %i, align 4
  %tobool51 = icmp ne i32 %dec50, 0
  br i1 %tobool51, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %46 = load ptr, ptr %p, align 8
  %incdec.ptr52 = getelementptr inbounds i32, ptr %46, i32 1
  store ptr %incdec.ptr52, ptr %p, align 8
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %j, align 4
  %add53 = add i32 %48, %47
  store i32 %add53, ptr %j, align 4
  %49 = load ptr, ptr %xp, align 8
  %incdec.ptr54 = getelementptr inbounds i32, ptr %49, i32 1
  store ptr %incdec.ptr54, ptr %xp, align 8
  store i32 %add53, ptr %49, align 4
  br label %while.cond, !llvm.loop !81

while.end:                                        ; preds = %while.cond
  %50 = load ptr, ptr %b.addr, align 8
  store ptr %50, ptr %p, align 8
  store i32 0, ptr %i, align 4
  br label %do.body55

do.body55:                                        ; preds = %do.cond65, %while.end
  %51 = load ptr, ptr %p, align 8
  %incdec.ptr56 = getelementptr inbounds i32, ptr %51, i32 1
  store ptr %incdec.ptr56, ptr %p, align 8
  %52 = load i32, ptr %51, align 4
  store i32 %52, ptr %j, align 4
  %cmp57 = icmp ne i32 %52, 0
  br i1 %cmp57, label %if.then58, label %if.end64

if.then58:                                        ; preds = %do.body55
  %53 = load i32, ptr %i, align 4
  %54 = load i32, ptr %j, align 4
  %idxprom59 = zext i32 %54 to i64
  %arrayidx60 = getelementptr inbounds [17 x i32], ptr %x, i64 0, i64 %idxprom59
  %55 = load i32, ptr %arrayidx60, align 4
  %inc61 = add i32 %55, 1
  store i32 %inc61, ptr %arrayidx60, align 4
  %idxprom62 = zext i32 %55 to i64
  %arrayidx63 = getelementptr inbounds [288 x i32], ptr %v, i64 0, i64 %idxprom62
  store i32 %53, ptr %arrayidx63, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then58, %do.body55
  br label %do.cond65

do.cond65:                                        ; preds = %if.end64
  %56 = load i32, ptr %i, align 4
  %inc66 = add i32 %56, 1
  store i32 %inc66, ptr %i, align 4
  %57 = load i32, ptr %n.addr, align 4
  %cmp67 = icmp ult i32 %inc66, %57
  br i1 %cmp67, label %do.body55, label %do.end68, !llvm.loop !82

do.end68:                                         ; preds = %do.cond65
  store i32 0, ptr %i, align 4
  %arrayidx69 = getelementptr inbounds [17 x i32], ptr %x, i64 0, i64 0
  store i32 0, ptr %arrayidx69, align 16
  %arraydecay70 = getelementptr inbounds [288 x i32], ptr %v, i64 0, i64 0
  store ptr %arraydecay70, ptr %p, align 8
  store i32 -1, ptr %h, align 4
  %58 = load i32, ptr %l, align 4
  %sub71 = sub nsw i32 0, %58
  store i32 %sub71, ptr %w, align 4
  %arrayidx72 = getelementptr inbounds [16 x ptr], ptr %u, i64 0, i64 0
  store ptr null, ptr %arrayidx72, align 16
  store ptr null, ptr %q, align 8
  store i32 0, ptr %z, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc215, %do.end68
  %59 = load i32, ptr %k, align 4
  %60 = load i32, ptr %g, align 4
  %cmp74 = icmp sle i32 %59, %60
  br i1 %cmp74, label %for.body75, label %for.end217

for.body75:                                       ; preds = %for.cond73
  %61 = load i32, ptr %k, align 4
  %idxprom76 = sext i32 %61 to i64
  %arrayidx77 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 %idxprom76
  %62 = load i32, ptr %arrayidx77, align 4
  store i32 %62, ptr %a, align 4
  br label %while.cond78

while.cond78:                                     ; preds = %while.end213, %for.body75
  %63 = load i32, ptr %a, align 4
  %dec79 = add i32 %63, -1
  store i32 %dec79, ptr %a, align 4
  %tobool80 = icmp ne i32 %63, 0
  br i1 %tobool80, label %while.body81, label %while.end214

while.body81:                                     ; preds = %while.cond78
  br label %while.cond82

while.cond82:                                     ; preds = %if.end145, %while.body81
  %64 = load i32, ptr %k, align 4
  %65 = load i32, ptr %w, align 4
  %66 = load i32, ptr %l, align 4
  %add83 = add nsw i32 %65, %66
  %cmp84 = icmp sgt i32 %64, %add83
  br i1 %cmp84, label %while.body85, label %while.end146

while.body85:                                     ; preds = %while.cond82
  %67 = load i32, ptr %h, align 4
  %inc86 = add nsw i32 %67, 1
  store i32 %inc86, ptr %h, align 4
  %68 = load i32, ptr %l, align 4
  %69 = load i32, ptr %w, align 4
  %add87 = add nsw i32 %69, %68
  store i32 %add87, ptr %w, align 4
  %70 = load i32, ptr %g, align 4
  %71 = load i32, ptr %w, align 4
  %sub88 = sub nsw i32 %70, %71
  store i32 %sub88, ptr %z, align 4
  %72 = load i32, ptr %l, align 4
  %cmp89 = icmp ugt i32 %sub88, %72
  br i1 %cmp89, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body85
  %73 = load i32, ptr %l, align 4
  br label %cond.end

cond.false:                                       ; preds = %while.body85
  %74 = load i32, ptr %z, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %73, %cond.true ], [ %74, %cond.false ]
  store i32 %cond, ptr %z, align 4
  %75 = load i32, ptr %k, align 4
  %76 = load i32, ptr %w, align 4
  %sub90 = sub nsw i32 %75, %76
  store i32 %sub90, ptr %j, align 4
  %shl91 = shl i32 1, %sub90
  store i32 %shl91, ptr %f, align 4
  %77 = load i32, ptr %a, align 4
  %add92 = add i32 %77, 1
  %cmp93 = icmp ugt i32 %shl91, %add92
  br i1 %cmp93, label %if.then94, label %if.end110

if.then94:                                        ; preds = %cond.end
  %78 = load i32, ptr %a, align 4
  %add95 = add i32 %78, 1
  %79 = load i32, ptr %f, align 4
  %sub96 = sub i32 %79, %add95
  store i32 %sub96, ptr %f, align 4
  %arraydecay97 = getelementptr inbounds [17 x i32], ptr %c, i64 0, i64 0
  %80 = load i32, ptr %k, align 4
  %idx.ext = sext i32 %80 to i64
  %add.ptr98 = getelementptr inbounds i32, ptr %arraydecay97, i64 %idx.ext
  store ptr %add.ptr98, ptr %xp, align 8
  br label %while.cond99

while.cond99:                                     ; preds = %if.end107, %if.then94
  %81 = load i32, ptr %j, align 4
  %inc100 = add i32 %81, 1
  store i32 %inc100, ptr %j, align 4
  %82 = load i32, ptr %z, align 4
  %cmp101 = icmp ult i32 %inc100, %82
  br i1 %cmp101, label %while.body102, label %while.end109

while.body102:                                    ; preds = %while.cond99
  %83 = load i32, ptr %f, align 4
  %shl103 = shl i32 %83, 1
  store i32 %shl103, ptr %f, align 4
  %84 = load ptr, ptr %xp, align 8
  %incdec.ptr104 = getelementptr inbounds i32, ptr %84, i32 1
  store ptr %incdec.ptr104, ptr %xp, align 8
  %85 = load i32, ptr %incdec.ptr104, align 4
  %cmp105 = icmp ule i32 %shl103, %85
  br i1 %cmp105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %while.body102
  br label %while.end109

if.end107:                                        ; preds = %while.body102
  %86 = load ptr, ptr %xp, align 8
  %87 = load i32, ptr %86, align 4
  %88 = load i32, ptr %f, align 4
  %sub108 = sub i32 %88, %87
  store i32 %sub108, ptr %f, align 4
  br label %while.cond99, !llvm.loop !83

while.end109:                                     ; preds = %if.then106, %while.cond99
  br label %if.end110

if.end110:                                        ; preds = %while.end109, %cond.end
  %89 = load i32, ptr %j, align 4
  %shl111 = shl i32 1, %89
  store i32 %shl111, ptr %z, align 4
  %90 = load i32, ptr %z, align 4
  %add112 = add i32 %90, 1
  %conv = zext i32 %add112 to i64
  %mul = mul i64 %conv, 16
  %call = call noalias ptr @malloc(i64 noundef %mul) #14
  store ptr %call, ptr %q, align 8
  %cmp113 = icmp eq ptr %call, null
  br i1 %cmp113, label %if.then115, label %if.end121

if.then115:                                       ; preds = %if.end110
  %91 = load i32, ptr %h, align 4
  %tobool116 = icmp ne i32 %91, 0
  br i1 %tobool116, label %if.then117, label %if.end120

if.then117:                                       ; preds = %if.then115
  %arrayidx118 = getelementptr inbounds [16 x ptr], ptr %u, i64 0, i64 0
  %92 = load ptr, ptr %arrayidx118, align 16
  %call119 = call i32 @huft_free(ptr noundef %92)
  br label %if.end120

if.end120:                                        ; preds = %if.then117, %if.then115
  store i32 3, ptr %retval, align 4
  br label %return

if.end121:                                        ; preds = %if.end110
  %93 = load i32, ptr %z, align 4
  %add122 = add i32 %93, 1
  %94 = load i32, ptr @hufts, align 4
  %add123 = add i32 %94, %add122
  store i32 %add123, ptr @hufts, align 4
  %95 = load ptr, ptr %q, align 8
  %add.ptr124 = getelementptr inbounds %struct.huft, ptr %95, i64 1
  %96 = load ptr, ptr %t.addr, align 8
  store ptr %add.ptr124, ptr %96, align 8
  %97 = load ptr, ptr %q, align 8
  %v125 = getelementptr inbounds %struct.huft, ptr %97, i32 0, i32 2
  store ptr %v125, ptr %t.addr, align 8
  store ptr null, ptr %v125, align 8
  %98 = load ptr, ptr %q, align 8
  %incdec.ptr126 = getelementptr inbounds %struct.huft, ptr %98, i32 1
  store ptr %incdec.ptr126, ptr %q, align 8
  %99 = load i32, ptr %h, align 4
  %idxprom127 = sext i32 %99 to i64
  %arrayidx128 = getelementptr inbounds [16 x ptr], ptr %u, i64 0, i64 %idxprom127
  store ptr %incdec.ptr126, ptr %arrayidx128, align 8
  %100 = load i32, ptr %h, align 4
  %tobool129 = icmp ne i32 %100, 0
  br i1 %tobool129, label %if.then130, label %if.end145

if.then130:                                       ; preds = %if.end121
  %101 = load i32, ptr %i, align 4
  %102 = load i32, ptr %h, align 4
  %idxprom131 = sext i32 %102 to i64
  %arrayidx132 = getelementptr inbounds [17 x i32], ptr %x, i64 0, i64 %idxprom131
  store i32 %101, ptr %arrayidx132, align 4
  %103 = load i32, ptr %l, align 4
  %conv133 = trunc i32 %103 to i8
  %b134 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 1
  store i8 %conv133, ptr %b134, align 1
  %104 = load i32, ptr %j, align 4
  %add135 = add i32 16, %104
  %conv136 = trunc i32 %add135 to i8
  %e137 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 0
  store i8 %conv136, ptr %e137, align 8
  %105 = load ptr, ptr %q, align 8
  %v138 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 2
  store ptr %105, ptr %v138, align 8
  %106 = load i32, ptr %i, align 4
  %107 = load i32, ptr %w, align 4
  %108 = load i32, ptr %l, align 4
  %sub139 = sub nsw i32 %107, %108
  %shr = lshr i32 %106, %sub139
  store i32 %shr, ptr %j, align 4
  %109 = load i32, ptr %h, align 4
  %sub140 = sub nsw i32 %109, 1
  %idxprom141 = sext i32 %sub140 to i64
  %arrayidx142 = getelementptr inbounds [16 x ptr], ptr %u, i64 0, i64 %idxprom141
  %110 = load ptr, ptr %arrayidx142, align 8
  %111 = load i32, ptr %j, align 4
  %idxprom143 = zext i32 %111 to i64
  %arrayidx144 = getelementptr inbounds %struct.huft, ptr %110, i64 %idxprom143
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %arrayidx144, ptr align 8 %r, i64 16, i1 false)
  br label %if.end145

if.end145:                                        ; preds = %if.then130, %if.end121
  br label %while.cond82, !llvm.loop !84

while.end146:                                     ; preds = %while.cond82
  %112 = load i32, ptr %k, align 4
  %113 = load i32, ptr %w, align 4
  %sub147 = sub nsw i32 %112, %113
  %conv148 = trunc i32 %sub147 to i8
  %b149 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 1
  store i8 %conv148, ptr %b149, align 1
  %114 = load ptr, ptr %p, align 8
  %arraydecay150 = getelementptr inbounds [288 x i32], ptr %v, i64 0, i64 0
  %115 = load i32, ptr %n.addr, align 4
  %idx.ext151 = zext i32 %115 to i64
  %add.ptr152 = getelementptr inbounds i32, ptr %arraydecay150, i64 %idx.ext151
  %cmp153 = icmp uge ptr %114, %add.ptr152
  br i1 %cmp153, label %if.then155, label %if.else

if.then155:                                       ; preds = %while.end146
  %e156 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 0
  store i8 99, ptr %e156, align 8
  br label %if.end180

if.else:                                          ; preds = %while.end146
  %116 = load ptr, ptr %p, align 8
  %117 = load i32, ptr %116, align 4
  %118 = load i32, ptr %s.addr, align 4
  %cmp157 = icmp ult i32 %117, %118
  br i1 %cmp157, label %if.then159, label %if.else168

if.then159:                                       ; preds = %if.else
  %119 = load ptr, ptr %p, align 8
  %120 = load i32, ptr %119, align 4
  %cmp160 = icmp ult i32 %120, 256
  %121 = zext i1 %cmp160 to i64
  %cond162 = select i1 %cmp160, i32 16, i32 15
  %conv163 = trunc i32 %cond162 to i8
  %e164 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 0
  store i8 %conv163, ptr %e164, align 8
  %122 = load ptr, ptr %p, align 8
  %123 = load i32, ptr %122, align 4
  %conv165 = trunc i32 %123 to i16
  %v166 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 2
  store i16 %conv165, ptr %v166, align 8
  %124 = load ptr, ptr %p, align 8
  %incdec.ptr167 = getelementptr inbounds i32, ptr %124, i32 1
  store ptr %incdec.ptr167, ptr %p, align 8
  br label %if.end179

if.else168:                                       ; preds = %if.else
  %125 = load ptr, ptr %e.addr, align 8
  %126 = load ptr, ptr %p, align 8
  %127 = load i32, ptr %126, align 4
  %128 = load i32, ptr %s.addr, align 4
  %sub169 = sub i32 %127, %128
  %idxprom170 = zext i32 %sub169 to i64
  %arrayidx171 = getelementptr inbounds i16, ptr %125, i64 %idxprom170
  %129 = load i16, ptr %arrayidx171, align 2
  %conv172 = trunc i16 %129 to i8
  %e173 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 0
  store i8 %conv172, ptr %e173, align 8
  %130 = load ptr, ptr %d.addr, align 8
  %131 = load ptr, ptr %p, align 8
  %incdec.ptr174 = getelementptr inbounds i32, ptr %131, i32 1
  store ptr %incdec.ptr174, ptr %p, align 8
  %132 = load i32, ptr %131, align 4
  %133 = load i32, ptr %s.addr, align 4
  %sub175 = sub i32 %132, %133
  %idxprom176 = zext i32 %sub175 to i64
  %arrayidx177 = getelementptr inbounds i16, ptr %130, i64 %idxprom176
  %134 = load i16, ptr %arrayidx177, align 2
  %v178 = getelementptr inbounds %struct.huft, ptr %r, i32 0, i32 2
  store i16 %134, ptr %v178, align 8
  br label %if.end179

if.end179:                                        ; preds = %if.else168, %if.then159
  br label %if.end180

if.end180:                                        ; preds = %if.end179, %if.then155
  %135 = load i32, ptr %k, align 4
  %136 = load i32, ptr %w, align 4
  %sub181 = sub nsw i32 %135, %136
  %shl182 = shl i32 1, %sub181
  store i32 %shl182, ptr %f, align 4
  %137 = load i32, ptr %i, align 4
  %138 = load i32, ptr %w, align 4
  %shr183 = lshr i32 %137, %138
  store i32 %shr183, ptr %j, align 4
  br label %for.cond184

for.cond184:                                      ; preds = %for.inc190, %if.end180
  %139 = load i32, ptr %j, align 4
  %140 = load i32, ptr %z, align 4
  %cmp185 = icmp ult i32 %139, %140
  br i1 %cmp185, label %for.body187, label %for.end192

for.body187:                                      ; preds = %for.cond184
  %141 = load ptr, ptr %q, align 8
  %142 = load i32, ptr %j, align 4
  %idxprom188 = zext i32 %142 to i64
  %arrayidx189 = getelementptr inbounds %struct.huft, ptr %141, i64 %idxprom188
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %arrayidx189, ptr align 8 %r, i64 16, i1 false)
  br label %for.inc190

for.inc190:                                       ; preds = %for.body187
  %143 = load i32, ptr %f, align 4
  %144 = load i32, ptr %j, align 4
  %add191 = add i32 %144, %143
  store i32 %add191, ptr %j, align 4
  br label %for.cond184, !llvm.loop !85

for.end192:                                       ; preds = %for.cond184
  %145 = load i32, ptr %k, align 4
  %sub193 = sub nsw i32 %145, 1
  %shl194 = shl i32 1, %sub193
  store i32 %shl194, ptr %j, align 4
  br label %for.cond195

for.cond195:                                      ; preds = %for.inc198, %for.end192
  %146 = load i32, ptr %i, align 4
  %147 = load i32, ptr %j, align 4
  %and = and i32 %146, %147
  %tobool196 = icmp ne i32 %and, 0
  br i1 %tobool196, label %for.body197, label %for.end200

for.body197:                                      ; preds = %for.cond195
  %148 = load i32, ptr %j, align 4
  %149 = load i32, ptr %i, align 4
  %xor = xor i32 %149, %148
  store i32 %xor, ptr %i, align 4
  br label %for.inc198

for.inc198:                                       ; preds = %for.body197
  %150 = load i32, ptr %j, align 4
  %shr199 = lshr i32 %150, 1
  store i32 %shr199, ptr %j, align 4
  br label %for.cond195, !llvm.loop !86

for.end200:                                       ; preds = %for.cond195
  %151 = load i32, ptr %j, align 4
  %152 = load i32, ptr %i, align 4
  %xor201 = xor i32 %152, %151
  store i32 %xor201, ptr %i, align 4
  br label %while.cond202

while.cond202:                                    ; preds = %while.body210, %for.end200
  %153 = load i32, ptr %i, align 4
  %154 = load i32, ptr %w, align 4
  %shl203 = shl i32 1, %154
  %sub204 = sub nsw i32 %shl203, 1
  %and205 = and i32 %153, %sub204
  %155 = load i32, ptr %h, align 4
  %idxprom206 = sext i32 %155 to i64
  %arrayidx207 = getelementptr inbounds [17 x i32], ptr %x, i64 0, i64 %idxprom206
  %156 = load i32, ptr %arrayidx207, align 4
  %cmp208 = icmp ne i32 %and205, %156
  br i1 %cmp208, label %while.body210, label %while.end213

while.body210:                                    ; preds = %while.cond202
  %157 = load i32, ptr %h, align 4
  %dec211 = add nsw i32 %157, -1
  store i32 %dec211, ptr %h, align 4
  %158 = load i32, ptr %l, align 4
  %159 = load i32, ptr %w, align 4
  %sub212 = sub nsw i32 %159, %158
  store i32 %sub212, ptr %w, align 4
  br label %while.cond202, !llvm.loop !87

while.end213:                                     ; preds = %while.cond202
  br label %while.cond78, !llvm.loop !88

while.end214:                                     ; preds = %while.cond78
  br label %for.inc215

for.inc215:                                       ; preds = %while.end214
  %160 = load i32, ptr %k, align 4
  %inc216 = add nsw i32 %160, 1
  store i32 %inc216, ptr %k, align 4
  br label %for.cond73, !llvm.loop !89

for.end217:                                       ; preds = %for.cond73
  %161 = load i32, ptr %y, align 4
  %cmp218 = icmp ne i32 %161, 0
  br i1 %cmp218, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.end217
  %162 = load i32, ptr %g, align 4
  %cmp220 = icmp ne i32 %162, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end217
  %163 = phi i1 [ false, %for.end217 ], [ %cmp220, %land.rhs ]
  %land.ext = zext i1 %163 to i32
  store i32 %land.ext, ptr %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.end120, %if.then42, %if.then32, %if.then
  %164 = load i32, ptr %retval, align 4
  ret i32 %164
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @huft_free(ptr noundef %t) #0 {
entry:
  %t.addr = alloca ptr, align 8
  %p = alloca ptr, align 8
  %q = alloca ptr, align 8
  store ptr %t, ptr %t.addr, align 8
  %0 = load ptr, ptr %t.addr, align 8
  store ptr %0, ptr %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load ptr, ptr %p, align 8
  %cmp = icmp ne ptr %1, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds %struct.huft, ptr %2, i32 -1
  store ptr %incdec.ptr, ptr %p, align 8
  %v = getelementptr inbounds %struct.huft, ptr %incdec.ptr, i32 0, i32 2
  %3 = load ptr, ptr %v, align 8
  store ptr %3, ptr %q, align 8
  %4 = load ptr, ptr %p, align 8
  call void @free(ptr noundef %4) #11
  %5 = load ptr, ptr %q, align 8
  store ptr %5, ptr %p, align 8
  br label %while.cond, !llvm.loop !90

while.end:                                        ; preds = %while.cond
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inflate_codes(ptr noundef %tl, ptr noundef %td, i32 noundef %bl, i32 noundef %bd) #0 {
entry:
  %retval = alloca i32, align 4
  %tl.addr = alloca ptr, align 8
  %td.addr = alloca ptr, align 8
  %bl.addr = alloca i32, align 4
  %bd.addr = alloca i32, align 4
  %e = alloca i32, align 4
  %n = alloca i32, align 4
  %d = alloca i32, align 4
  %w = alloca i32, align 4
  %t = alloca ptr, align 8
  %ml = alloca i32, align 4
  %md = alloca i32, align 4
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  store ptr %tl, ptr %tl.addr, align 8
  store ptr %td, ptr %td.addr, align 8
  store i32 %bl, ptr %bl.addr, align 4
  store i32 %bd, ptr %bd.addr, align 4
  %0 = load i64, ptr @bb, align 8
  store i64 %0, ptr %b, align 8
  %1 = load i32, ptr @bk, align 4
  store i32 %1, ptr %k, align 4
  %2 = load i32, ptr @outcnt, align 4
  store i32 %2, ptr %w, align 4
  %3 = load i32, ptr %bl.addr, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom
  %4 = load i16, ptr %arrayidx, align 2
  %conv = zext i16 %4 to i32
  store i32 %conv, ptr %ml, align 4
  %5 = load i32, ptr %bd.addr, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom1
  %6 = load i16, ptr %arrayidx2, align 2
  %conv3 = zext i16 %6 to i32
  store i32 %conv3, ptr %md, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end283, %entry
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %for.cond
  %7 = load i32, ptr %k, align 4
  %8 = load i32, ptr %bl.addr, align 4
  %cmp = icmp ult i32 %7, %8
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32, ptr @inptr, align 4
  %10 = load i32, ptr @insize, align 4
  %cmp5 = icmp ult i32 %9, %10
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %11 = load i32, ptr @inptr, align 4
  %inc = add i32 %11, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom7 = zext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom7
  %12 = load i8, ptr %arrayidx8, align 1
  %conv9 = zext i8 %12 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv9, %cond.true ], [ %call, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %conv11 = zext i8 %conv10 to i64
  %13 = load i32, ptr %k, align 4
  %sh_prom = zext i32 %13 to i64
  %shl = shl i64 %conv11, %sh_prom
  %14 = load i64, ptr %b, align 8
  %or = or i64 %14, %shl
  store i64 %or, ptr %b, align 8
  %15 = load i32, ptr %k, align 4
  %add = add i32 %15, 8
  store i32 %add, ptr %k, align 4
  br label %while.cond, !llvm.loop !91

while.end:                                        ; preds = %while.cond
  %16 = load ptr, ptr %tl.addr, align 8
  %17 = load i64, ptr %b, align 8
  %conv12 = trunc i64 %17 to i32
  %18 = load i32, ptr %ml, align 4
  %and = and i32 %conv12, %18
  %idx.ext = zext i32 %and to i64
  %add.ptr = getelementptr inbounds %struct.huft, ptr %16, i64 %idx.ext
  store ptr %add.ptr, ptr %t, align 8
  %e13 = getelementptr inbounds %struct.huft, ptr %add.ptr, i32 0, i32 0
  %19 = load i8, ptr %e13, align 8
  %conv14 = zext i8 %19 to i32
  store i32 %conv14, ptr %e, align 4
  %cmp15 = icmp ugt i32 %conv14, 16
  br i1 %cmp15, label %if.then, label %if.end59

if.then:                                          ; preds = %while.end
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %20 = load i32, ptr %e, align 4
  %cmp17 = icmp eq i32 %20, 99
  br i1 %cmp17, label %if.then19, label %if.end

if.then19:                                        ; preds = %do.body
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %do.body
  %21 = load ptr, ptr %t, align 8
  %b20 = getelementptr inbounds %struct.huft, ptr %21, i32 0, i32 1
  %22 = load i8, ptr %b20, align 1
  %conv21 = zext i8 %22 to i32
  %23 = load i64, ptr %b, align 8
  %sh_prom22 = zext i32 %conv21 to i64
  %shr = lshr i64 %23, %sh_prom22
  store i64 %shr, ptr %b, align 8
  %24 = load ptr, ptr %t, align 8
  %b23 = getelementptr inbounds %struct.huft, ptr %24, i32 0, i32 1
  %25 = load i8, ptr %b23, align 1
  %conv24 = zext i8 %25 to i32
  %26 = load i32, ptr %k, align 4
  %sub = sub i32 %26, %conv24
  store i32 %sub, ptr %k, align 4
  %27 = load i32, ptr %e, align 4
  %sub25 = sub i32 %27, 16
  store i32 %sub25, ptr %e, align 4
  br label %while.cond26

while.cond26:                                     ; preds = %cond.end39, %if.end
  %28 = load i32, ptr %k, align 4
  %29 = load i32, ptr %e, align 4
  %cmp27 = icmp ult i32 %28, %29
  br i1 %cmp27, label %while.body29, label %while.end47

while.body29:                                     ; preds = %while.cond26
  %30 = load i32, ptr @inptr, align 4
  %31 = load i32, ptr @insize, align 4
  %cmp30 = icmp ult i32 %30, %31
  br i1 %cmp30, label %cond.true32, label %cond.false37

cond.true32:                                      ; preds = %while.body29
  %32 = load i32, ptr @inptr, align 4
  %inc33 = add i32 %32, 1
  store i32 %inc33, ptr @inptr, align 4
  %idxprom34 = zext i32 %32 to i64
  %arrayidx35 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom34
  %33 = load i8, ptr %arrayidx35, align 1
  %conv36 = zext i8 %33 to i32
  br label %cond.end39

cond.false37:                                     ; preds = %while.body29
  %call38 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end39

cond.end39:                                       ; preds = %cond.false37, %cond.true32
  %cond40 = phi i32 [ %conv36, %cond.true32 ], [ %call38, %cond.false37 ]
  %conv41 = trunc i32 %cond40 to i8
  %conv42 = zext i8 %conv41 to i64
  %34 = load i32, ptr %k, align 4
  %sh_prom43 = zext i32 %34 to i64
  %shl44 = shl i64 %conv42, %sh_prom43
  %35 = load i64, ptr %b, align 8
  %or45 = or i64 %35, %shl44
  store i64 %or45, ptr %b, align 8
  %36 = load i32, ptr %k, align 4
  %add46 = add i32 %36, 8
  store i32 %add46, ptr %k, align 4
  br label %while.cond26, !llvm.loop !92

while.end47:                                      ; preds = %while.cond26
  br label %do.cond

do.cond:                                          ; preds = %while.end47
  %37 = load ptr, ptr %t, align 8
  %v = getelementptr inbounds %struct.huft, ptr %37, i32 0, i32 2
  %38 = load ptr, ptr %v, align 8
  %39 = load i64, ptr %b, align 8
  %conv48 = trunc i64 %39 to i32
  %40 = load i32, ptr %e, align 4
  %idxprom49 = zext i32 %40 to i64
  %arrayidx50 = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom49
  %41 = load i16, ptr %arrayidx50, align 2
  %conv51 = zext i16 %41 to i32
  %and52 = and i32 %conv48, %conv51
  %idx.ext53 = zext i32 %and52 to i64
  %add.ptr54 = getelementptr inbounds %struct.huft, ptr %38, i64 %idx.ext53
  store ptr %add.ptr54, ptr %t, align 8
  %e55 = getelementptr inbounds %struct.huft, ptr %add.ptr54, i32 0, i32 0
  %42 = load i8, ptr %e55, align 8
  %conv56 = zext i8 %42 to i32
  store i32 %conv56, ptr %e, align 4
  %cmp57 = icmp ugt i32 %conv56, 16
  br i1 %cmp57, label %do.body, label %do.end, !llvm.loop !93

do.end:                                           ; preds = %do.cond
  br label %if.end59

if.end59:                                         ; preds = %do.end, %while.end
  %43 = load ptr, ptr %t, align 8
  %b60 = getelementptr inbounds %struct.huft, ptr %43, i32 0, i32 1
  %44 = load i8, ptr %b60, align 1
  %conv61 = zext i8 %44 to i32
  %45 = load i64, ptr %b, align 8
  %sh_prom62 = zext i32 %conv61 to i64
  %shr63 = lshr i64 %45, %sh_prom62
  store i64 %shr63, ptr %b, align 8
  %46 = load ptr, ptr %t, align 8
  %b64 = getelementptr inbounds %struct.huft, ptr %46, i32 0, i32 1
  %47 = load i8, ptr %b64, align 1
  %conv65 = zext i8 %47 to i32
  %48 = load i32, ptr %k, align 4
  %sub66 = sub i32 %48, %conv65
  store i32 %sub66, ptr %k, align 4
  %49 = load i32, ptr %e, align 4
  %cmp67 = icmp eq i32 %49, 16
  br i1 %cmp67, label %if.then69, label %if.else

if.then69:                                        ; preds = %if.end59
  %50 = load ptr, ptr %t, align 8
  %v70 = getelementptr inbounds %struct.huft, ptr %50, i32 0, i32 2
  %51 = load i16, ptr %v70, align 8
  %conv71 = trunc i16 %51 to i8
  %52 = load i32, ptr %w, align 4
  %inc72 = add i32 %52, 1
  store i32 %inc72, ptr %w, align 4
  %idxprom73 = zext i32 %52 to i64
  %arrayidx74 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom73
  store i8 %conv71, ptr %arrayidx74, align 1
  %53 = load i32, ptr %w, align 4
  %cmp75 = icmp eq i32 %53, 32768
  br i1 %cmp75, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.then69
  %54 = load i32, ptr %w, align 4
  store i32 %54, ptr @outcnt, align 4
  call void @flush_window()
  store i32 0, ptr %w, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %if.then69
  br label %if.end283

if.else:                                          ; preds = %if.end59
  %55 = load i32, ptr %e, align 4
  %cmp79 = icmp eq i32 %55, 15
  br i1 %cmp79, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.else
  br label %for.end

if.end82:                                         ; preds = %if.else
  br label %while.cond83

while.cond83:                                     ; preds = %cond.end96, %if.end82
  %56 = load i32, ptr %k, align 4
  %57 = load i32, ptr %e, align 4
  %cmp84 = icmp ult i32 %56, %57
  br i1 %cmp84, label %while.body86, label %while.end104

while.body86:                                     ; preds = %while.cond83
  %58 = load i32, ptr @inptr, align 4
  %59 = load i32, ptr @insize, align 4
  %cmp87 = icmp ult i32 %58, %59
  br i1 %cmp87, label %cond.true89, label %cond.false94

cond.true89:                                      ; preds = %while.body86
  %60 = load i32, ptr @inptr, align 4
  %inc90 = add i32 %60, 1
  store i32 %inc90, ptr @inptr, align 4
  %idxprom91 = zext i32 %60 to i64
  %arrayidx92 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom91
  %61 = load i8, ptr %arrayidx92, align 1
  %conv93 = zext i8 %61 to i32
  br label %cond.end96

cond.false94:                                     ; preds = %while.body86
  %call95 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end96

cond.end96:                                       ; preds = %cond.false94, %cond.true89
  %cond97 = phi i32 [ %conv93, %cond.true89 ], [ %call95, %cond.false94 ]
  %conv98 = trunc i32 %cond97 to i8
  %conv99 = zext i8 %conv98 to i64
  %62 = load i32, ptr %k, align 4
  %sh_prom100 = zext i32 %62 to i64
  %shl101 = shl i64 %conv99, %sh_prom100
  %63 = load i64, ptr %b, align 8
  %or102 = or i64 %63, %shl101
  store i64 %or102, ptr %b, align 8
  %64 = load i32, ptr %k, align 4
  %add103 = add i32 %64, 8
  store i32 %add103, ptr %k, align 4
  br label %while.cond83, !llvm.loop !94

while.end104:                                     ; preds = %while.cond83
  %65 = load ptr, ptr %t, align 8
  %v105 = getelementptr inbounds %struct.huft, ptr %65, i32 0, i32 2
  %66 = load i16, ptr %v105, align 8
  %conv106 = zext i16 %66 to i32
  %67 = load i64, ptr %b, align 8
  %conv107 = trunc i64 %67 to i32
  %68 = load i32, ptr %e, align 4
  %idxprom108 = zext i32 %68 to i64
  %arrayidx109 = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom108
  %69 = load i16, ptr %arrayidx109, align 2
  %conv110 = zext i16 %69 to i32
  %and111 = and i32 %conv107, %conv110
  %add112 = add i32 %conv106, %and111
  store i32 %add112, ptr %n, align 4
  %70 = load i32, ptr %e, align 4
  %71 = load i64, ptr %b, align 8
  %sh_prom113 = zext i32 %70 to i64
  %shr114 = lshr i64 %71, %sh_prom113
  store i64 %shr114, ptr %b, align 8
  %72 = load i32, ptr %e, align 4
  %73 = load i32, ptr %k, align 4
  %sub115 = sub i32 %73, %72
  store i32 %sub115, ptr %k, align 4
  br label %while.cond116

while.cond116:                                    ; preds = %cond.end129, %while.end104
  %74 = load i32, ptr %k, align 4
  %75 = load i32, ptr %bd.addr, align 4
  %cmp117 = icmp ult i32 %74, %75
  br i1 %cmp117, label %while.body119, label %while.end137

while.body119:                                    ; preds = %while.cond116
  %76 = load i32, ptr @inptr, align 4
  %77 = load i32, ptr @insize, align 4
  %cmp120 = icmp ult i32 %76, %77
  br i1 %cmp120, label %cond.true122, label %cond.false127

cond.true122:                                     ; preds = %while.body119
  %78 = load i32, ptr @inptr, align 4
  %inc123 = add i32 %78, 1
  store i32 %inc123, ptr @inptr, align 4
  %idxprom124 = zext i32 %78 to i64
  %arrayidx125 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom124
  %79 = load i8, ptr %arrayidx125, align 1
  %conv126 = zext i8 %79 to i32
  br label %cond.end129

cond.false127:                                    ; preds = %while.body119
  %call128 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end129

cond.end129:                                      ; preds = %cond.false127, %cond.true122
  %cond130 = phi i32 [ %conv126, %cond.true122 ], [ %call128, %cond.false127 ]
  %conv131 = trunc i32 %cond130 to i8
  %conv132 = zext i8 %conv131 to i64
  %80 = load i32, ptr %k, align 4
  %sh_prom133 = zext i32 %80 to i64
  %shl134 = shl i64 %conv132, %sh_prom133
  %81 = load i64, ptr %b, align 8
  %or135 = or i64 %81, %shl134
  store i64 %or135, ptr %b, align 8
  %82 = load i32, ptr %k, align 4
  %add136 = add i32 %82, 8
  store i32 %add136, ptr %k, align 4
  br label %while.cond116, !llvm.loop !95

while.end137:                                     ; preds = %while.cond116
  %83 = load ptr, ptr %td.addr, align 8
  %84 = load i64, ptr %b, align 8
  %conv138 = trunc i64 %84 to i32
  %85 = load i32, ptr %md, align 4
  %and139 = and i32 %conv138, %85
  %idx.ext140 = zext i32 %and139 to i64
  %add.ptr141 = getelementptr inbounds %struct.huft, ptr %83, i64 %idx.ext140
  store ptr %add.ptr141, ptr %t, align 8
  %e142 = getelementptr inbounds %struct.huft, ptr %add.ptr141, i32 0, i32 0
  %86 = load i8, ptr %e142, align 8
  %conv143 = zext i8 %86 to i32
  store i32 %conv143, ptr %e, align 4
  %cmp144 = icmp ugt i32 %conv143, 16
  br i1 %cmp144, label %if.then146, label %if.end196

if.then146:                                       ; preds = %while.end137
  br label %do.body147

do.body147:                                       ; preds = %do.cond182, %if.then146
  %87 = load i32, ptr %e, align 4
  %cmp148 = icmp eq i32 %87, 99
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %do.body147
  store i32 1, ptr %retval, align 4
  br label %return

if.end151:                                        ; preds = %do.body147
  %88 = load ptr, ptr %t, align 8
  %b152 = getelementptr inbounds %struct.huft, ptr %88, i32 0, i32 1
  %89 = load i8, ptr %b152, align 1
  %conv153 = zext i8 %89 to i32
  %90 = load i64, ptr %b, align 8
  %sh_prom154 = zext i32 %conv153 to i64
  %shr155 = lshr i64 %90, %sh_prom154
  store i64 %shr155, ptr %b, align 8
  %91 = load ptr, ptr %t, align 8
  %b156 = getelementptr inbounds %struct.huft, ptr %91, i32 0, i32 1
  %92 = load i8, ptr %b156, align 1
  %conv157 = zext i8 %92 to i32
  %93 = load i32, ptr %k, align 4
  %sub158 = sub i32 %93, %conv157
  store i32 %sub158, ptr %k, align 4
  %94 = load i32, ptr %e, align 4
  %sub159 = sub i32 %94, 16
  store i32 %sub159, ptr %e, align 4
  br label %while.cond160

while.cond160:                                    ; preds = %cond.end173, %if.end151
  %95 = load i32, ptr %k, align 4
  %96 = load i32, ptr %e, align 4
  %cmp161 = icmp ult i32 %95, %96
  br i1 %cmp161, label %while.body163, label %while.end181

while.body163:                                    ; preds = %while.cond160
  %97 = load i32, ptr @inptr, align 4
  %98 = load i32, ptr @insize, align 4
  %cmp164 = icmp ult i32 %97, %98
  br i1 %cmp164, label %cond.true166, label %cond.false171

cond.true166:                                     ; preds = %while.body163
  %99 = load i32, ptr @inptr, align 4
  %inc167 = add i32 %99, 1
  store i32 %inc167, ptr @inptr, align 4
  %idxprom168 = zext i32 %99 to i64
  %arrayidx169 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom168
  %100 = load i8, ptr %arrayidx169, align 1
  %conv170 = zext i8 %100 to i32
  br label %cond.end173

cond.false171:                                    ; preds = %while.body163
  %call172 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end173

cond.end173:                                      ; preds = %cond.false171, %cond.true166
  %cond174 = phi i32 [ %conv170, %cond.true166 ], [ %call172, %cond.false171 ]
  %conv175 = trunc i32 %cond174 to i8
  %conv176 = zext i8 %conv175 to i64
  %101 = load i32, ptr %k, align 4
  %sh_prom177 = zext i32 %101 to i64
  %shl178 = shl i64 %conv176, %sh_prom177
  %102 = load i64, ptr %b, align 8
  %or179 = or i64 %102, %shl178
  store i64 %or179, ptr %b, align 8
  %103 = load i32, ptr %k, align 4
  %add180 = add i32 %103, 8
  store i32 %add180, ptr %k, align 4
  br label %while.cond160, !llvm.loop !96

while.end181:                                     ; preds = %while.cond160
  br label %do.cond182

do.cond182:                                       ; preds = %while.end181
  %104 = load ptr, ptr %t, align 8
  %v183 = getelementptr inbounds %struct.huft, ptr %104, i32 0, i32 2
  %105 = load ptr, ptr %v183, align 8
  %106 = load i64, ptr %b, align 8
  %conv184 = trunc i64 %106 to i32
  %107 = load i32, ptr %e, align 4
  %idxprom185 = zext i32 %107 to i64
  %arrayidx186 = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom185
  %108 = load i16, ptr %arrayidx186, align 2
  %conv187 = zext i16 %108 to i32
  %and188 = and i32 %conv184, %conv187
  %idx.ext189 = zext i32 %and188 to i64
  %add.ptr190 = getelementptr inbounds %struct.huft, ptr %105, i64 %idx.ext189
  store ptr %add.ptr190, ptr %t, align 8
  %e191 = getelementptr inbounds %struct.huft, ptr %add.ptr190, i32 0, i32 0
  %109 = load i8, ptr %e191, align 8
  %conv192 = zext i8 %109 to i32
  store i32 %conv192, ptr %e, align 4
  %cmp193 = icmp ugt i32 %conv192, 16
  br i1 %cmp193, label %do.body147, label %do.end195, !llvm.loop !97

do.end195:                                        ; preds = %do.cond182
  br label %if.end196

if.end196:                                        ; preds = %do.end195, %while.end137
  %110 = load ptr, ptr %t, align 8
  %b197 = getelementptr inbounds %struct.huft, ptr %110, i32 0, i32 1
  %111 = load i8, ptr %b197, align 1
  %conv198 = zext i8 %111 to i32
  %112 = load i64, ptr %b, align 8
  %sh_prom199 = zext i32 %conv198 to i64
  %shr200 = lshr i64 %112, %sh_prom199
  store i64 %shr200, ptr %b, align 8
  %113 = load ptr, ptr %t, align 8
  %b201 = getelementptr inbounds %struct.huft, ptr %113, i32 0, i32 1
  %114 = load i8, ptr %b201, align 1
  %conv202 = zext i8 %114 to i32
  %115 = load i32, ptr %k, align 4
  %sub203 = sub i32 %115, %conv202
  store i32 %sub203, ptr %k, align 4
  br label %while.cond204

while.cond204:                                    ; preds = %cond.end217, %if.end196
  %116 = load i32, ptr %k, align 4
  %117 = load i32, ptr %e, align 4
  %cmp205 = icmp ult i32 %116, %117
  br i1 %cmp205, label %while.body207, label %while.end225

while.body207:                                    ; preds = %while.cond204
  %118 = load i32, ptr @inptr, align 4
  %119 = load i32, ptr @insize, align 4
  %cmp208 = icmp ult i32 %118, %119
  br i1 %cmp208, label %cond.true210, label %cond.false215

cond.true210:                                     ; preds = %while.body207
  %120 = load i32, ptr @inptr, align 4
  %inc211 = add i32 %120, 1
  store i32 %inc211, ptr @inptr, align 4
  %idxprom212 = zext i32 %120 to i64
  %arrayidx213 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom212
  %121 = load i8, ptr %arrayidx213, align 1
  %conv214 = zext i8 %121 to i32
  br label %cond.end217

cond.false215:                                    ; preds = %while.body207
  %call216 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end217

cond.end217:                                      ; preds = %cond.false215, %cond.true210
  %cond218 = phi i32 [ %conv214, %cond.true210 ], [ %call216, %cond.false215 ]
  %conv219 = trunc i32 %cond218 to i8
  %conv220 = zext i8 %conv219 to i64
  %122 = load i32, ptr %k, align 4
  %sh_prom221 = zext i32 %122 to i64
  %shl222 = shl i64 %conv220, %sh_prom221
  %123 = load i64, ptr %b, align 8
  %or223 = or i64 %123, %shl222
  store i64 %or223, ptr %b, align 8
  %124 = load i32, ptr %k, align 4
  %add224 = add i32 %124, 8
  store i32 %add224, ptr %k, align 4
  br label %while.cond204, !llvm.loop !98

while.end225:                                     ; preds = %while.cond204
  %125 = load i32, ptr %w, align 4
  %126 = load ptr, ptr %t, align 8
  %v226 = getelementptr inbounds %struct.huft, ptr %126, i32 0, i32 2
  %127 = load i16, ptr %v226, align 8
  %conv227 = zext i16 %127 to i32
  %sub228 = sub i32 %125, %conv227
  %128 = load i64, ptr %b, align 8
  %conv229 = trunc i64 %128 to i32
  %129 = load i32, ptr %e, align 4
  %idxprom230 = zext i32 %129 to i64
  %arrayidx231 = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom230
  %130 = load i16, ptr %arrayidx231, align 2
  %conv232 = zext i16 %130 to i32
  %and233 = and i32 %conv229, %conv232
  %sub234 = sub i32 %sub228, %and233
  store i32 %sub234, ptr %d, align 4
  %131 = load i32, ptr %e, align 4
  %132 = load i64, ptr %b, align 8
  %sh_prom235 = zext i32 %131 to i64
  %shr236 = lshr i64 %132, %sh_prom235
  store i64 %shr236, ptr %b, align 8
  %133 = load i32, ptr %e, align 4
  %134 = load i32, ptr %k, align 4
  %sub237 = sub i32 %134, %133
  store i32 %sub237, ptr %k, align 4
  br label %do.body238

do.body238:                                       ; preds = %do.cond280, %while.end225
  %135 = load i32, ptr %d, align 4
  %and239 = and i32 %135, 32767
  store i32 %and239, ptr %d, align 4
  %136 = load i32, ptr %w, align 4
  %cmp240 = icmp ugt i32 %and239, %136
  br i1 %cmp240, label %cond.true242, label %cond.false243

cond.true242:                                     ; preds = %do.body238
  %137 = load i32, ptr %d, align 4
  br label %cond.end244

cond.false243:                                    ; preds = %do.body238
  %138 = load i32, ptr %w, align 4
  br label %cond.end244

cond.end244:                                      ; preds = %cond.false243, %cond.true242
  %cond245 = phi i32 [ %137, %cond.true242 ], [ %138, %cond.false243 ]
  %sub246 = sub i32 32768, %cond245
  store i32 %sub246, ptr %e, align 4
  %139 = load i32, ptr %n, align 4
  %cmp247 = icmp ugt i32 %sub246, %139
  br i1 %cmp247, label %cond.true249, label %cond.false250

cond.true249:                                     ; preds = %cond.end244
  %140 = load i32, ptr %n, align 4
  br label %cond.end251

cond.false250:                                    ; preds = %cond.end244
  %141 = load i32, ptr %e, align 4
  br label %cond.end251

cond.end251:                                      ; preds = %cond.false250, %cond.true249
  %cond252 = phi i32 [ %140, %cond.true249 ], [ %141, %cond.false250 ]
  store i32 %cond252, ptr %e, align 4
  %142 = load i32, ptr %n, align 4
  %sub253 = sub i32 %142, %cond252
  store i32 %sub253, ptr %n, align 4
  %143 = load i32, ptr %w, align 4
  %144 = load i32, ptr %d, align 4
  %sub254 = sub i32 %143, %144
  %145 = load i32, ptr %e, align 4
  %cmp255 = icmp uge i32 %sub254, %145
  br i1 %cmp255, label %if.then257, label %if.else265

if.then257:                                       ; preds = %cond.end251
  %146 = load i32, ptr %w, align 4
  %idx.ext258 = zext i32 %146 to i64
  %add.ptr259 = getelementptr inbounds i8, ptr @window, i64 %idx.ext258
  %147 = load i32, ptr %d, align 4
  %idx.ext260 = zext i32 %147 to i64
  %add.ptr261 = getelementptr inbounds i8, ptr @window, i64 %idx.ext260
  %148 = load i32, ptr %e, align 4
  %conv262 = zext i32 %148 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %add.ptr259, ptr align 1 %add.ptr261, i64 %conv262, i1 false)
  %149 = load i32, ptr %e, align 4
  %150 = load i32, ptr %w, align 4
  %add263 = add i32 %150, %149
  store i32 %add263, ptr %w, align 4
  %151 = load i32, ptr %e, align 4
  %152 = load i32, ptr %d, align 4
  %add264 = add i32 %152, %151
  store i32 %add264, ptr %d, align 4
  br label %if.end275

if.else265:                                       ; preds = %cond.end251
  br label %do.body266

do.body266:                                       ; preds = %do.cond273, %if.else265
  %153 = load i32, ptr %d, align 4
  %inc267 = add i32 %153, 1
  store i32 %inc267, ptr %d, align 4
  %idxprom268 = zext i32 %153 to i64
  %arrayidx269 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom268
  %154 = load i8, ptr %arrayidx269, align 1
  %155 = load i32, ptr %w, align 4
  %inc270 = add i32 %155, 1
  store i32 %inc270, ptr %w, align 4
  %idxprom271 = zext i32 %155 to i64
  %arrayidx272 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom271
  store i8 %154, ptr %arrayidx272, align 1
  br label %do.cond273

do.cond273:                                       ; preds = %do.body266
  %156 = load i32, ptr %e, align 4
  %dec = add i32 %156, -1
  store i32 %dec, ptr %e, align 4
  %tobool = icmp ne i32 %dec, 0
  br i1 %tobool, label %do.body266, label %do.end274, !llvm.loop !99

do.end274:                                        ; preds = %do.cond273
  br label %if.end275

if.end275:                                        ; preds = %do.end274, %if.then257
  %157 = load i32, ptr %w, align 4
  %cmp276 = icmp eq i32 %157, 32768
  br i1 %cmp276, label %if.then278, label %if.end279

if.then278:                                       ; preds = %if.end275
  %158 = load i32, ptr %w, align 4
  store i32 %158, ptr @outcnt, align 4
  call void @flush_window()
  store i32 0, ptr %w, align 4
  br label %if.end279

if.end279:                                        ; preds = %if.then278, %if.end275
  br label %do.cond280

do.cond280:                                       ; preds = %if.end279
  %159 = load i32, ptr %n, align 4
  %tobool281 = icmp ne i32 %159, 0
  br i1 %tobool281, label %do.body238, label %do.end282, !llvm.loop !100

do.end282:                                        ; preds = %do.cond280
  br label %if.end283

if.end283:                                        ; preds = %do.end282, %if.end78
  br label %for.cond

for.end:                                          ; preds = %if.then81
  %160 = load i32, ptr %w, align 4
  store i32 %160, ptr @outcnt, align 4
  %161 = load i64, ptr %b, align 8
  store i64 %161, ptr @bb, align 8
  %162 = load i32, ptr %k, align 4
  store i32 %162, ptr @bk, align 4
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then150, %if.then19
  %163 = load i32, ptr %retval, align 4
  ret i32 %163
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inflate_stored() #0 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %w = alloca i32, align 4
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  %0 = load i64, ptr @bb, align 8
  store i64 %0, ptr %b, align 8
  %1 = load i32, ptr @bk, align 4
  store i32 %1, ptr %k, align 4
  %2 = load i32, ptr @outcnt, align 4
  store i32 %2, ptr %w, align 4
  %3 = load i32, ptr %k, align 4
  %and = and i32 %3, 7
  store i32 %and, ptr %n, align 4
  %4 = load i32, ptr %n, align 4
  %5 = load i64, ptr %b, align 8
  %sh_prom = zext i32 %4 to i64
  %shr = lshr i64 %5, %sh_prom
  store i64 %shr, ptr %b, align 8
  %6 = load i32, ptr %n, align 4
  %7 = load i32, ptr %k, align 4
  %sub = sub i32 %7, %6
  store i32 %sub, ptr %k, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %entry
  %8 = load i32, ptr %k, align 4
  %cmp = icmp ult i32 %8, 16
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32, ptr @inptr, align 4
  %10 = load i32, ptr @insize, align 4
  %cmp1 = icmp ult i32 %9, %10
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %11 = load i32, ptr @inptr, align 4
  %inc = add i32 %11, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %11 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %12 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %12 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %conv2 = trunc i32 %cond to i8
  %conv3 = zext i8 %conv2 to i64
  %13 = load i32, ptr %k, align 4
  %sh_prom4 = zext i32 %13 to i64
  %shl = shl i64 %conv3, %sh_prom4
  %14 = load i64, ptr %b, align 8
  %or = or i64 %14, %shl
  store i64 %or, ptr %b, align 8
  %15 = load i32, ptr %k, align 4
  %add = add i32 %15, 8
  store i32 %add, ptr %k, align 4
  br label %while.cond, !llvm.loop !101

while.end:                                        ; preds = %while.cond
  %16 = load i64, ptr %b, align 8
  %conv5 = trunc i64 %16 to i32
  %and6 = and i32 %conv5, 65535
  store i32 %and6, ptr %n, align 4
  %17 = load i64, ptr %b, align 8
  %shr7 = lshr i64 %17, 16
  store i64 %shr7, ptr %b, align 8
  %18 = load i32, ptr %k, align 4
  %sub8 = sub i32 %18, 16
  store i32 %sub8, ptr %k, align 4
  br label %while.cond9

while.cond9:                                      ; preds = %cond.end22, %while.end
  %19 = load i32, ptr %k, align 4
  %cmp10 = icmp ult i32 %19, 16
  br i1 %cmp10, label %while.body12, label %while.end30

while.body12:                                     ; preds = %while.cond9
  %20 = load i32, ptr @inptr, align 4
  %21 = load i32, ptr @insize, align 4
  %cmp13 = icmp ult i32 %20, %21
  br i1 %cmp13, label %cond.true15, label %cond.false20

cond.true15:                                      ; preds = %while.body12
  %22 = load i32, ptr @inptr, align 4
  %inc16 = add i32 %22, 1
  store i32 %inc16, ptr @inptr, align 4
  %idxprom17 = zext i32 %22 to i64
  %arrayidx18 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom17
  %23 = load i8, ptr %arrayidx18, align 1
  %conv19 = zext i8 %23 to i32
  br label %cond.end22

cond.false20:                                     ; preds = %while.body12
  %call21 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false20, %cond.true15
  %cond23 = phi i32 [ %conv19, %cond.true15 ], [ %call21, %cond.false20 ]
  %conv24 = trunc i32 %cond23 to i8
  %conv25 = zext i8 %conv24 to i64
  %24 = load i32, ptr %k, align 4
  %sh_prom26 = zext i32 %24 to i64
  %shl27 = shl i64 %conv25, %sh_prom26
  %25 = load i64, ptr %b, align 8
  %or28 = or i64 %25, %shl27
  store i64 %or28, ptr %b, align 8
  %26 = load i32, ptr %k, align 4
  %add29 = add i32 %26, 8
  store i32 %add29, ptr %k, align 4
  br label %while.cond9, !llvm.loop !102

while.end30:                                      ; preds = %while.cond9
  %27 = load i32, ptr %n, align 4
  %28 = load i64, ptr %b, align 8
  %neg = xor i64 %28, -1
  %and31 = and i64 %neg, 65535
  %conv32 = trunc i64 %and31 to i32
  %cmp33 = icmp ne i32 %27, %conv32
  br i1 %cmp33, label %if.then, label %if.end

if.then:                                          ; preds = %while.end30
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end30
  %29 = load i64, ptr %b, align 8
  %shr35 = lshr i64 %29, 16
  store i64 %shr35, ptr %b, align 8
  %30 = load i32, ptr %k, align 4
  %sub36 = sub i32 %30, 16
  store i32 %sub36, ptr %k, align 4
  br label %while.cond37

while.cond37:                                     ; preds = %if.end68, %if.end
  %31 = load i32, ptr %n, align 4
  %dec = add i32 %31, -1
  store i32 %dec, ptr %n, align 4
  %tobool = icmp ne i32 %31, 0
  br i1 %tobool, label %while.body38, label %while.end71

while.body38:                                     ; preds = %while.cond37
  br label %while.cond39

while.cond39:                                     ; preds = %cond.end52, %while.body38
  %32 = load i32, ptr %k, align 4
  %cmp40 = icmp ult i32 %32, 8
  br i1 %cmp40, label %while.body42, label %while.end60

while.body42:                                     ; preds = %while.cond39
  %33 = load i32, ptr @inptr, align 4
  %34 = load i32, ptr @insize, align 4
  %cmp43 = icmp ult i32 %33, %34
  br i1 %cmp43, label %cond.true45, label %cond.false50

cond.true45:                                      ; preds = %while.body42
  %35 = load i32, ptr @inptr, align 4
  %inc46 = add i32 %35, 1
  store i32 %inc46, ptr @inptr, align 4
  %idxprom47 = zext i32 %35 to i64
  %arrayidx48 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom47
  %36 = load i8, ptr %arrayidx48, align 1
  %conv49 = zext i8 %36 to i32
  br label %cond.end52

cond.false50:                                     ; preds = %while.body42
  %call51 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end52

cond.end52:                                       ; preds = %cond.false50, %cond.true45
  %cond53 = phi i32 [ %conv49, %cond.true45 ], [ %call51, %cond.false50 ]
  %conv54 = trunc i32 %cond53 to i8
  %conv55 = zext i8 %conv54 to i64
  %37 = load i32, ptr %k, align 4
  %sh_prom56 = zext i32 %37 to i64
  %shl57 = shl i64 %conv55, %sh_prom56
  %38 = load i64, ptr %b, align 8
  %or58 = or i64 %38, %shl57
  store i64 %or58, ptr %b, align 8
  %39 = load i32, ptr %k, align 4
  %add59 = add i32 %39, 8
  store i32 %add59, ptr %k, align 4
  br label %while.cond39, !llvm.loop !103

while.end60:                                      ; preds = %while.cond39
  %40 = load i64, ptr %b, align 8
  %conv61 = trunc i64 %40 to i8
  %41 = load i32, ptr %w, align 4
  %inc62 = add i32 %41, 1
  store i32 %inc62, ptr %w, align 4
  %idxprom63 = zext i32 %41 to i64
  %arrayidx64 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom63
  store i8 %conv61, ptr %arrayidx64, align 1
  %42 = load i32, ptr %w, align 4
  %cmp65 = icmp eq i32 %42, 32768
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %while.end60
  %43 = load i32, ptr %w, align 4
  store i32 %43, ptr @outcnt, align 4
  call void @flush_window()
  store i32 0, ptr %w, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %while.end60
  %44 = load i64, ptr %b, align 8
  %shr69 = lshr i64 %44, 8
  store i64 %shr69, ptr %b, align 8
  %45 = load i32, ptr %k, align 4
  %sub70 = sub i32 %45, 8
  store i32 %sub70, ptr %k, align 4
  br label %while.cond37, !llvm.loop !104

while.end71:                                      ; preds = %while.cond37
  %46 = load i32, ptr %w, align 4
  store i32 %46, ptr @outcnt, align 4
  %47 = load i64, ptr %b, align 8
  store i64 %47, ptr @bb, align 8
  %48 = load i32, ptr %k, align 4
  store i32 %48, ptr @bk, align 4
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %while.end71, %if.then
  %49 = load i32, ptr %retval, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inflate_fixed() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %tl = alloca ptr, align 8
  %td = alloca ptr, align 8
  %bl = alloca i32, align 4
  %bd = alloca i32, align 4
  %l = alloca [288 x i32], align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 144
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 %idxprom
  store i32 8, ptr %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, ptr %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %3 = load i32, ptr %i, align 4
  %cmp2 = icmp slt i32 %3, 256
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, ptr %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 %idxprom4
  store i32 9, ptr %arrayidx5, align 4
  br label %for.inc6

for.inc6:                                         ; preds = %for.body3
  %5 = load i32, ptr %i, align 4
  %inc7 = add nsw i32 %5, 1
  store i32 %inc7, ptr %i, align 4
  br label %for.cond1, !llvm.loop !106

for.end8:                                         ; preds = %for.cond1
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc14, %for.end8
  %6 = load i32, ptr %i, align 4
  %cmp10 = icmp slt i32 %6, 280
  br i1 %cmp10, label %for.body11, label %for.end16

for.body11:                                       ; preds = %for.cond9
  %7 = load i32, ptr %i, align 4
  %idxprom12 = sext i32 %7 to i64
  %arrayidx13 = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 %idxprom12
  store i32 7, ptr %arrayidx13, align 4
  br label %for.inc14

for.inc14:                                        ; preds = %for.body11
  %8 = load i32, ptr %i, align 4
  %inc15 = add nsw i32 %8, 1
  store i32 %inc15, ptr %i, align 4
  br label %for.cond9, !llvm.loop !107

for.end16:                                        ; preds = %for.cond9
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc22, %for.end16
  %9 = load i32, ptr %i, align 4
  %cmp18 = icmp slt i32 %9, 288
  br i1 %cmp18, label %for.body19, label %for.end24

for.body19:                                       ; preds = %for.cond17
  %10 = load i32, ptr %i, align 4
  %idxprom20 = sext i32 %10 to i64
  %arrayidx21 = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 %idxprom20
  store i32 8, ptr %arrayidx21, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %for.body19
  %11 = load i32, ptr %i, align 4
  %inc23 = add nsw i32 %11, 1
  store i32 %inc23, ptr %i, align 4
  br label %for.cond17, !llvm.loop !108

for.end24:                                        ; preds = %for.cond17
  store i32 7, ptr %bl, align 4
  %arraydecay = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 0
  %call = call i32 @huft_build(ptr noundef %arraydecay, i32 noundef 288, i32 noundef 257, ptr noundef @cplens, ptr noundef @cplext, ptr noundef %tl, ptr noundef %bl)
  store i32 %call, ptr %i, align 4
  %cmp25 = icmp ne i32 %call, 0
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %for.end24
  %12 = load i32, ptr %i, align 4
  store i32 %12, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %for.end24
  store i32 0, ptr %i, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc31, %if.end
  %13 = load i32, ptr %i, align 4
  %cmp27 = icmp slt i32 %13, 30
  br i1 %cmp27, label %for.body28, label %for.end33

for.body28:                                       ; preds = %for.cond26
  %14 = load i32, ptr %i, align 4
  %idxprom29 = sext i32 %14 to i64
  %arrayidx30 = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 %idxprom29
  store i32 5, ptr %arrayidx30, align 4
  br label %for.inc31

for.inc31:                                        ; preds = %for.body28
  %15 = load i32, ptr %i, align 4
  %inc32 = add nsw i32 %15, 1
  store i32 %inc32, ptr %i, align 4
  br label %for.cond26, !llvm.loop !109

for.end33:                                        ; preds = %for.cond26
  store i32 5, ptr %bd, align 4
  %arraydecay34 = getelementptr inbounds [288 x i32], ptr %l, i64 0, i64 0
  %call35 = call i32 @huft_build(ptr noundef %arraydecay34, i32 noundef 30, i32 noundef 0, ptr noundef @cpdist, ptr noundef @cpdext, ptr noundef %td, ptr noundef %bd)
  store i32 %call35, ptr %i, align 4
  %cmp36 = icmp sgt i32 %call35, 1
  br i1 %cmp36, label %if.then37, label %if.end39

if.then37:                                        ; preds = %for.end33
  %16 = load ptr, ptr %tl, align 8
  %call38 = call i32 @huft_free(ptr noundef %16)
  %17 = load i32, ptr %i, align 4
  store i32 %17, ptr %retval, align 4
  br label %return

if.end39:                                         ; preds = %for.end33
  %18 = load ptr, ptr %tl, align 8
  %19 = load ptr, ptr %td, align 8
  %20 = load i32, ptr %bl, align 4
  %21 = load i32, ptr %bd, align 4
  %call40 = call i32 @inflate_codes(ptr noundef %18, ptr noundef %19, i32 noundef %20, i32 noundef %21)
  %tobool = icmp ne i32 %call40, 0
  br i1 %tobool, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end39
  store i32 1, ptr %retval, align 4
  br label %return

if.end42:                                         ; preds = %if.end39
  %22 = load ptr, ptr %tl, align 8
  %call43 = call i32 @huft_free(ptr noundef %22)
  %23 = load ptr, ptr %td, align 8
  %call44 = call i32 @huft_free(ptr noundef %23)
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end42, %if.then41, %if.then37, %if.then
  %24 = load i32, ptr %retval, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inflate_dynamic() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %tl = alloca ptr, align 8
  %td = alloca ptr, align 8
  %bl = alloca i32, align 4
  %bd = alloca i32, align 4
  %nb = alloca i32, align 4
  %nl = alloca i32, align 4
  %nd = alloca i32, align 4
  %ll = alloca [316 x i32], align 16
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  %0 = load i64, ptr @bb, align 8
  store i64 %0, ptr %b, align 8
  %1 = load i32, ptr @bk, align 4
  store i32 %1, ptr %k, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %entry
  %2 = load i32, ptr %k, align 4
  %cmp = icmp ult i32 %2, 5
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, ptr @inptr, align 4
  %4 = load i32, ptr @insize, align 4
  %cmp1 = icmp ult i32 %3, %4
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %5 = load i32, ptr @inptr, align 4
  %inc = add i32 %5, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %5 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %6 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %6 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %conv2 = trunc i32 %cond to i8
  %conv3 = zext i8 %conv2 to i64
  %7 = load i32, ptr %k, align 4
  %sh_prom = zext i32 %7 to i64
  %shl = shl i64 %conv3, %sh_prom
  %8 = load i64, ptr %b, align 8
  %or = or i64 %8, %shl
  store i64 %or, ptr %b, align 8
  %9 = load i32, ptr %k, align 4
  %add = add i32 %9, 8
  store i32 %add, ptr %k, align 4
  br label %while.cond, !llvm.loop !110

while.end:                                        ; preds = %while.cond
  %10 = load i64, ptr %b, align 8
  %conv4 = trunc i64 %10 to i32
  %and = and i32 %conv4, 31
  %add5 = add i32 257, %and
  store i32 %add5, ptr %nl, align 4
  %11 = load i64, ptr %b, align 8
  %shr = lshr i64 %11, 5
  store i64 %shr, ptr %b, align 8
  %12 = load i32, ptr %k, align 4
  %sub = sub i32 %12, 5
  store i32 %sub, ptr %k, align 4
  br label %while.cond6

while.cond6:                                      ; preds = %cond.end19, %while.end
  %13 = load i32, ptr %k, align 4
  %cmp7 = icmp ult i32 %13, 5
  br i1 %cmp7, label %while.body9, label %while.end27

while.body9:                                      ; preds = %while.cond6
  %14 = load i32, ptr @inptr, align 4
  %15 = load i32, ptr @insize, align 4
  %cmp10 = icmp ult i32 %14, %15
  br i1 %cmp10, label %cond.true12, label %cond.false17

cond.true12:                                      ; preds = %while.body9
  %16 = load i32, ptr @inptr, align 4
  %inc13 = add i32 %16, 1
  store i32 %inc13, ptr @inptr, align 4
  %idxprom14 = zext i32 %16 to i64
  %arrayidx15 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom14
  %17 = load i8, ptr %arrayidx15, align 1
  %conv16 = zext i8 %17 to i32
  br label %cond.end19

cond.false17:                                     ; preds = %while.body9
  %call18 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false17, %cond.true12
  %cond20 = phi i32 [ %conv16, %cond.true12 ], [ %call18, %cond.false17 ]
  %conv21 = trunc i32 %cond20 to i8
  %conv22 = zext i8 %conv21 to i64
  %18 = load i32, ptr %k, align 4
  %sh_prom23 = zext i32 %18 to i64
  %shl24 = shl i64 %conv22, %sh_prom23
  %19 = load i64, ptr %b, align 8
  %or25 = or i64 %19, %shl24
  store i64 %or25, ptr %b, align 8
  %20 = load i32, ptr %k, align 4
  %add26 = add i32 %20, 8
  store i32 %add26, ptr %k, align 4
  br label %while.cond6, !llvm.loop !111

while.end27:                                      ; preds = %while.cond6
  %21 = load i64, ptr %b, align 8
  %conv28 = trunc i64 %21 to i32
  %and29 = and i32 %conv28, 31
  %add30 = add i32 1, %and29
  store i32 %add30, ptr %nd, align 4
  %22 = load i64, ptr %b, align 8
  %shr31 = lshr i64 %22, 5
  store i64 %shr31, ptr %b, align 8
  %23 = load i32, ptr %k, align 4
  %sub32 = sub i32 %23, 5
  store i32 %sub32, ptr %k, align 4
  br label %while.cond33

while.cond33:                                     ; preds = %cond.end46, %while.end27
  %24 = load i32, ptr %k, align 4
  %cmp34 = icmp ult i32 %24, 4
  br i1 %cmp34, label %while.body36, label %while.end54

while.body36:                                     ; preds = %while.cond33
  %25 = load i32, ptr @inptr, align 4
  %26 = load i32, ptr @insize, align 4
  %cmp37 = icmp ult i32 %25, %26
  br i1 %cmp37, label %cond.true39, label %cond.false44

cond.true39:                                      ; preds = %while.body36
  %27 = load i32, ptr @inptr, align 4
  %inc40 = add i32 %27, 1
  store i32 %inc40, ptr @inptr, align 4
  %idxprom41 = zext i32 %27 to i64
  %arrayidx42 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom41
  %28 = load i8, ptr %arrayidx42, align 1
  %conv43 = zext i8 %28 to i32
  br label %cond.end46

cond.false44:                                     ; preds = %while.body36
  %call45 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end46

cond.end46:                                       ; preds = %cond.false44, %cond.true39
  %cond47 = phi i32 [ %conv43, %cond.true39 ], [ %call45, %cond.false44 ]
  %conv48 = trunc i32 %cond47 to i8
  %conv49 = zext i8 %conv48 to i64
  %29 = load i32, ptr %k, align 4
  %sh_prom50 = zext i32 %29 to i64
  %shl51 = shl i64 %conv49, %sh_prom50
  %30 = load i64, ptr %b, align 8
  %or52 = or i64 %30, %shl51
  store i64 %or52, ptr %b, align 8
  %31 = load i32, ptr %k, align 4
  %add53 = add i32 %31, 8
  store i32 %add53, ptr %k, align 4
  br label %while.cond33, !llvm.loop !112

while.end54:                                      ; preds = %while.cond33
  %32 = load i64, ptr %b, align 8
  %conv55 = trunc i64 %32 to i32
  %and56 = and i32 %conv55, 15
  %add57 = add i32 4, %and56
  store i32 %add57, ptr %nb, align 4
  %33 = load i64, ptr %b, align 8
  %shr58 = lshr i64 %33, 4
  store i64 %shr58, ptr %b, align 8
  %34 = load i32, ptr %k, align 4
  %sub59 = sub i32 %34, 4
  store i32 %sub59, ptr %k, align 4
  %35 = load i32, ptr %nl, align 4
  %cmp60 = icmp ugt i32 %35, 286
  br i1 %cmp60, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end54
  %36 = load i32, ptr %nd, align 4
  %cmp62 = icmp ugt i32 %36, 30
  br i1 %cmp62, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.end54
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, ptr %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %37 = load i32, ptr %j, align 4
  %38 = load i32, ptr %nb, align 4
  %cmp64 = icmp ult i32 %37, %38
  br i1 %cmp64, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond66

while.cond66:                                     ; preds = %cond.end79, %for.body
  %39 = load i32, ptr %k, align 4
  %cmp67 = icmp ult i32 %39, 3
  br i1 %cmp67, label %while.body69, label %while.end87

while.body69:                                     ; preds = %while.cond66
  %40 = load i32, ptr @inptr, align 4
  %41 = load i32, ptr @insize, align 4
  %cmp70 = icmp ult i32 %40, %41
  br i1 %cmp70, label %cond.true72, label %cond.false77

cond.true72:                                      ; preds = %while.body69
  %42 = load i32, ptr @inptr, align 4
  %inc73 = add i32 %42, 1
  store i32 %inc73, ptr @inptr, align 4
  %idxprom74 = zext i32 %42 to i64
  %arrayidx75 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom74
  %43 = load i8, ptr %arrayidx75, align 1
  %conv76 = zext i8 %43 to i32
  br label %cond.end79

cond.false77:                                     ; preds = %while.body69
  %call78 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end79

cond.end79:                                       ; preds = %cond.false77, %cond.true72
  %cond80 = phi i32 [ %conv76, %cond.true72 ], [ %call78, %cond.false77 ]
  %conv81 = trunc i32 %cond80 to i8
  %conv82 = zext i8 %conv81 to i64
  %44 = load i32, ptr %k, align 4
  %sh_prom83 = zext i32 %44 to i64
  %shl84 = shl i64 %conv82, %sh_prom83
  %45 = load i64, ptr %b, align 8
  %or85 = or i64 %45, %shl84
  store i64 %or85, ptr %b, align 8
  %46 = load i32, ptr %k, align 4
  %add86 = add i32 %46, 8
  store i32 %add86, ptr %k, align 4
  br label %while.cond66, !llvm.loop !113

while.end87:                                      ; preds = %while.cond66
  %47 = load i64, ptr %b, align 8
  %conv88 = trunc i64 %47 to i32
  %and89 = and i32 %conv88, 7
  %48 = load i32, ptr %j, align 4
  %idxprom90 = zext i32 %48 to i64
  %arrayidx91 = getelementptr inbounds [19 x i32], ptr @border, i64 0, i64 %idxprom90
  %49 = load i32, ptr %arrayidx91, align 4
  %idxprom92 = zext i32 %49 to i64
  %arrayidx93 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 %idxprom92
  store i32 %and89, ptr %arrayidx93, align 4
  %50 = load i64, ptr %b, align 8
  %shr94 = lshr i64 %50, 3
  store i64 %shr94, ptr %b, align 8
  %51 = load i32, ptr %k, align 4
  %sub95 = sub i32 %51, 3
  store i32 %sub95, ptr %k, align 4
  br label %for.inc

for.inc:                                          ; preds = %while.end87
  %52 = load i32, ptr %j, align 4
  %inc96 = add i32 %52, 1
  store i32 %inc96, ptr %j, align 4
  br label %for.cond, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  br label %for.cond97

for.cond97:                                       ; preds = %for.inc105, %for.end
  %53 = load i32, ptr %j, align 4
  %cmp98 = icmp ult i32 %53, 19
  br i1 %cmp98, label %for.body100, label %for.end107

for.body100:                                      ; preds = %for.cond97
  %54 = load i32, ptr %j, align 4
  %idxprom101 = zext i32 %54 to i64
  %arrayidx102 = getelementptr inbounds [19 x i32], ptr @border, i64 0, i64 %idxprom101
  %55 = load i32, ptr %arrayidx102, align 4
  %idxprom103 = zext i32 %55 to i64
  %arrayidx104 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 %idxprom103
  store i32 0, ptr %arrayidx104, align 4
  br label %for.inc105

for.inc105:                                       ; preds = %for.body100
  %56 = load i32, ptr %j, align 4
  %inc106 = add i32 %56, 1
  store i32 %inc106, ptr %j, align 4
  br label %for.cond97, !llvm.loop !115

for.end107:                                       ; preds = %for.cond97
  store i32 7, ptr %bl, align 4
  %arraydecay = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 0
  %call108 = call i32 @huft_build(ptr noundef %arraydecay, i32 noundef 19, i32 noundef 19, ptr noundef null, ptr noundef null, ptr noundef %tl, ptr noundef %bl)
  store i32 %call108, ptr %i, align 4
  %cmp109 = icmp ne i32 %call108, 0
  br i1 %cmp109, label %if.then111, label %if.end117

if.then111:                                       ; preds = %for.end107
  %57 = load i32, ptr %i, align 4
  %cmp112 = icmp eq i32 %57, 1
  br i1 %cmp112, label %if.then114, label %if.end116

if.then114:                                       ; preds = %if.then111
  %58 = load ptr, ptr %tl, align 8
  %call115 = call i32 @huft_free(ptr noundef %58)
  br label %if.end116

if.end116:                                        ; preds = %if.then114, %if.then111
  %59 = load i32, ptr %i, align 4
  store i32 %59, ptr %retval, align 4
  br label %return

if.end117:                                        ; preds = %for.end107
  %60 = load i32, ptr %nl, align 4
  %61 = load i32, ptr %nd, align 4
  %add118 = add i32 %60, %61
  store i32 %add118, ptr %n, align 4
  %62 = load i32, ptr %bl, align 4
  %idxprom119 = sext i32 %62 to i64
  %arrayidx120 = getelementptr inbounds [17 x i16], ptr @mask_bits, i64 0, i64 %idxprom119
  %63 = load i16, ptr %arrayidx120, align 2
  %conv121 = zext i16 %63 to i32
  store i32 %conv121, ptr %m, align 4
  store i32 0, ptr %l, align 4
  store i32 0, ptr %i, align 4
  br label %while.cond122

while.cond122:                                    ; preds = %if.end290, %if.end117
  %64 = load i32, ptr %i, align 4
  %65 = load i32, ptr %n, align 4
  %cmp123 = icmp ult i32 %64, %65
  br i1 %cmp123, label %while.body125, label %while.end291

while.body125:                                    ; preds = %while.cond122
  br label %while.cond126

while.cond126:                                    ; preds = %cond.end139, %while.body125
  %66 = load i32, ptr %k, align 4
  %67 = load i32, ptr %bl, align 4
  %cmp127 = icmp ult i32 %66, %67
  br i1 %cmp127, label %while.body129, label %while.end147

while.body129:                                    ; preds = %while.cond126
  %68 = load i32, ptr @inptr, align 4
  %69 = load i32, ptr @insize, align 4
  %cmp130 = icmp ult i32 %68, %69
  br i1 %cmp130, label %cond.true132, label %cond.false137

cond.true132:                                     ; preds = %while.body129
  %70 = load i32, ptr @inptr, align 4
  %inc133 = add i32 %70, 1
  store i32 %inc133, ptr @inptr, align 4
  %idxprom134 = zext i32 %70 to i64
  %arrayidx135 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom134
  %71 = load i8, ptr %arrayidx135, align 1
  %conv136 = zext i8 %71 to i32
  br label %cond.end139

cond.false137:                                    ; preds = %while.body129
  %call138 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end139

cond.end139:                                      ; preds = %cond.false137, %cond.true132
  %cond140 = phi i32 [ %conv136, %cond.true132 ], [ %call138, %cond.false137 ]
  %conv141 = trunc i32 %cond140 to i8
  %conv142 = zext i8 %conv141 to i64
  %72 = load i32, ptr %k, align 4
  %sh_prom143 = zext i32 %72 to i64
  %shl144 = shl i64 %conv142, %sh_prom143
  %73 = load i64, ptr %b, align 8
  %or145 = or i64 %73, %shl144
  store i64 %or145, ptr %b, align 8
  %74 = load i32, ptr %k, align 4
  %add146 = add i32 %74, 8
  store i32 %add146, ptr %k, align 4
  br label %while.cond126, !llvm.loop !116

while.end147:                                     ; preds = %while.cond126
  %75 = load ptr, ptr %tl, align 8
  %76 = load i64, ptr %b, align 8
  %conv148 = trunc i64 %76 to i32
  %77 = load i32, ptr %m, align 4
  %and149 = and i32 %conv148, %77
  %idx.ext = zext i32 %and149 to i64
  %add.ptr = getelementptr inbounds %struct.huft, ptr %75, i64 %idx.ext
  store ptr %add.ptr, ptr %td, align 8
  %b150 = getelementptr inbounds %struct.huft, ptr %add.ptr, i32 0, i32 1
  %78 = load i8, ptr %b150, align 1
  %conv151 = zext i8 %78 to i32
  store i32 %conv151, ptr %j, align 4
  %79 = load i32, ptr %j, align 4
  %80 = load i64, ptr %b, align 8
  %sh_prom152 = zext i32 %79 to i64
  %shr153 = lshr i64 %80, %sh_prom152
  store i64 %shr153, ptr %b, align 8
  %81 = load i32, ptr %j, align 4
  %82 = load i32, ptr %k, align 4
  %sub154 = sub i32 %82, %81
  store i32 %sub154, ptr %k, align 4
  %83 = load ptr, ptr %td, align 8
  %v = getelementptr inbounds %struct.huft, ptr %83, i32 0, i32 2
  %84 = load i16, ptr %v, align 8
  %conv155 = zext i16 %84 to i32
  store i32 %conv155, ptr %j, align 4
  %85 = load i32, ptr %j, align 4
  %cmp156 = icmp ult i32 %85, 16
  br i1 %cmp156, label %if.then158, label %if.else

if.then158:                                       ; preds = %while.end147
  %86 = load i32, ptr %j, align 4
  store i32 %86, ptr %l, align 4
  %87 = load i32, ptr %i, align 4
  %inc159 = add nsw i32 %87, 1
  store i32 %inc159, ptr %i, align 4
  %idxprom160 = sext i32 %87 to i64
  %arrayidx161 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 %idxprom160
  store i32 %86, ptr %arrayidx161, align 4
  br label %if.end290

if.else:                                          ; preds = %while.end147
  %88 = load i32, ptr %j, align 4
  %cmp162 = icmp eq i32 %88, 16
  br i1 %cmp162, label %if.then164, label %if.else203

if.then164:                                       ; preds = %if.else
  br label %while.cond165

while.cond165:                                    ; preds = %cond.end178, %if.then164
  %89 = load i32, ptr %k, align 4
  %cmp166 = icmp ult i32 %89, 2
  br i1 %cmp166, label %while.body168, label %while.end186

while.body168:                                    ; preds = %while.cond165
  %90 = load i32, ptr @inptr, align 4
  %91 = load i32, ptr @insize, align 4
  %cmp169 = icmp ult i32 %90, %91
  br i1 %cmp169, label %cond.true171, label %cond.false176

cond.true171:                                     ; preds = %while.body168
  %92 = load i32, ptr @inptr, align 4
  %inc172 = add i32 %92, 1
  store i32 %inc172, ptr @inptr, align 4
  %idxprom173 = zext i32 %92 to i64
  %arrayidx174 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom173
  %93 = load i8, ptr %arrayidx174, align 1
  %conv175 = zext i8 %93 to i32
  br label %cond.end178

cond.false176:                                    ; preds = %while.body168
  %call177 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end178

cond.end178:                                      ; preds = %cond.false176, %cond.true171
  %cond179 = phi i32 [ %conv175, %cond.true171 ], [ %call177, %cond.false176 ]
  %conv180 = trunc i32 %cond179 to i8
  %conv181 = zext i8 %conv180 to i64
  %94 = load i32, ptr %k, align 4
  %sh_prom182 = zext i32 %94 to i64
  %shl183 = shl i64 %conv181, %sh_prom182
  %95 = load i64, ptr %b, align 8
  %or184 = or i64 %95, %shl183
  store i64 %or184, ptr %b, align 8
  %96 = load i32, ptr %k, align 4
  %add185 = add i32 %96, 8
  store i32 %add185, ptr %k, align 4
  br label %while.cond165, !llvm.loop !117

while.end186:                                     ; preds = %while.cond165
  %97 = load i64, ptr %b, align 8
  %conv187 = trunc i64 %97 to i32
  %and188 = and i32 %conv187, 3
  %add189 = add i32 3, %and188
  store i32 %add189, ptr %j, align 4
  %98 = load i64, ptr %b, align 8
  %shr190 = lshr i64 %98, 2
  store i64 %shr190, ptr %b, align 8
  %99 = load i32, ptr %k, align 4
  %sub191 = sub i32 %99, 2
  store i32 %sub191, ptr %k, align 4
  %100 = load i32, ptr %i, align 4
  %101 = load i32, ptr %j, align 4
  %add192 = add i32 %100, %101
  %102 = load i32, ptr %n, align 4
  %cmp193 = icmp ugt i32 %add192, %102
  br i1 %cmp193, label %if.then195, label %if.end196

if.then195:                                       ; preds = %while.end186
  store i32 1, ptr %retval, align 4
  br label %return

if.end196:                                        ; preds = %while.end186
  br label %while.cond197

while.cond197:                                    ; preds = %while.body198, %if.end196
  %103 = load i32, ptr %j, align 4
  %dec = add i32 %103, -1
  store i32 %dec, ptr %j, align 4
  %tobool = icmp ne i32 %103, 0
  br i1 %tobool, label %while.body198, label %while.end202

while.body198:                                    ; preds = %while.cond197
  %104 = load i32, ptr %l, align 4
  %105 = load i32, ptr %i, align 4
  %inc199 = add nsw i32 %105, 1
  store i32 %inc199, ptr %i, align 4
  %idxprom200 = sext i32 %105 to i64
  %arrayidx201 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 %idxprom200
  store i32 %104, ptr %arrayidx201, align 4
  br label %while.cond197, !llvm.loop !118

while.end202:                                     ; preds = %while.cond197
  br label %if.end289

if.else203:                                       ; preds = %if.else
  %106 = load i32, ptr %j, align 4
  %cmp204 = icmp eq i32 %106, 17
  br i1 %cmp204, label %if.then206, label %if.else247

if.then206:                                       ; preds = %if.else203
  br label %while.cond207

while.cond207:                                    ; preds = %cond.end220, %if.then206
  %107 = load i32, ptr %k, align 4
  %cmp208 = icmp ult i32 %107, 3
  br i1 %cmp208, label %while.body210, label %while.end228

while.body210:                                    ; preds = %while.cond207
  %108 = load i32, ptr @inptr, align 4
  %109 = load i32, ptr @insize, align 4
  %cmp211 = icmp ult i32 %108, %109
  br i1 %cmp211, label %cond.true213, label %cond.false218

cond.true213:                                     ; preds = %while.body210
  %110 = load i32, ptr @inptr, align 4
  %inc214 = add i32 %110, 1
  store i32 %inc214, ptr @inptr, align 4
  %idxprom215 = zext i32 %110 to i64
  %arrayidx216 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom215
  %111 = load i8, ptr %arrayidx216, align 1
  %conv217 = zext i8 %111 to i32
  br label %cond.end220

cond.false218:                                    ; preds = %while.body210
  %call219 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end220

cond.end220:                                      ; preds = %cond.false218, %cond.true213
  %cond221 = phi i32 [ %conv217, %cond.true213 ], [ %call219, %cond.false218 ]
  %conv222 = trunc i32 %cond221 to i8
  %conv223 = zext i8 %conv222 to i64
  %112 = load i32, ptr %k, align 4
  %sh_prom224 = zext i32 %112 to i64
  %shl225 = shl i64 %conv223, %sh_prom224
  %113 = load i64, ptr %b, align 8
  %or226 = or i64 %113, %shl225
  store i64 %or226, ptr %b, align 8
  %114 = load i32, ptr %k, align 4
  %add227 = add i32 %114, 8
  store i32 %add227, ptr %k, align 4
  br label %while.cond207, !llvm.loop !119

while.end228:                                     ; preds = %while.cond207
  %115 = load i64, ptr %b, align 8
  %conv229 = trunc i64 %115 to i32
  %and230 = and i32 %conv229, 7
  %add231 = add i32 3, %and230
  store i32 %add231, ptr %j, align 4
  %116 = load i64, ptr %b, align 8
  %shr232 = lshr i64 %116, 3
  store i64 %shr232, ptr %b, align 8
  %117 = load i32, ptr %k, align 4
  %sub233 = sub i32 %117, 3
  store i32 %sub233, ptr %k, align 4
  %118 = load i32, ptr %i, align 4
  %119 = load i32, ptr %j, align 4
  %add234 = add i32 %118, %119
  %120 = load i32, ptr %n, align 4
  %cmp235 = icmp ugt i32 %add234, %120
  br i1 %cmp235, label %if.then237, label %if.end238

if.then237:                                       ; preds = %while.end228
  store i32 1, ptr %retval, align 4
  br label %return

if.end238:                                        ; preds = %while.end228
  br label %while.cond239

while.cond239:                                    ; preds = %while.body242, %if.end238
  %121 = load i32, ptr %j, align 4
  %dec240 = add i32 %121, -1
  store i32 %dec240, ptr %j, align 4
  %tobool241 = icmp ne i32 %121, 0
  br i1 %tobool241, label %while.body242, label %while.end246

while.body242:                                    ; preds = %while.cond239
  %122 = load i32, ptr %i, align 4
  %inc243 = add nsw i32 %122, 1
  store i32 %inc243, ptr %i, align 4
  %idxprom244 = sext i32 %122 to i64
  %arrayidx245 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 %idxprom244
  store i32 0, ptr %arrayidx245, align 4
  br label %while.cond239, !llvm.loop !120

while.end246:                                     ; preds = %while.cond239
  store i32 0, ptr %l, align 4
  br label %if.end288

if.else247:                                       ; preds = %if.else203
  br label %while.cond248

while.cond248:                                    ; preds = %cond.end261, %if.else247
  %123 = load i32, ptr %k, align 4
  %cmp249 = icmp ult i32 %123, 7
  br i1 %cmp249, label %while.body251, label %while.end269

while.body251:                                    ; preds = %while.cond248
  %124 = load i32, ptr @inptr, align 4
  %125 = load i32, ptr @insize, align 4
  %cmp252 = icmp ult i32 %124, %125
  br i1 %cmp252, label %cond.true254, label %cond.false259

cond.true254:                                     ; preds = %while.body251
  %126 = load i32, ptr @inptr, align 4
  %inc255 = add i32 %126, 1
  store i32 %inc255, ptr @inptr, align 4
  %idxprom256 = zext i32 %126 to i64
  %arrayidx257 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom256
  %127 = load i8, ptr %arrayidx257, align 1
  %conv258 = zext i8 %127 to i32
  br label %cond.end261

cond.false259:                                    ; preds = %while.body251
  %call260 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end261

cond.end261:                                      ; preds = %cond.false259, %cond.true254
  %cond262 = phi i32 [ %conv258, %cond.true254 ], [ %call260, %cond.false259 ]
  %conv263 = trunc i32 %cond262 to i8
  %conv264 = zext i8 %conv263 to i64
  %128 = load i32, ptr %k, align 4
  %sh_prom265 = zext i32 %128 to i64
  %shl266 = shl i64 %conv264, %sh_prom265
  %129 = load i64, ptr %b, align 8
  %or267 = or i64 %129, %shl266
  store i64 %or267, ptr %b, align 8
  %130 = load i32, ptr %k, align 4
  %add268 = add i32 %130, 8
  store i32 %add268, ptr %k, align 4
  br label %while.cond248, !llvm.loop !121

while.end269:                                     ; preds = %while.cond248
  %131 = load i64, ptr %b, align 8
  %conv270 = trunc i64 %131 to i32
  %and271 = and i32 %conv270, 127
  %add272 = add i32 11, %and271
  store i32 %add272, ptr %j, align 4
  %132 = load i64, ptr %b, align 8
  %shr273 = lshr i64 %132, 7
  store i64 %shr273, ptr %b, align 8
  %133 = load i32, ptr %k, align 4
  %sub274 = sub i32 %133, 7
  store i32 %sub274, ptr %k, align 4
  %134 = load i32, ptr %i, align 4
  %135 = load i32, ptr %j, align 4
  %add275 = add i32 %134, %135
  %136 = load i32, ptr %n, align 4
  %cmp276 = icmp ugt i32 %add275, %136
  br i1 %cmp276, label %if.then278, label %if.end279

if.then278:                                       ; preds = %while.end269
  store i32 1, ptr %retval, align 4
  br label %return

if.end279:                                        ; preds = %while.end269
  br label %while.cond280

while.cond280:                                    ; preds = %while.body283, %if.end279
  %137 = load i32, ptr %j, align 4
  %dec281 = add i32 %137, -1
  store i32 %dec281, ptr %j, align 4
  %tobool282 = icmp ne i32 %137, 0
  br i1 %tobool282, label %while.body283, label %while.end287

while.body283:                                    ; preds = %while.cond280
  %138 = load i32, ptr %i, align 4
  %inc284 = add nsw i32 %138, 1
  store i32 %inc284, ptr %i, align 4
  %idxprom285 = sext i32 %138 to i64
  %arrayidx286 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 %idxprom285
  store i32 0, ptr %arrayidx286, align 4
  br label %while.cond280, !llvm.loop !122

while.end287:                                     ; preds = %while.cond280
  store i32 0, ptr %l, align 4
  br label %if.end288

if.end288:                                        ; preds = %while.end287, %while.end246
  br label %if.end289

if.end289:                                        ; preds = %if.end288, %while.end202
  br label %if.end290

if.end290:                                        ; preds = %if.end289, %if.then158
  br label %while.cond122, !llvm.loop !123

while.end291:                                     ; preds = %while.cond122
  %139 = load ptr, ptr %tl, align 8
  %call292 = call i32 @huft_free(ptr noundef %139)
  %140 = load i64, ptr %b, align 8
  store i64 %140, ptr @bb, align 8
  %141 = load i32, ptr %k, align 4
  store i32 %141, ptr @bk, align 4
  %142 = load i32, ptr @lbits, align 4
  store i32 %142, ptr %bl, align 4
  %arraydecay293 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 0
  %143 = load i32, ptr %nl, align 4
  %call294 = call i32 @huft_build(ptr noundef %arraydecay293, i32 noundef %143, i32 noundef 257, ptr noundef @cplens, ptr noundef @cplext, ptr noundef %tl, ptr noundef %bl)
  store i32 %call294, ptr %i, align 4
  %cmp295 = icmp ne i32 %call294, 0
  br i1 %cmp295, label %if.then297, label %if.end304

if.then297:                                       ; preds = %while.end291
  %144 = load i32, ptr %i, align 4
  %cmp298 = icmp eq i32 %144, 1
  br i1 %cmp298, label %if.then300, label %if.end303

if.then300:                                       ; preds = %if.then297
  %145 = load ptr, ptr @stderr, align 8
  %call301 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %145, ptr noundef @.str.191)
  %146 = load ptr, ptr %tl, align 8
  %call302 = call i32 @huft_free(ptr noundef %146)
  br label %if.end303

if.end303:                                        ; preds = %if.then300, %if.then297
  %147 = load i32, ptr %i, align 4
  store i32 %147, ptr %retval, align 4
  br label %return

if.end304:                                        ; preds = %while.end291
  %148 = load i32, ptr @dbits, align 4
  store i32 %148, ptr %bd, align 4
  %arraydecay305 = getelementptr inbounds [316 x i32], ptr %ll, i64 0, i64 0
  %149 = load i32, ptr %nl, align 4
  %idx.ext306 = zext i32 %149 to i64
  %add.ptr307 = getelementptr inbounds i32, ptr %arraydecay305, i64 %idx.ext306
  %150 = load i32, ptr %nd, align 4
  %call308 = call i32 @huft_build(ptr noundef %add.ptr307, i32 noundef %150, i32 noundef 0, ptr noundef @cpdist, ptr noundef @cpdext, ptr noundef %td, ptr noundef %bd)
  store i32 %call308, ptr %i, align 4
  %cmp309 = icmp ne i32 %call308, 0
  br i1 %cmp309, label %if.then311, label %if.end319

if.then311:                                       ; preds = %if.end304
  %151 = load i32, ptr %i, align 4
  %cmp312 = icmp eq i32 %151, 1
  br i1 %cmp312, label %if.then314, label %if.end317

if.then314:                                       ; preds = %if.then311
  %152 = load ptr, ptr @stderr, align 8
  %call315 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %152, ptr noundef @.str.1.192)
  %153 = load ptr, ptr %td, align 8
  %call316 = call i32 @huft_free(ptr noundef %153)
  br label %if.end317

if.end317:                                        ; preds = %if.then314, %if.then311
  %154 = load ptr, ptr %tl, align 8
  %call318 = call i32 @huft_free(ptr noundef %154)
  %155 = load i32, ptr %i, align 4
  store i32 %155, ptr %retval, align 4
  br label %return

if.end319:                                        ; preds = %if.end304
  %156 = load ptr, ptr %tl, align 8
  %157 = load ptr, ptr %td, align 8
  %158 = load i32, ptr %bl, align 4
  %159 = load i32, ptr %bd, align 4
  %call320 = call i32 @inflate_codes(ptr noundef %156, ptr noundef %157, i32 noundef %158, i32 noundef %159)
  %tobool321 = icmp ne i32 %call320, 0
  br i1 %tobool321, label %if.then322, label %if.end323

if.then322:                                       ; preds = %if.end319
  store i32 1, ptr %retval, align 4
  br label %return

if.end323:                                        ; preds = %if.end319
  %160 = load ptr, ptr %tl, align 8
  %call324 = call i32 @huft_free(ptr noundef %160)
  %161 = load ptr, ptr %td, align 8
  %call325 = call i32 @huft_free(ptr noundef %161)
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end323, %if.then322, %if.end317, %if.end303, %if.then278, %if.then237, %if.then195, %if.end116, %if.then
  %162 = load i32, ptr %retval, align 4
  ret i32 %162
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inflate_block(ptr noundef %e) #0 {
entry:
  %retval = alloca i32, align 4
  %e.addr = alloca ptr, align 8
  %t = alloca i32, align 4
  %b = alloca i64, align 8
  %k = alloca i32, align 4
  store ptr %e, ptr %e.addr, align 8
  %0 = load i64, ptr @bb, align 8
  store i64 %0, ptr %b, align 8
  %1 = load i32, ptr @bk, align 4
  store i32 %1, ptr %k, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %entry
  %2 = load i32, ptr %k, align 4
  %cmp = icmp ult i32 %2, 1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, ptr @inptr, align 4
  %4 = load i32, ptr @insize, align 4
  %cmp1 = icmp ult i32 %3, %4
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %5 = load i32, ptr @inptr, align 4
  %inc = add i32 %5, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %5 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %6 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %6 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %conv2 = trunc i32 %cond to i8
  %conv3 = zext i8 %conv2 to i64
  %7 = load i32, ptr %k, align 4
  %sh_prom = zext i32 %7 to i64
  %shl = shl i64 %conv3, %sh_prom
  %8 = load i64, ptr %b, align 8
  %or = or i64 %8, %shl
  store i64 %or, ptr %b, align 8
  %9 = load i32, ptr %k, align 4
  %add = add i32 %9, 8
  store i32 %add, ptr %k, align 4
  br label %while.cond, !llvm.loop !124

while.end:                                        ; preds = %while.cond
  %10 = load i64, ptr %b, align 8
  %conv4 = trunc i64 %10 to i32
  %and = and i32 %conv4, 1
  %11 = load ptr, ptr %e.addr, align 8
  store i32 %and, ptr %11, align 4
  %12 = load i64, ptr %b, align 8
  %shr = lshr i64 %12, 1
  store i64 %shr, ptr %b, align 8
  %13 = load i32, ptr %k, align 4
  %sub = sub i32 %13, 1
  store i32 %sub, ptr %k, align 4
  br label %while.cond5

while.cond5:                                      ; preds = %cond.end18, %while.end
  %14 = load i32, ptr %k, align 4
  %cmp6 = icmp ult i32 %14, 2
  br i1 %cmp6, label %while.body8, label %while.end26

while.body8:                                      ; preds = %while.cond5
  %15 = load i32, ptr @inptr, align 4
  %16 = load i32, ptr @insize, align 4
  %cmp9 = icmp ult i32 %15, %16
  br i1 %cmp9, label %cond.true11, label %cond.false16

cond.true11:                                      ; preds = %while.body8
  %17 = load i32, ptr @inptr, align 4
  %inc12 = add i32 %17, 1
  store i32 %inc12, ptr @inptr, align 4
  %idxprom13 = zext i32 %17 to i64
  %arrayidx14 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom13
  %18 = load i8, ptr %arrayidx14, align 1
  %conv15 = zext i8 %18 to i32
  br label %cond.end18

cond.false16:                                     ; preds = %while.body8
  %call17 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false16, %cond.true11
  %cond19 = phi i32 [ %conv15, %cond.true11 ], [ %call17, %cond.false16 ]
  %conv20 = trunc i32 %cond19 to i8
  %conv21 = zext i8 %conv20 to i64
  %19 = load i32, ptr %k, align 4
  %sh_prom22 = zext i32 %19 to i64
  %shl23 = shl i64 %conv21, %sh_prom22
  %20 = load i64, ptr %b, align 8
  %or24 = or i64 %20, %shl23
  store i64 %or24, ptr %b, align 8
  %21 = load i32, ptr %k, align 4
  %add25 = add i32 %21, 8
  store i32 %add25, ptr %k, align 4
  br label %while.cond5, !llvm.loop !125

while.end26:                                      ; preds = %while.cond5
  %22 = load i64, ptr %b, align 8
  %conv27 = trunc i64 %22 to i32
  %and28 = and i32 %conv27, 3
  store i32 %and28, ptr %t, align 4
  %23 = load i64, ptr %b, align 8
  %shr29 = lshr i64 %23, 2
  store i64 %shr29, ptr %b, align 8
  %24 = load i32, ptr %k, align 4
  %sub30 = sub i32 %24, 2
  store i32 %sub30, ptr %k, align 4
  %25 = load i64, ptr %b, align 8
  store i64 %25, ptr @bb, align 8
  %26 = load i32, ptr %k, align 4
  store i32 %26, ptr @bk, align 4
  %27 = load i32, ptr %t, align 4
  %cmp31 = icmp eq i32 %27, 2
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %while.end26
  %call33 = call i32 @inflate_dynamic()
  store i32 %call33, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end26
  %28 = load i32, ptr %t, align 4
  %cmp34 = icmp eq i32 %28, 0
  br i1 %cmp34, label %if.then36, label %if.end38

if.then36:                                        ; preds = %if.end
  %call37 = call i32 @inflate_stored()
  store i32 %call37, ptr %retval, align 4
  br label %return

if.end38:                                         ; preds = %if.end
  %29 = load i32, ptr %t, align 4
  %cmp39 = icmp eq i32 %29, 1
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end38
  %call42 = call i32 @inflate_fixed()
  store i32 %call42, ptr %retval, align 4
  br label %return

if.end43:                                         ; preds = %if.end38
  store i32 2, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end43, %if.then41, %if.then36, %if.then
  %30 = load i32, ptr %retval, align 4
  ret i32 %30
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @inflate() #0 {
entry:
  %retval = alloca i32, align 4
  %e = alloca i32, align 4
  %r = alloca i32, align 4
  %h = alloca i32, align 4
  store i32 0, ptr @outcnt, align 4
  store i32 0, ptr @bk, align 4
  store i64 0, ptr @bb, align 8
  store i32 0, ptr %h, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  store i32 0, ptr @hufts, align 4
  %call = call i32 @inflate_block(ptr noundef %e)
  store i32 %call, ptr %r, align 4
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %0 = load i32, ptr %r, align 4
  store i32 %0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %do.body
  %1 = load i32, ptr @hufts, align 4
  %2 = load i32, ptr %h, align 4
  %cmp1 = icmp ugt i32 %1, %2
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i32, ptr @hufts, align 4
  store i32 %3, ptr %h, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  br label %do.cond

do.cond:                                          ; preds = %if.end3
  %4 = load i32, ptr %e, align 4
  %tobool = icmp ne i32 %4, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %do.body, label %do.end, !llvm.loop !126

do.end:                                           ; preds = %do.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.end
  %5 = load i32, ptr @bk, align 4
  %cmp4 = icmp uge i32 %5, 8
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load i32, ptr @bk, align 4
  %sub = sub i32 %6, 8
  store i32 %sub, ptr @bk, align 4
  %7 = load i32, ptr @inptr, align 4
  %dec = add i32 %7, -1
  store i32 %dec, ptr @inptr, align 4
  br label %while.cond, !llvm.loop !127

while.end:                                        ; preds = %while.cond
  %8 = load i32, ptr @outcnt, align 4
  store i32 %8, ptr @outcnt, align 4
  call void @flush_window()
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @copy(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  %call = call ptr @__errno_location() #13
  store i32 0, ptr %call, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, ptr @insize, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, ptr @insize, align 4
  %cmp1 = icmp ne i32 %1, -1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %2 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %3 = load i32, ptr %out.addr, align 4
  %4 = load i32, ptr @insize, align 4
  call void @write_buf(i32 noundef %3, ptr noundef @inbuf, i32 noundef %4)
  %5 = load i32, ptr @insize, align 4
  %conv = zext i32 %5 to i64
  %6 = load i64, ptr @bytes_out, align 8
  %add = add nsw i64 %6, %conv
  store i64 %add, ptr @bytes_out, align 8
  %7 = load i32, ptr %in.addr, align 4
  %call2 = call i64 @read(i32 noundef %7, ptr noundef @inbuf, i64 noundef 32768)
  %conv3 = trunc i64 %call2 to i32
  store i32 %conv3, ptr @insize, align 4
  br label %while.cond, !llvm.loop !128

while.end:                                        ; preds = %land.end
  %8 = load i32, ptr @insize, align 4
  %cmp4 = icmp eq i32 %8, -1
  br i1 %cmp4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end
  %call6 = call ptr @__errno_location() #13
  %9 = load i32, ptr %call6, align 4
  %cmp7 = icmp ne i32 %9, 0
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @read_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.end
  %10 = load i64, ptr @bytes_out, align 8
  store i64 %10, ptr @bytes_in, align 8
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @write_buf(i32 noundef %fd, ptr noundef %buf, i32 noundef %cnt) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca ptr, align 8
  %cnt.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %fd, ptr %fd.addr, align 4
  store ptr %buf, ptr %buf.addr, align 8
  store i32 %cnt, ptr %cnt.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, ptr %fd.addr, align 4
  %1 = load ptr, ptr %buf.addr, align 8
  %2 = load i32, ptr %cnt.addr, align 4
  %conv = zext i32 %2 to i64
  %call = call i64 @write(i32 noundef %0, ptr noundef %1, i64 noundef %conv)
  %conv1 = trunc i64 %call to i32
  store i32 %conv1, ptr %n, align 4
  %3 = load i32, ptr %cnt.addr, align 4
  %cmp = icmp ne i32 %conv1, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, ptr %n, align 4
  %cmp3 = icmp eq i32 %4, -1
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  call void @write_error()
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %5 = load i32, ptr %n, align 4
  %6 = load i32, ptr %cnt.addr, align 4
  %sub = sub i32 %6, %5
  store i32 %sub, ptr %cnt.addr, align 4
  %7 = load ptr, ptr %buf.addr, align 8
  %8 = load i32, ptr %n, align 4
  %idx.ext = zext i32 %8 to i64
  %add.ptr = getelementptr inbounds i8, ptr %7, i64 %idx.ext
  store ptr %add.ptr, ptr %buf.addr, align 8
  br label %while.cond, !llvm.loop !129

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @read_error() #0 {
entry:
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.5.199, ptr noundef %1)
  %call1 = call ptr @__errno_location() #13
  %2 = load i32, ptr %call1, align 4
  %cmp = icmp ne i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @perror(ptr noundef @ifname)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr @stderr, align 8
  %call2 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.6.200, ptr noundef @ifname)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @abort_gzip()
  ret void
}

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @write_error() #0 {
entry:
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.5.199, ptr noundef %1)
  call void @perror(ptr noundef @ofname)
  call void @abort_gzip()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @updcrc(ptr noundef %s, i32 noundef %n) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %c = alloca i64, align 8
  store ptr %s, ptr %s.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %s.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 4294967295, ptr %c, align 8
  br label %if.end5

if.else:                                          ; preds = %entry
  %1 = load i64, ptr @updcrc.crc, align 8
  store i64 %1, ptr %c, align 8
  %2 = load i32, ptr %n.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.else
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then1
  %3 = load i64, ptr %c, align 8
  %conv = trunc i64 %3 to i32
  %4 = load ptr, ptr %s.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %4, i32 1
  store ptr %incdec.ptr, ptr %s.addr, align 8
  %5 = load i8, ptr %4, align 1
  %conv2 = zext i8 %5 to i32
  %xor = xor i32 %conv, %conv2
  %and = and i32 %xor, 255
  %idxprom = sext i32 %and to i64
  %arrayidx = getelementptr inbounds [0 x i64], ptr @crc_32_tab, i64 0, i64 %idxprom
  %6 = load i64, ptr %arrayidx, align 8
  %7 = load i64, ptr %c, align 8
  %shr = lshr i64 %7, 8
  %xor3 = xor i64 %6, %shr
  store i64 %xor3, ptr %c, align 8
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %8 = load i32, ptr %n.addr, align 4
  %dec = add i32 %8, -1
  store i32 %dec, ptr %n.addr, align 4
  %tobool4 = icmp ne i32 %dec, 0
  br i1 %tobool4, label %do.body, label %do.end, !llvm.loop !130

do.end:                                           ; preds = %do.cond
  br label %if.end

if.end:                                           ; preds = %do.end, %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %9 = load i64, ptr %c, align 8
  store i64 %9, ptr @updcrc.crc, align 8
  %10 = load i64, ptr %c, align 8
  %xor6 = xor i64 %10, 4294967295
  ret i64 %xor6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clear_bufs() #0 {
entry:
  store i32 0, ptr @outcnt, align 4
  store i32 0, ptr @inptr, align 4
  store i32 0, ptr @insize, align 4
  store i64 0, ptr @bytes_out, align 8
  store i64 0, ptr @bytes_in, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fill_inbuf(i32 noundef %eof_ok) #0 {
entry:
  %retval = alloca i32, align 4
  %eof_ok.addr = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 %eof_ok, ptr %eof_ok.addr, align 4
  store i32 0, ptr @insize, align 4
  %call = call ptr @__errno_location() #13
  store i32 0, ptr %call, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, ptr @ifd, align 4
  %1 = load i32, ptr @insize, align 4
  %idx.ext = zext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext
  %2 = load i32, ptr @insize, align 4
  %sub = sub i32 32768, %2
  %conv = zext i32 %sub to i64
  %call1 = call i64 @read(i32 noundef %0, ptr noundef %add.ptr, i64 noundef %conv)
  %conv2 = trunc i64 %call1 to i32
  store i32 %conv2, ptr %len, align 4
  %3 = load i32, ptr %len, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.body
  %4 = load i32, ptr %len, align 4
  %cmp4 = icmp eq i32 %4, -1
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %do.body
  br label %do.end

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i32, ptr %len, align 4
  %6 = load i32, ptr @insize, align 4
  %add = add i32 %6, %5
  store i32 %add, ptr @insize, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %7 = load i32, ptr @insize, align 4
  %cmp6 = icmp ult i32 %7, 32768
  br i1 %cmp6, label %do.body, label %do.end, !llvm.loop !131

do.end:                                           ; preds = %do.cond, %if.then
  %8 = load i32, ptr @insize, align 4
  %cmp8 = icmp eq i32 %8, 0
  br i1 %cmp8, label %if.then10, label %if.end13

if.then10:                                        ; preds = %do.end
  %9 = load i32, ptr %eof_ok.addr, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.then10
  store i32 -1, ptr %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.then10
  call void @read_error()
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %do.end
  %10 = load i32, ptr @insize, align 4
  %conv14 = zext i32 %10 to i64
  %11 = load i64, ptr @bytes_in, align 8
  %add15 = add i64 %11, %conv14
  store i64 %add15, ptr @bytes_in, align 8
  store i32 1, ptr @inptr, align 4
  %12 = load i8, ptr @inbuf, align 1
  %conv16 = zext i8 %12 to i32
  store i32 %conv16, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then11
  %13 = load i32, ptr %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @flush_outbuf() #0 {
entry:
  %0 = load i32, ptr @outcnt, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, ptr @ofd, align 4
  %2 = load i32, ptr @outcnt, align 4
  call void @write_buf(i32 noundef %1, ptr noundef @outbuf, i32 noundef %2)
  %3 = load i32, ptr @outcnt, align 4
  %conv = zext i32 %3 to i64
  %4 = load i64, ptr @bytes_out, align 8
  %add = add i64 %4, %conv
  store i64 %add, ptr @bytes_out, align 8
  store i32 0, ptr @outcnt, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @flush_window() #0 {
entry:
  %0 = load i32, ptr @outcnt, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, ptr @outcnt, align 4
  %call = call i64 @updcrc(ptr noundef @window, i32 noundef %1)
  %2 = load i32, ptr @test, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end2, label %if.then1

if.then1:                                         ; preds = %if.end
  %3 = load i32, ptr @ofd, align 4
  %4 = load i32, ptr @outcnt, align 4
  call void @write_buf(i32 noundef %3, ptr noundef @window, i32 noundef %4)
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %5 = load i32, ptr @outcnt, align 4
  %conv = zext i32 %5 to i64
  %6 = load i64, ptr @bytes_out, align 8
  %add = add i64 %6, %conv
  store i64 %add, ptr @bytes_out, align 8
  store i32 0, ptr @outcnt, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @strlwr(ptr noundef %s) #0 {
entry:
  %s.addr = alloca ptr, align 8
  %t = alloca ptr, align 8
  store ptr %s, ptr %s.addr, align 8
  %0 = load ptr, ptr %s.addr, align 8
  store ptr %0, ptr %t, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load ptr, ptr %t, align 8
  %2 = load i8, ptr %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call ptr @__ctype_b_loc() #13
  %3 = load ptr, ptr %call, align 8
  %4 = load ptr, ptr %t, align 8
  %5 = load i8, ptr %4, align 1
  %conv = sext i8 %5 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx = getelementptr inbounds i16, ptr %3, i64 %idxprom
  %6 = load i16, ptr %arrayidx, align 2
  %conv1 = zext i16 %6 to i32
  %and = and i32 %conv1, 256
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %7 = load ptr, ptr %t, align 8
  %8 = load i8, ptr %7, align 1
  %conv3 = sext i8 %8 to i32
  %sub = sub nsw i32 %conv3, 65
  %add = add nsw i32 %sub, 97
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %9 = load ptr, ptr %t, align 8
  %10 = load i8, ptr %9, align 1
  %conv4 = sext i8 %10 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %conv4, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  %11 = load ptr, ptr %t, align 8
  store i8 %conv5, ptr %11, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %12 = load ptr, ptr %t, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %12, i32 1
  store ptr %incdec.ptr, ptr %t, align 8
  br label %for.cond, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %13 = load ptr, ptr %s.addr, align 8
  ret ptr %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @basename(ptr noundef %fname) #0 {
entry:
  %fname.addr = alloca ptr, align 8
  %p = alloca ptr, align 8
  store ptr %fname, ptr %fname.addr, align 8
  %0 = load ptr, ptr %fname.addr, align 8
  %call = call ptr @strrchr(ptr noundef %0, i32 noundef 47) #10
  store ptr %call, ptr %p, align 8
  %cmp = icmp ne ptr %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %1, i64 1
  store ptr %add.ptr, ptr %fname.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load ptr, ptr %fname.addr, align 8
  ret ptr %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @make_simple_name(ptr noundef %name) #0 {
entry:
  %name.addr = alloca ptr, align 8
  %p = alloca ptr, align 8
  store ptr %name, ptr %name.addr, align 8
  %0 = load ptr, ptr %name.addr, align 8
  %call = call ptr @strrchr(ptr noundef %0, i32 noundef 46) #10
  store ptr %call, ptr %p, align 8
  %1 = load ptr, ptr %p, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.end

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %p, align 8
  %3 = load ptr, ptr %name.addr, align 8
  %cmp1 = icmp eq ptr %2, %3
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %4 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %4, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end3
  %5 = load ptr, ptr %p, align 8
  %incdec.ptr4 = getelementptr inbounds i8, ptr %5, i32 -1
  store ptr %incdec.ptr4, ptr %p, align 8
  %6 = load i8, ptr %incdec.ptr4, align 1
  %conv = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv, 46
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %do.body
  %7 = load ptr, ptr %p, align 8
  store i8 95, ptr %7, align 1
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %do.body
  br label %do.cond

do.cond:                                          ; preds = %if.end8
  %8 = load ptr, ptr %p, align 8
  %9 = load ptr, ptr %name.addr, align 8
  %cmp9 = icmp ne ptr %8, %9
  br i1 %cmp9, label %do.body, label %do.end, !llvm.loop !133

do.end:                                           ; preds = %if.then, %do.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @add_envopt(ptr noundef %argcp, ptr noundef %argvp, ptr noundef %env) #0 {
entry:
  %retval = alloca ptr, align 8
  %argcp.addr = alloca ptr, align 8
  %argvp.addr = alloca ptr, align 8
  %env.addr = alloca ptr, align 8
  %p = alloca ptr, align 8
  %oargv = alloca ptr, align 8
  %nargv = alloca ptr, align 8
  %oargc = alloca i32, align 4
  %nargc = alloca i32, align 4
  store ptr %argcp, ptr %argcp.addr, align 8
  store ptr %argvp, ptr %argvp.addr, align 8
  store ptr %env, ptr %env.addr, align 8
  %0 = load ptr, ptr %argcp.addr, align 8
  %1 = load i32, ptr %0, align 4
  store i32 %1, ptr %oargc, align 4
  store i32 0, ptr %nargc, align 4
  %2 = load ptr, ptr %env.addr, align 8
  %call = call ptr @getenv(ptr noundef %2) #11
  store ptr %call, ptr %env.addr, align 8
  %3 = load ptr, ptr %env.addr, align 8
  %cmp = icmp eq ptr %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %4 = load ptr, ptr %env.addr, align 8
  %call1 = call i64 @strlen(ptr noundef %4) #10
  %add = add i64 %call1, 1
  %conv = trunc i64 %add to i32
  %call2 = call ptr @xmalloc(i32 noundef %conv)
  store ptr %call2, ptr %p, align 8
  %5 = load ptr, ptr %p, align 8
  %6 = load ptr, ptr %env.addr, align 8
  %call3 = call ptr @strcpy(ptr noundef %5, ptr noundef %6) #11
  store ptr %call3, ptr %env.addr, align 8
  %7 = load ptr, ptr %env.addr, align 8
  store ptr %7, ptr %p, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load ptr, ptr %p, align 8
  %9 = load i8, ptr %8, align 1
  %tobool = icmp ne i8 %9, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load ptr, ptr %p, align 8
  %call4 = call i64 @strspn(ptr noundef %10, ptr noundef @.str.219) #10
  %11 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds i8, ptr %11, i64 %call4
  store ptr %add.ptr, ptr %p, align 8
  %12 = load ptr, ptr %p, align 8
  %13 = load i8, ptr %12, align 1
  %conv5 = sext i8 %13 to i32
  %cmp6 = icmp eq i32 %conv5, 0
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %for.body
  br label %for.end

if.end9:                                          ; preds = %for.body
  %14 = load ptr, ptr %p, align 8
  %call10 = call i64 @strcspn(ptr noundef %14, ptr noundef @.str.219) #10
  %15 = load ptr, ptr %p, align 8
  %add.ptr11 = getelementptr inbounds i8, ptr %15, i64 %call10
  store ptr %add.ptr11, ptr %p, align 8
  %16 = load ptr, ptr %p, align 8
  %17 = load i8, ptr %16, align 1
  %tobool12 = icmp ne i8 %17, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end9
  %18 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %18, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  store i8 0, ptr %18, align 1
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end9
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %19 = load i32, ptr %nargc, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, ptr %nargc, align 4
  br label %for.cond, !llvm.loop !134

for.end:                                          ; preds = %if.then8, %for.cond
  %20 = load i32, ptr %nargc, align 4
  %cmp15 = icmp eq i32 %20, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %for.end
  %21 = load ptr, ptr %env.addr, align 8
  call void @free(ptr noundef %21) #11
  store ptr null, ptr %retval, align 8
  br label %return

if.end18:                                         ; preds = %for.end
  %22 = load i32, ptr %nargc, align 4
  %23 = load ptr, ptr %argcp.addr, align 8
  %24 = load i32, ptr %23, align 4
  %add19 = add nsw i32 %24, %22
  store i32 %add19, ptr %23, align 4
  %25 = load ptr, ptr %argcp.addr, align 8
  %26 = load i32, ptr %25, align 4
  %add20 = add nsw i32 %26, 1
  %conv21 = sext i32 %add20 to i64
  %call22 = call noalias ptr @calloc(i64 noundef %conv21, i64 noundef 8) #15
  store ptr %call22, ptr %nargv, align 8
  %27 = load ptr, ptr %nargv, align 8
  %cmp23 = icmp eq ptr %27, null
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end18
  call void @error(ptr noundef @.str.1.220)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end18
  %28 = load ptr, ptr %argvp.addr, align 8
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %oargv, align 8
  %30 = load ptr, ptr %nargv, align 8
  %31 = load ptr, ptr %argvp.addr, align 8
  store ptr %30, ptr %31, align 8
  %32 = load i32, ptr %oargc, align 4
  %dec = add nsw i32 %32, -1
  store i32 %dec, ptr %oargc, align 4
  %cmp27 = icmp slt i32 %32, 0
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  call void @error(ptr noundef @.str.2.223)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end26
  %33 = load ptr, ptr %oargv, align 8
  %incdec.ptr31 = getelementptr inbounds ptr, ptr %33, i32 1
  store ptr %incdec.ptr31, ptr %oargv, align 8
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %nargv, align 8
  %incdec.ptr32 = getelementptr inbounds ptr, ptr %35, i32 1
  store ptr %incdec.ptr32, ptr %nargv, align 8
  store ptr %34, ptr %35, align 8
  %36 = load ptr, ptr %env.addr, align 8
  store ptr %36, ptr %p, align 8
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc42, %if.end30
  %37 = load i32, ptr %nargc, align 4
  %cmp34 = icmp sgt i32 %37, 0
  br i1 %cmp34, label %for.body36, label %for.end44

for.body36:                                       ; preds = %for.cond33
  %38 = load ptr, ptr %p, align 8
  %call37 = call i64 @strspn(ptr noundef %38, ptr noundef @.str.219) #10
  %39 = load ptr, ptr %p, align 8
  %add.ptr38 = getelementptr inbounds i8, ptr %39, i64 %call37
  store ptr %add.ptr38, ptr %p, align 8
  %40 = load ptr, ptr %p, align 8
  %41 = load ptr, ptr %nargv, align 8
  %incdec.ptr39 = getelementptr inbounds ptr, ptr %41, i32 1
  store ptr %incdec.ptr39, ptr %nargv, align 8
  store ptr %40, ptr %41, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body36
  %42 = load ptr, ptr %p, align 8
  %incdec.ptr40 = getelementptr inbounds i8, ptr %42, i32 1
  store ptr %incdec.ptr40, ptr %p, align 8
  %43 = load i8, ptr %42, align 1
  %tobool41 = icmp ne i8 %43, 0
  br i1 %tobool41, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond, !llvm.loop !135

while.end:                                        ; preds = %while.cond
  br label %for.inc42

for.inc42:                                        ; preds = %while.end
  %44 = load i32, ptr %nargc, align 4
  %dec43 = add nsw i32 %44, -1
  store i32 %dec43, ptr %nargc, align 4
  br label %for.cond33, !llvm.loop !136

for.end44:                                        ; preds = %for.cond33
  br label %while.cond45

while.cond45:                                     ; preds = %while.body48, %for.end44
  %45 = load i32, ptr %oargc, align 4
  %dec46 = add nsw i32 %45, -1
  store i32 %dec46, ptr %oargc, align 4
  %tobool47 = icmp ne i32 %45, 0
  br i1 %tobool47, label %while.body48, label %while.end51

while.body48:                                     ; preds = %while.cond45
  %46 = load ptr, ptr %oargv, align 8
  %incdec.ptr49 = getelementptr inbounds ptr, ptr %46, i32 1
  store ptr %incdec.ptr49, ptr %oargv, align 8
  %47 = load ptr, ptr %46, align 8
  %48 = load ptr, ptr %nargv, align 8
  %incdec.ptr50 = getelementptr inbounds ptr, ptr %48, i32 1
  store ptr %incdec.ptr50, ptr %nargv, align 8
  store ptr %47, ptr %48, align 8
  br label %while.cond45, !llvm.loop !137

while.end51:                                      ; preds = %while.cond45
  %49 = load ptr, ptr %nargv, align 8
  store ptr null, ptr %49, align 8
  %50 = load ptr, ptr %env.addr, align 8
  store ptr %50, ptr %retval, align 8
  br label %return

return:                                           ; preds = %while.end51, %if.then17, %if.then
  %51 = load ptr, ptr %retval, align 8
  ret ptr %51
}

; Function Attrs: nounwind
declare ptr @getenv(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @xmalloc(i32 noundef %size) #0 {
entry:
  %size.addr = alloca i32, align 4
  %cp = alloca ptr, align 8
  store i32 %size, ptr %size.addr, align 4
  %0 = load i32, ptr %size.addr, align 4
  %conv = zext i32 %0 to i64
  %call = call noalias ptr @malloc(i64 noundef %conv) #14
  store ptr %call, ptr %cp, align 8
  %1 = load ptr, ptr %cp, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @error(ptr noundef @.str.1.220)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load ptr, ptr %cp, align 8
  ret ptr %2
}

; Function Attrs: nounwind readonly willreturn
declare i64 @strspn(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #9

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @error(ptr noundef %m) #0 {
entry:
  %m.addr = alloca ptr, align 8
  store ptr %m, ptr %m.addr, align 8
  %0 = load ptr, ptr @stderr, align 8
  %1 = load ptr, ptr @progname, align 8
  %2 = load ptr, ptr %m.addr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.3.224, ptr noundef %1, ptr noundef @ifname, ptr noundef %2)
  call void @abort_gzip()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @warn(ptr noundef %a, ptr noundef %b) #0 {
entry:
  %a.addr = alloca ptr, align 8
  %b.addr = alloca ptr, align 8
  store ptr %a, ptr %a.addr, align 8
  store ptr %b, ptr %b.addr, align 8
  %0 = load i32, ptr @quiet, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8
  %2 = load ptr, ptr @progname, align 8
  %3 = load ptr, ptr %a.addr, align 8
  %4 = load ptr, ptr %b.addr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.4.227, ptr noundef %2, ptr noundef @ifname, ptr noundef %3, ptr noundef %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, ptr @exit_code, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 2, ptr @exit_code, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @display_ratio(i64 noundef %num, i64 noundef %den, ptr noundef %file) #0 {
entry:
  %num.addr = alloca i64, align 8
  %den.addr = alloca i64, align 8
  %file.addr = alloca ptr, align 8
  %ratio = alloca i64, align 8
  store i64 %num, ptr %num.addr, align 8
  store i64 %den, ptr %den.addr, align 8
  store ptr %file, ptr %file.addr, align 8
  %0 = load i64, ptr %den.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 0, ptr %ratio, align 8
  br label %if.end6

if.else:                                          ; preds = %entry
  %1 = load i64, ptr %den.addr, align 8
  %cmp1 = icmp slt i64 %1, 2147483
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  %2 = load i64, ptr %num.addr, align 8
  %mul = mul nsw i64 1000, %2
  %3 = load i64, ptr %den.addr, align 8
  %div = sdiv i64 %mul, %3
  store i64 %div, ptr %ratio, align 8
  br label %if.end

if.else3:                                         ; preds = %if.else
  %4 = load i64, ptr %num.addr, align 8
  %5 = load i64, ptr %den.addr, align 8
  %div4 = sdiv i64 %5, 1000
  %div5 = sdiv i64 %4, %div4
  store i64 %div5, ptr %ratio, align 8
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  %6 = load i64, ptr %ratio, align 8
  %cmp7 = icmp slt i64 %6, 0
  br i1 %cmp7, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.end6
  %7 = load ptr, ptr %file.addr, align 8
  %call = call i32 @putc(i32 noundef 45, ptr noundef %7)
  %8 = load i64, ptr %ratio, align 8
  %sub = sub nsw i64 0, %8
  store i64 %sub, ptr %ratio, align 8
  br label %if.end11

if.else9:                                         ; preds = %if.end6
  %9 = load ptr, ptr %file.addr, align 8
  %call10 = call i32 @putc(i32 noundef 32, ptr noundef %9)
  br label %if.end11

if.end11:                                         ; preds = %if.else9, %if.then8
  %10 = load ptr, ptr %file.addr, align 8
  %11 = load i64, ptr %ratio, align 8
  %div12 = sdiv i64 %11, 10
  %12 = load i64, ptr %ratio, align 8
  %rem = srem i64 %12, 10
  %call13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.7.230, i64 noundef %div12, i64 noundef %rem)
  ret void
}

declare i32 @putc(i32 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @lzw(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  %0 = load i32, ptr @msg_done, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, ptr @msg_done, align 4
  %1 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.233)
  %2 = load i32, ptr %in.addr, align 4
  %3 = load i32, ptr %out.addr, align 4
  %cmp = icmp ne i32 %2, %3
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 1, ptr @exit_code, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end2, %if.then
  %4 = load i32, ptr %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @unlzw(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  %stackp = alloca ptr, align 8
  %code = alloca i64, align 8
  %finchar = alloca i32, align 4
  %oldcode = alloca i64, align 8
  %incode = alloca i64, align 8
  %inbits = alloca i64, align 8
  %posbits = alloca i64, align 8
  %outpos = alloca i32, align 4
  %bitmask = alloca i32, align 4
  %free_ent = alloca i64, align 8
  %maxcode = alloca i64, align 8
  %maxmaxcode = alloca i64, align 8
  %n_bits = alloca i32, align 4
  %rsize = alloca i32, align 4
  %i = alloca i32, align 4
  %e = alloca i32, align 4
  %o = alloca i32, align 4
  %p = alloca ptr, align 8
  %i177 = alloca i32, align 4
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  %0 = load i32, ptr @inptr, align 4
  %1 = load i32, ptr @insize, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, ptr @inptr, align 4
  %inc = add i32 %2, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, ptr @maxbits, align 4
  %4 = load i32, ptr @maxbits, align 4
  %and = and i32 %4, 128
  store i32 %and, ptr @block_mode, align 4
  %5 = load i32, ptr @maxbits, align 4
  %and1 = and i32 %5, 96
  %cmp2 = icmp ne i32 %and1, 0
  br i1 %cmp2, label %if.then, label %if.end11

if.then:                                          ; preds = %cond.end
  %6 = load i32, ptr @quiet, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.end, label %if.then4

if.then4:                                         ; preds = %if.then
  %7 = load ptr, ptr @stderr, align 8
  %8 = load ptr, ptr @progname, align 8
  %9 = load i32, ptr @maxbits, align 4
  %and5 = and i32 %9, 96
  %call6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.236, ptr noundef %8, ptr noundef @ifname, i32 noundef %and5)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %10 = load i32, ptr @exit_code, align 4
  %cmp7 = icmp eq i32 %10, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  store i32 2, ptr @exit_code, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %cond.end
  %11 = load i32, ptr @maxbits, align 4
  %and12 = and i32 %11, 31
  store i32 %and12, ptr @maxbits, align 4
  %12 = load i32, ptr @maxbits, align 4
  %sh_prom = zext i32 %12 to i64
  %shl = shl i64 1, %sh_prom
  store i64 %shl, ptr %maxmaxcode, align 8
  %13 = load i32, ptr @maxbits, align 4
  %cmp13 = icmp sgt i32 %13, 16
  br i1 %cmp13, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end11
  %14 = load ptr, ptr @stderr, align 8
  %15 = load ptr, ptr @progname, align 8
  %16 = load i32, ptr @maxbits, align 4
  %call16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.1.237, ptr noundef %15, ptr noundef @ifname, i32 noundef %16, i32 noundef 16)
  store i32 1, ptr @exit_code, align 4
  store i32 1, ptr %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end11
  %17 = load i32, ptr @insize, align 4
  store i32 %17, ptr %rsize, align 4
  store i32 9, ptr %n_bits, align 4
  store i64 511, ptr %maxcode, align 8
  %18 = load i32, ptr %n_bits, align 4
  %shl18 = shl i32 1, %18
  %sub = sub nsw i32 %shl18, 1
  store i32 %sub, ptr %bitmask, align 4
  store i64 -1, ptr %oldcode, align 8
  store i32 0, ptr %finchar, align 4
  store i32 0, ptr %outpos, align 4
  %19 = load i32, ptr @inptr, align 4
  %shl19 = shl i32 %19, 3
  %conv20 = zext i32 %shl19 to i64
  store i64 %conv20, ptr %posbits, align 8
  %20 = load i32, ptr @block_mode, align 4
  %tobool21 = icmp ne i32 %20, 0
  %21 = zext i1 %tobool21 to i64
  %cond22 = select i1 %tobool21, i32 257, i32 256
  %conv23 = sext i32 %cond22 to i64
  store i64 %conv23, ptr %free_ent, align 8
  call void @llvm.memset.p0.i64(ptr align 2 @prev, i8 0, i64 256, i1 false)
  store i64 255, ptr %code, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end17
  %22 = load i64, ptr %code, align 8
  %cmp24 = icmp sge i64 %22, 0
  br i1 %cmp24, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load i64, ptr %code, align 8
  %conv26 = trunc i64 %23 to i8
  %24 = load i64, ptr %code, align 8
  %arrayidx27 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %24
  store i8 %conv26, ptr %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i64, ptr %code, align 8
  %dec = add nsw i64 %25, -1
  store i64 %dec, ptr %code, align 8
  br label %for.cond, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %do.cond230, %for.end
  br label %resetbuf

resetbuf:                                         ; preds = %if.then130, %if.end93, %do.body
  %26 = load i32, ptr @insize, align 4
  %27 = load i64, ptr %posbits, align 8
  %shr = ashr i64 %27, 3
  %conv28 = trunc i64 %shr to i32
  store i32 %conv28, ptr %o, align 4
  %sub29 = sub i32 %26, %conv28
  store i32 %sub29, ptr %e, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc38, %resetbuf
  %28 = load i32, ptr %i, align 4
  %29 = load i32, ptr %e, align 4
  %cmp31 = icmp slt i32 %28, %29
  br i1 %cmp31, label %for.body33, label %for.end40

for.body33:                                       ; preds = %for.cond30
  %30 = load i32, ptr %i, align 4
  %31 = load i32, ptr %o, align 4
  %add = add nsw i32 %30, %31
  %idxprom34 = sext i32 %add to i64
  %arrayidx35 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom34
  %32 = load i8, ptr %arrayidx35, align 1
  %33 = load i32, ptr %i, align 4
  %idxprom36 = sext i32 %33 to i64
  %arrayidx37 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom36
  store i8 %32, ptr %arrayidx37, align 1
  br label %for.inc38

for.inc38:                                        ; preds = %for.body33
  %34 = load i32, ptr %i, align 4
  %inc39 = add nsw i32 %34, 1
  store i32 %inc39, ptr %i, align 4
  br label %for.cond30, !llvm.loop !139

for.end40:                                        ; preds = %for.cond30
  %35 = load i32, ptr %e, align 4
  store i32 %35, ptr @insize, align 4
  store i64 0, ptr %posbits, align 8
  %36 = load i32, ptr @insize, align 4
  %cmp41 = icmp ult i32 %36, 64
  br i1 %cmp41, label %if.then43, label %if.end53

if.then43:                                        ; preds = %for.end40
  %37 = load i32, ptr %in.addr, align 4
  %38 = load i32, ptr @insize, align 4
  %idx.ext = zext i32 %38 to i64
  %add.ptr = getelementptr inbounds i8, ptr @inbuf, i64 %idx.ext
  %call44 = call i64 @read(i32 noundef %37, ptr noundef %add.ptr, i64 noundef 32768)
  %conv45 = trunc i64 %call44 to i32
  store i32 %conv45, ptr %rsize, align 4
  %cmp46 = icmp eq i32 %conv45, -1
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.then43
  call void @read_error()
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %if.then43
  %39 = load i32, ptr %rsize, align 4
  %40 = load i32, ptr @insize, align 4
  %add50 = add i32 %40, %39
  store i32 %add50, ptr @insize, align 4
  %41 = load i32, ptr %rsize, align 4
  %conv51 = sext i32 %41 to i64
  %42 = load i64, ptr @bytes_in, align 8
  %add52 = add i64 %42, %conv51
  store i64 %add52, ptr @bytes_in, align 8
  br label %if.end53

if.end53:                                         ; preds = %if.end49, %for.end40
  %43 = load i32, ptr %rsize, align 4
  %cmp54 = icmp ne i32 %43, 0
  br i1 %cmp54, label %cond.true56, label %cond.false61

cond.true56:                                      ; preds = %if.end53
  %44 = load i32, ptr @insize, align 4
  %conv57 = zext i32 %44 to i64
  %45 = load i32, ptr @insize, align 4
  %46 = load i32, ptr %n_bits, align 4
  %rem = urem i32 %45, %46
  %conv58 = zext i32 %rem to i64
  %sub59 = sub nsw i64 %conv57, %conv58
  %shl60 = shl i64 %sub59, 3
  br label %cond.end67

cond.false61:                                     ; preds = %if.end53
  %47 = load i32, ptr @insize, align 4
  %conv62 = zext i32 %47 to i64
  %shl63 = shl i64 %conv62, 3
  %48 = load i32, ptr %n_bits, align 4
  %sub64 = sub nsw i32 %48, 1
  %conv65 = sext i32 %sub64 to i64
  %sub66 = sub nsw i64 %shl63, %conv65
  br label %cond.end67

cond.end67:                                       ; preds = %cond.false61, %cond.true56
  %cond68 = phi i64 [ %shl60, %cond.true56 ], [ %sub66, %cond.false61 ]
  store i64 %cond68, ptr %inbits, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end228, %if.end120, %cond.end67
  %49 = load i64, ptr %inbits, align 8
  %50 = load i64, ptr %posbits, align 8
  %cmp69 = icmp sgt i64 %49, %50
  br i1 %cmp69, label %while.body, label %while.end229

while.body:                                       ; preds = %while.cond
  %51 = load i64, ptr %free_ent, align 8
  %52 = load i64, ptr %maxcode, align 8
  %cmp71 = icmp sgt i64 %51, %52
  br i1 %cmp71, label %if.then73, label %if.end96

if.then73:                                        ; preds = %while.body
  %53 = load i64, ptr %posbits, align 8
  %sub74 = sub nsw i64 %53, 1
  %54 = load i32, ptr %n_bits, align 4
  %shl75 = shl i32 %54, 3
  %conv76 = sext i32 %shl75 to i64
  %55 = load i64, ptr %posbits, align 8
  %sub77 = sub nsw i64 %55, 1
  %56 = load i32, ptr %n_bits, align 4
  %shl78 = shl i32 %56, 3
  %conv79 = sext i32 %shl78 to i64
  %add80 = add nsw i64 %sub77, %conv79
  %57 = load i32, ptr %n_bits, align 4
  %shl81 = shl i32 %57, 3
  %conv82 = sext i32 %shl81 to i64
  %rem83 = srem i64 %add80, %conv82
  %sub84 = sub nsw i64 %conv76, %rem83
  %add85 = add nsw i64 %sub74, %sub84
  store i64 %add85, ptr %posbits, align 8
  %58 = load i32, ptr %n_bits, align 4
  %inc86 = add nsw i32 %58, 1
  store i32 %inc86, ptr %n_bits, align 4
  %59 = load i32, ptr %n_bits, align 4
  %60 = load i32, ptr @maxbits, align 4
  %cmp87 = icmp eq i32 %59, %60
  br i1 %cmp87, label %if.then89, label %if.else

if.then89:                                        ; preds = %if.then73
  %61 = load i64, ptr %maxmaxcode, align 8
  store i64 %61, ptr %maxcode, align 8
  br label %if.end93

if.else:                                          ; preds = %if.then73
  %62 = load i32, ptr %n_bits, align 4
  %sh_prom90 = zext i32 %62 to i64
  %shl91 = shl i64 1, %sh_prom90
  %sub92 = sub nsw i64 %shl91, 1
  store i64 %sub92, ptr %maxcode, align 8
  br label %if.end93

if.end93:                                         ; preds = %if.else, %if.then89
  %63 = load i32, ptr %n_bits, align 4
  %shl94 = shl i32 1, %63
  %sub95 = sub nsw i32 %shl94, 1
  store i32 %sub95, ptr %bitmask, align 4
  br label %resetbuf

if.end96:                                         ; preds = %while.body
  %64 = load i64, ptr %posbits, align 8
  %shr97 = ashr i64 %64, 3
  %arrayidx98 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %shr97
  store ptr %arrayidx98, ptr %p, align 8
  %65 = load ptr, ptr %p, align 8
  %arrayidx99 = getelementptr inbounds i8, ptr %65, i64 0
  %66 = load i8, ptr %arrayidx99, align 1
  %conv100 = zext i8 %66 to i64
  %67 = load ptr, ptr %p, align 8
  %arrayidx101 = getelementptr inbounds i8, ptr %67, i64 1
  %68 = load i8, ptr %arrayidx101, align 1
  %conv102 = zext i8 %68 to i64
  %shl103 = shl i64 %conv102, 8
  %or = or i64 %conv100, %shl103
  %69 = load ptr, ptr %p, align 8
  %arrayidx104 = getelementptr inbounds i8, ptr %69, i64 2
  %70 = load i8, ptr %arrayidx104, align 1
  %conv105 = zext i8 %70 to i64
  %shl106 = shl i64 %conv105, 16
  %or107 = or i64 %or, %shl106
  %71 = load i64, ptr %posbits, align 8
  %and108 = and i64 %71, 7
  %shr109 = ashr i64 %or107, %and108
  %72 = load i32, ptr %bitmask, align 4
  %conv110 = zext i32 %72 to i64
  %and111 = and i64 %shr109, %conv110
  store i64 %and111, ptr %code, align 8
  %73 = load i32, ptr %n_bits, align 4
  %conv112 = sext i32 %73 to i64
  %74 = load i64, ptr %posbits, align 8
  %add113 = add nsw i64 %74, %conv112
  store i64 %add113, ptr %posbits, align 8
  %75 = load i64, ptr %oldcode, align 8
  %cmp114 = icmp eq i64 %75, -1
  br i1 %cmp114, label %if.then116, label %if.end126

if.then116:                                       ; preds = %if.end96
  %76 = load i64, ptr %code, align 8
  %cmp117 = icmp sge i64 %76, 256
  br i1 %cmp117, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.then116
  call void @error(ptr noundef @.str.2.238)
  br label %if.end120

if.end120:                                        ; preds = %if.then119, %if.then116
  %77 = load i64, ptr %code, align 8
  store i64 %77, ptr %oldcode, align 8
  %conv121 = trunc i64 %77 to i32
  store i32 %conv121, ptr %finchar, align 4
  %conv122 = trunc i32 %conv121 to i8
  %78 = load i32, ptr %outpos, align 4
  %inc123 = add nsw i32 %78, 1
  store i32 %inc123, ptr %outpos, align 4
  %idxprom124 = sext i32 %78 to i64
  %arrayidx125 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom124
  store i8 %conv122, ptr %arrayidx125, align 1
  br label %while.cond, !llvm.loop !140

if.end126:                                        ; preds = %if.end96
  %79 = load i64, ptr %code, align 8
  %cmp127 = icmp eq i64 %79, 256
  br i1 %cmp127, label %land.lhs.true, label %if.end145

land.lhs.true:                                    ; preds = %if.end126
  %80 = load i32, ptr @block_mode, align 4
  %tobool129 = icmp ne i32 %80, 0
  br i1 %tobool129, label %if.then130, label %if.end145

if.then130:                                       ; preds = %land.lhs.true
  call void @llvm.memset.p0.i64(ptr align 2 @prev, i8 0, i64 256, i1 false)
  store i64 256, ptr %free_ent, align 8
  %81 = load i64, ptr %posbits, align 8
  %sub131 = sub nsw i64 %81, 1
  %82 = load i32, ptr %n_bits, align 4
  %shl132 = shl i32 %82, 3
  %conv133 = sext i32 %shl132 to i64
  %83 = load i64, ptr %posbits, align 8
  %sub134 = sub nsw i64 %83, 1
  %84 = load i32, ptr %n_bits, align 4
  %shl135 = shl i32 %84, 3
  %conv136 = sext i32 %shl135 to i64
  %add137 = add nsw i64 %sub134, %conv136
  %85 = load i32, ptr %n_bits, align 4
  %shl138 = shl i32 %85, 3
  %conv139 = sext i32 %shl138 to i64
  %rem140 = srem i64 %add137, %conv139
  %sub141 = sub nsw i64 %conv133, %rem140
  %add142 = add nsw i64 %sub131, %sub141
  store i64 %add142, ptr %posbits, align 8
  store i32 9, ptr %n_bits, align 4
  store i64 511, ptr %maxcode, align 8
  %86 = load i32, ptr %n_bits, align 4
  %shl143 = shl i32 1, %86
  %sub144 = sub nsw i32 %shl143, 1
  store i32 %sub144, ptr %bitmask, align 4
  br label %resetbuf

if.end145:                                        ; preds = %land.lhs.true, %if.end126
  %87 = load i64, ptr %code, align 8
  store i64 %87, ptr %incode, align 8
  store ptr getelementptr inbounds ([0 x i16], ptr @d_buf, i64 0, i64 32767), ptr %stackp, align 8
  %88 = load i64, ptr %code, align 8
  %89 = load i64, ptr %free_ent, align 8
  %cmp146 = icmp sge i64 %88, %89
  br i1 %cmp146, label %if.then148, label %if.end164

if.then148:                                       ; preds = %if.end145
  %90 = load i64, ptr %code, align 8
  %91 = load i64, ptr %free_ent, align 8
  %cmp149 = icmp sgt i64 %90, %91
  br i1 %cmp149, label %if.then151, label %if.end162

if.then151:                                       ; preds = %if.then148
  %92 = load i32, ptr @test, align 4
  %tobool152 = icmp ne i32 %92, 0
  br i1 %tobool152, label %if.end159, label %land.lhs.true153

land.lhs.true153:                                 ; preds = %if.then151
  %93 = load i32, ptr %outpos, align 4
  %cmp154 = icmp sgt i32 %93, 0
  br i1 %cmp154, label %if.then156, label %if.end159

if.then156:                                       ; preds = %land.lhs.true153
  %94 = load i32, ptr %out.addr, align 4
  %95 = load i32, ptr %outpos, align 4
  call void @write_buf(i32 noundef %94, ptr noundef @outbuf, i32 noundef %95)
  %96 = load i32, ptr %outpos, align 4
  %conv157 = sext i32 %96 to i64
  %97 = load i64, ptr @bytes_out, align 8
  %add158 = add i64 %97, %conv157
  store i64 %add158, ptr @bytes_out, align 8
  br label %if.end159

if.end159:                                        ; preds = %if.then156, %land.lhs.true153, %if.then151
  %98 = load i32, ptr @to_stdout, align 4
  %tobool160 = icmp ne i32 %98, 0
  %99 = zext i1 %tobool160 to i64
  %cond161 = select i1 %tobool160, ptr @.str.2.238, ptr @.str.3.239
  call void @error(ptr noundef %cond161)
  br label %if.end162

if.end162:                                        ; preds = %if.end159, %if.then148
  %100 = load i32, ptr %finchar, align 4
  %conv163 = trunc i32 %100 to i8
  %101 = load ptr, ptr %stackp, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %101, i32 -1
  store ptr %incdec.ptr, ptr %stackp, align 8
  store i8 %conv163, ptr %incdec.ptr, align 1
  %102 = load i64, ptr %oldcode, align 8
  store i64 %102, ptr %code, align 8
  br label %if.end164

if.end164:                                        ; preds = %if.end162, %if.end145
  br label %while.cond165

while.cond165:                                    ; preds = %while.body168, %if.end164
  %103 = load i64, ptr %code, align 8
  %cmp166 = icmp uge i64 %103, 256
  br i1 %cmp166, label %while.body168, label %while.end

while.body168:                                    ; preds = %while.cond165
  %104 = load i64, ptr %code, align 8
  %arrayidx169 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %104
  %105 = load i8, ptr %arrayidx169, align 1
  %106 = load ptr, ptr %stackp, align 8
  %incdec.ptr170 = getelementptr inbounds i8, ptr %106, i32 -1
  store ptr %incdec.ptr170, ptr %stackp, align 8
  store i8 %105, ptr %incdec.ptr170, align 1
  %107 = load i64, ptr %code, align 8
  %arrayidx171 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %107
  %108 = load i16, ptr %arrayidx171, align 2
  %conv172 = zext i16 %108 to i64
  store i64 %conv172, ptr %code, align 8
  br label %while.cond165, !llvm.loop !141

while.end:                                        ; preds = %while.cond165
  %109 = load i64, ptr %code, align 8
  %arrayidx173 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %109
  %110 = load i8, ptr %arrayidx173, align 1
  %conv174 = zext i8 %110 to i32
  store i32 %conv174, ptr %finchar, align 4
  %conv175 = trunc i32 %conv174 to i8
  %111 = load ptr, ptr %stackp, align 8
  %incdec.ptr176 = getelementptr inbounds i8, ptr %111, i32 -1
  store ptr %incdec.ptr176, ptr %stackp, align 8
  store i8 %conv175, ptr %incdec.ptr176, align 1
  %112 = load i32, ptr %outpos, align 4
  %113 = load ptr, ptr %stackp, align 8
  %sub.ptr.rhs.cast = ptrtoint ptr %113 to i64
  %sub.ptr.sub = sub i64 ptrtoint (ptr getelementptr inbounds ([0 x i16], ptr @d_buf, i64 0, i64 32767) to i64), %sub.ptr.rhs.cast
  %conv178 = trunc i64 %sub.ptr.sub to i32
  store i32 %conv178, ptr %i177, align 4
  %add179 = add nsw i32 %112, %conv178
  %cmp180 = icmp sge i32 %add179, 16384
  br i1 %cmp180, label %if.then182, label %if.else214

if.then182:                                       ; preds = %while.end
  br label %do.body183

do.body183:                                       ; preds = %do.cond, %if.then182
  %114 = load i32, ptr %i177, align 4
  %115 = load i32, ptr %outpos, align 4
  %sub184 = sub nsw i32 16384, %115
  %cmp185 = icmp sgt i32 %114, %sub184
  br i1 %cmp185, label %if.then187, label %if.end189

if.then187:                                       ; preds = %do.body183
  %116 = load i32, ptr %outpos, align 4
  %sub188 = sub nsw i32 16384, %116
  store i32 %sub188, ptr %i177, align 4
  br label %if.end189

if.end189:                                        ; preds = %if.then187, %do.body183
  %117 = load i32, ptr %i177, align 4
  %cmp190 = icmp sgt i32 %117, 0
  br i1 %cmp190, label %if.then192, label %if.end197

if.then192:                                       ; preds = %if.end189
  %118 = load i32, ptr %outpos, align 4
  %idx.ext193 = sext i32 %118 to i64
  %add.ptr194 = getelementptr inbounds i8, ptr @outbuf, i64 %idx.ext193
  %119 = load ptr, ptr %stackp, align 8
  %120 = load i32, ptr %i177, align 4
  %conv195 = sext i32 %120 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %add.ptr194, ptr align 1 %119, i64 %conv195, i1 false)
  %121 = load i32, ptr %i177, align 4
  %122 = load i32, ptr %outpos, align 4
  %add196 = add nsw i32 %122, %121
  store i32 %add196, ptr %outpos, align 4
  br label %if.end197

if.end197:                                        ; preds = %if.then192, %if.end189
  %123 = load i32, ptr %outpos, align 4
  %cmp198 = icmp sge i32 %123, 16384
  br i1 %cmp198, label %if.then200, label %if.end206

if.then200:                                       ; preds = %if.end197
  %124 = load i32, ptr @test, align 4
  %tobool201 = icmp ne i32 %124, 0
  br i1 %tobool201, label %if.end205, label %if.then202

if.then202:                                       ; preds = %if.then200
  %125 = load i32, ptr %out.addr, align 4
  %126 = load i32, ptr %outpos, align 4
  call void @write_buf(i32 noundef %125, ptr noundef @outbuf, i32 noundef %126)
  %127 = load i32, ptr %outpos, align 4
  %conv203 = sext i32 %127 to i64
  %128 = load i64, ptr @bytes_out, align 8
  %add204 = add i64 %128, %conv203
  store i64 %add204, ptr @bytes_out, align 8
  br label %if.end205

if.end205:                                        ; preds = %if.then202, %if.then200
  store i32 0, ptr %outpos, align 4
  br label %if.end206

if.end206:                                        ; preds = %if.end205, %if.end197
  %129 = load i32, ptr %i177, align 4
  %130 = load ptr, ptr %stackp, align 8
  %idx.ext207 = sext i32 %129 to i64
  %add.ptr208 = getelementptr inbounds i8, ptr %130, i64 %idx.ext207
  store ptr %add.ptr208, ptr %stackp, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end206
  %131 = load ptr, ptr %stackp, align 8
  %sub.ptr.rhs.cast209 = ptrtoint ptr %131 to i64
  %sub.ptr.sub210 = sub i64 ptrtoint (ptr getelementptr inbounds ([0 x i16], ptr @d_buf, i64 0, i64 32767) to i64), %sub.ptr.rhs.cast209
  %conv211 = trunc i64 %sub.ptr.sub210 to i32
  store i32 %conv211, ptr %i177, align 4
  %cmp212 = icmp sgt i32 %conv211, 0
  br i1 %cmp212, label %do.body183, label %do.end, !llvm.loop !142

do.end:                                           ; preds = %do.cond
  br label %if.end219

if.else214:                                       ; preds = %while.end
  %132 = load i32, ptr %outpos, align 4
  %idx.ext215 = sext i32 %132 to i64
  %add.ptr216 = getelementptr inbounds i8, ptr @outbuf, i64 %idx.ext215
  %133 = load ptr, ptr %stackp, align 8
  %134 = load i32, ptr %i177, align 4
  %conv217 = sext i32 %134 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %add.ptr216, ptr align 1 %133, i64 %conv217, i1 false)
  %135 = load i32, ptr %i177, align 4
  %136 = load i32, ptr %outpos, align 4
  %add218 = add nsw i32 %136, %135
  store i32 %add218, ptr %outpos, align 4
  br label %if.end219

if.end219:                                        ; preds = %if.else214, %do.end
  %137 = load i64, ptr %free_ent, align 8
  store i64 %137, ptr %code, align 8
  %138 = load i64, ptr %maxmaxcode, align 8
  %cmp220 = icmp slt i64 %137, %138
  br i1 %cmp220, label %if.then222, label %if.end228

if.then222:                                       ; preds = %if.end219
  %139 = load i64, ptr %oldcode, align 8
  %conv223 = trunc i64 %139 to i16
  %140 = load i64, ptr %code, align 8
  %arrayidx224 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %140
  store i16 %conv223, ptr %arrayidx224, align 2
  %141 = load i32, ptr %finchar, align 4
  %conv225 = trunc i32 %141 to i8
  %142 = load i64, ptr %code, align 8
  %arrayidx226 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %142
  store i8 %conv225, ptr %arrayidx226, align 1
  %143 = load i64, ptr %code, align 8
  %add227 = add nsw i64 %143, 1
  store i64 %add227, ptr %free_ent, align 8
  br label %if.end228

if.end228:                                        ; preds = %if.then222, %if.end219
  %144 = load i64, ptr %incode, align 8
  store i64 %144, ptr %oldcode, align 8
  br label %while.cond, !llvm.loop !140

while.end229:                                     ; preds = %while.cond
  br label %do.cond230

do.cond230:                                       ; preds = %while.end229
  %145 = load i32, ptr %rsize, align 4
  %cmp231 = icmp ne i32 %145, 0
  br i1 %cmp231, label %do.body, label %do.end233, !llvm.loop !143

do.end233:                                        ; preds = %do.cond230
  %146 = load i32, ptr @test, align 4
  %tobool234 = icmp ne i32 %146, 0
  br i1 %tobool234, label %if.end241, label %land.lhs.true235

land.lhs.true235:                                 ; preds = %do.end233
  %147 = load i32, ptr %outpos, align 4
  %cmp236 = icmp sgt i32 %147, 0
  br i1 %cmp236, label %if.then238, label %if.end241

if.then238:                                       ; preds = %land.lhs.true235
  %148 = load i32, ptr %out.addr, align 4
  %149 = load i32, ptr %outpos, align 4
  call void @write_buf(i32 noundef %148, ptr noundef @outbuf, i32 noundef %149)
  %150 = load i32, ptr %outpos, align 4
  %conv239 = sext i32 %150 to i64
  %151 = load i64, ptr @bytes_out, align 8
  %add240 = add i64 %151, %conv239
  store i64 %add240, ptr @bytes_out, align 8
  br label %if.end241

if.end241:                                        ; preds = %if.then238, %land.lhs.true235, %do.end233
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end241, %if.then15
  %152 = load i32, ptr %retval, align 4
  ret i32 %152
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @unpack(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %eob = alloca i32, align 4
  %peek = alloca i32, align 4
  %peek_mask = alloca i32, align 4
  %mask = alloca i64, align 8
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  %0 = load i32, ptr %in.addr, align 4
  store i32 %0, ptr @ifd, align 4
  %1 = load i32, ptr %out.addr, align 4
  store i32 %1, ptr @ofd, align 4
  call void @read_tree()
  call void @build_tree.242()
  store i32 0, ptr @valid, align 4
  store i64 0, ptr @bitbuf, align 8
  %2 = load i32, ptr @peek_bits, align 4
  %shl = shl i32 1, %2
  %sub = sub nsw i32 %shl, 1
  store i32 %sub, ptr %peek_mask, align 4
  %3 = load i32, ptr @max_len, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %sub1 = sub nsw i32 %4, 1
  store i32 %sub1, ptr %eob, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end67, %entry
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %for.cond
  %5 = load i32, ptr @valid, align 4
  %6 = load i32, ptr @peek_bits, align 4
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i64, ptr @bitbuf, align 8
  %shl2 = shl i64 %7, 8
  %8 = load i32, ptr @inptr, align 4
  %9 = load i32, ptr @insize, align 4
  %cmp3 = icmp ult i32 %8, %9
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %10 = load i32, ptr @inptr, align 4
  %inc = add i32 %10, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom4 = zext i32 %10 to i64
  %arrayidx5 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom4
  %11 = load i8, ptr %arrayidx5, align 1
  %conv = zext i8 %11 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %conv6 = sext i32 %cond to i64
  %or = or i64 %shl2, %conv6
  store i64 %or, ptr @bitbuf, align 8
  %12 = load i32, ptr @valid, align 4
  %add = add nsw i32 %12, 8
  store i32 %add, ptr @valid, align 4
  br label %while.cond, !llvm.loop !144

while.end:                                        ; preds = %while.cond
  %13 = load i64, ptr @bitbuf, align 8
  %14 = load i32, ptr @valid, align 4
  %15 = load i32, ptr @peek_bits, align 4
  %sub7 = sub nsw i32 %14, %15
  %sh_prom = zext i32 %sub7 to i64
  %shr = lshr i64 %13, %sh_prom
  %16 = load i32, ptr %peek_mask, align 4
  %conv8 = zext i32 %16 to i64
  %and = and i64 %shr, %conv8
  %conv9 = trunc i64 %and to i32
  store i32 %conv9, ptr %peek, align 4
  %17 = load i32, ptr %peek, align 4
  %idxprom10 = zext i32 %17 to i64
  %arrayidx11 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom10
  %18 = load i8, ptr %arrayidx11, align 1
  %conv12 = zext i8 %18 to i32
  store i32 %conv12, ptr %len, align 4
  %19 = load i32, ptr %len, align 4
  %cmp13 = icmp sgt i32 %19, 0
  br i1 %cmp13, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %20 = load i32, ptr @peek_bits, align 4
  %21 = load i32, ptr %len, align 4
  %sub15 = sub nsw i32 %20, %21
  %22 = load i32, ptr %peek, align 4
  %shr16 = lshr i32 %22, %sub15
  store i32 %shr16, ptr %peek, align 4
  br label %if.end

if.else:                                          ; preds = %while.end
  %23 = load i32, ptr %peek_mask, align 4
  %conv17 = zext i32 %23 to i64
  store i64 %conv17, ptr %mask, align 8
  %24 = load i32, ptr @peek_bits, align 4
  store i32 %24, ptr %len, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.else
  %25 = load i32, ptr %len, align 4
  %inc18 = add nsw i32 %25, 1
  store i32 %inc18, ptr %len, align 4
  %26 = load i64, ptr %mask, align 8
  %shl19 = shl i64 %26, 1
  %add20 = add i64 %shl19, 1
  store i64 %add20, ptr %mask, align 8
  br label %while.cond21

while.cond21:                                     ; preds = %cond.end35, %do.body
  %27 = load i32, ptr @valid, align 4
  %28 = load i32, ptr %len, align 4
  %cmp22 = icmp slt i32 %27, %28
  br i1 %cmp22, label %while.body24, label %while.end40

while.body24:                                     ; preds = %while.cond21
  %29 = load i64, ptr @bitbuf, align 8
  %shl25 = shl i64 %29, 8
  %30 = load i32, ptr @inptr, align 4
  %31 = load i32, ptr @insize, align 4
  %cmp26 = icmp ult i32 %30, %31
  br i1 %cmp26, label %cond.true28, label %cond.false33

cond.true28:                                      ; preds = %while.body24
  %32 = load i32, ptr @inptr, align 4
  %inc29 = add i32 %32, 1
  store i32 %inc29, ptr @inptr, align 4
  %idxprom30 = zext i32 %32 to i64
  %arrayidx31 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom30
  %33 = load i8, ptr %arrayidx31, align 1
  %conv32 = zext i8 %33 to i32
  br label %cond.end35

cond.false33:                                     ; preds = %while.body24
  %call34 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false33, %cond.true28
  %cond36 = phi i32 [ %conv32, %cond.true28 ], [ %call34, %cond.false33 ]
  %conv37 = sext i32 %cond36 to i64
  %or38 = or i64 %shl25, %conv37
  store i64 %or38, ptr @bitbuf, align 8
  %34 = load i32, ptr @valid, align 4
  %add39 = add nsw i32 %34, 8
  store i32 %add39, ptr @valid, align 4
  br label %while.cond21, !llvm.loop !145

while.end40:                                      ; preds = %while.cond21
  %35 = load i64, ptr @bitbuf, align 8
  %36 = load i32, ptr @valid, align 4
  %37 = load i32, ptr %len, align 4
  %sub41 = sub nsw i32 %36, %37
  %sh_prom42 = zext i32 %sub41 to i64
  %shr43 = lshr i64 %35, %sh_prom42
  %38 = load i64, ptr %mask, align 8
  %and44 = and i64 %shr43, %38
  %conv45 = trunc i64 %and44 to i32
  store i32 %conv45, ptr %peek, align 4
  br label %do.cond

do.cond:                                          ; preds = %while.end40
  %39 = load i32, ptr %peek, align 4
  %40 = load i32, ptr %len, align 4
  %idxprom46 = sext i32 %40 to i64
  %arrayidx47 = getelementptr inbounds [26 x i32], ptr @parents, i64 0, i64 %idxprom46
  %41 = load i32, ptr %arrayidx47, align 4
  %cmp48 = icmp ult i32 %39, %41
  br i1 %cmp48, label %do.body, label %do.end, !llvm.loop !146

do.end:                                           ; preds = %do.cond
  br label %if.end

if.end:                                           ; preds = %do.end, %if.then
  %42 = load i32, ptr %peek, align 4
  %43 = load i32, ptr %eob, align 4
  %cmp50 = icmp eq i32 %42, %43
  br i1 %cmp50, label %land.lhs.true, label %if.end55

land.lhs.true:                                    ; preds = %if.end
  %44 = load i32, ptr %len, align 4
  %45 = load i32, ptr @max_len, align 4
  %cmp52 = icmp eq i32 %44, %45
  br i1 %cmp52, label %if.then54, label %if.end55

if.then54:                                        ; preds = %land.lhs.true
  br label %for.end

if.end55:                                         ; preds = %land.lhs.true, %if.end
  %46 = load i32, ptr %peek, align 4
  %47 = load i32, ptr %len, align 4
  %idxprom56 = sext i32 %47 to i64
  %arrayidx57 = getelementptr inbounds [26 x i32], ptr @lit_base, i64 0, i64 %idxprom56
  %48 = load i32, ptr %arrayidx57, align 4
  %add58 = add i32 %46, %48
  %idxprom59 = zext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds [256 x i8], ptr @literal, i64 0, i64 %idxprom59
  %49 = load i8, ptr %arrayidx60, align 1
  %50 = load i32, ptr @outcnt, align 4
  %inc61 = add i32 %50, 1
  store i32 %inc61, ptr @outcnt, align 4
  %idxprom62 = zext i32 %50 to i64
  %arrayidx63 = getelementptr inbounds [0 x i8], ptr @window, i64 0, i64 %idxprom62
  store i8 %49, ptr %arrayidx63, align 1
  %51 = load i32, ptr @outcnt, align 4
  %cmp64 = icmp eq i32 %51, 32768
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end55
  call void @flush_window()
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %if.end55
  %52 = load i32, ptr %len, align 4
  %53 = load i32, ptr @valid, align 4
  %sub68 = sub nsw i32 %53, %52
  store i32 %sub68, ptr @valid, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then54
  call void @flush_window()
  %54 = load i64, ptr @orig_len, align 8
  %55 = load i64, ptr @bytes_out, align 8
  %cmp69 = icmp ne i64 %54, %55
  br i1 %cmp69, label %if.then71, label %if.end72

if.then71:                                        ; preds = %for.end
  call void @error(ptr noundef @.str.243)
  br label %if.end72

if.end72:                                         ; preds = %if.then71, %for.end
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_tree() #0 {
entry:
  %len = alloca i32, align 4
  %base = alloca i32, align 4
  %n = alloca i32, align 4
  store i64 0, ptr @orig_len, align 8
  store i32 1, ptr %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %n, align 4
  %cmp = icmp sle i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr @orig_len, align 8
  %shl = shl i64 %1, 8
  %2 = load i32, ptr @inptr, align 4
  %3 = load i32, ptr @insize, align 4
  %cmp1 = icmp ult i32 %2, %3
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %4 = load i32, ptr @inptr, align 4
  %inc = add i32 %4, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %4 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %5 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %5 to i32
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %call = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %conv2 = sext i32 %cond to i64
  %or = or i64 %shl, %conv2
  store i64 %or, ptr @orig_len, align 8
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %6 = load i32, ptr %n, align 4
  %inc3 = add nsw i32 %6, 1
  store i32 %inc3, ptr %n, align 4
  br label %for.cond, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %7 = load i32, ptr @inptr, align 4
  %8 = load i32, ptr @insize, align 4
  %cmp4 = icmp ult i32 %7, %8
  br i1 %cmp4, label %cond.true6, label %cond.false11

cond.true6:                                       ; preds = %for.end
  %9 = load i32, ptr @inptr, align 4
  %inc7 = add i32 %9, 1
  store i32 %inc7, ptr @inptr, align 4
  %idxprom8 = zext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom8
  %10 = load i8, ptr %arrayidx9, align 1
  %conv10 = zext i8 %10 to i32
  br label %cond.end13

cond.false11:                                     ; preds = %for.end
  %call12 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false11, %cond.true6
  %cond14 = phi i32 [ %conv10, %cond.true6 ], [ %call12, %cond.false11 ]
  store i32 %cond14, ptr @max_len, align 4
  %11 = load i32, ptr @max_len, align 4
  %cmp15 = icmp sgt i32 %11, 25
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end13
  call void @error(ptr noundef @.str.1.244)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end13
  store i32 0, ptr %n, align 4
  store i32 1, ptr %len, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc36, %if.end
  %12 = load i32, ptr %len, align 4
  %13 = load i32, ptr @max_len, align 4
  %cmp18 = icmp sle i32 %12, %13
  br i1 %cmp18, label %for.body20, label %for.end38

for.body20:                                       ; preds = %for.cond17
  %14 = load i32, ptr @inptr, align 4
  %15 = load i32, ptr @insize, align 4
  %cmp21 = icmp ult i32 %14, %15
  br i1 %cmp21, label %cond.true23, label %cond.false28

cond.true23:                                      ; preds = %for.body20
  %16 = load i32, ptr @inptr, align 4
  %inc24 = add i32 %16, 1
  store i32 %inc24, ptr @inptr, align 4
  %idxprom25 = zext i32 %16 to i64
  %arrayidx26 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom25
  %17 = load i8, ptr %arrayidx26, align 1
  %conv27 = zext i8 %17 to i32
  br label %cond.end30

cond.false28:                                     ; preds = %for.body20
  %call29 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false28, %cond.true23
  %cond31 = phi i32 [ %conv27, %cond.true23 ], [ %call29, %cond.false28 ]
  %18 = load i32, ptr %len, align 4
  %idxprom32 = sext i32 %18 to i64
  %arrayidx33 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom32
  store i32 %cond31, ptr %arrayidx33, align 4
  %19 = load i32, ptr %len, align 4
  %idxprom34 = sext i32 %19 to i64
  %arrayidx35 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom34
  %20 = load i32, ptr %arrayidx35, align 4
  %21 = load i32, ptr %n, align 4
  %add = add nsw i32 %21, %20
  store i32 %add, ptr %n, align 4
  br label %for.inc36

for.inc36:                                        ; preds = %cond.end30
  %22 = load i32, ptr %len, align 4
  %inc37 = add nsw i32 %22, 1
  store i32 %inc37, ptr %len, align 4
  br label %for.cond17, !llvm.loop !148

for.end38:                                        ; preds = %for.cond17
  %23 = load i32, ptr %n, align 4
  %cmp39 = icmp sgt i32 %23, 256
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %for.end38
  call void @error(ptr noundef @.str.2.245)
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %for.end38
  %24 = load i32, ptr @max_len, align 4
  %idxprom43 = sext i32 %24 to i64
  %arrayidx44 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom43
  %25 = load i32, ptr %arrayidx44, align 4
  %inc45 = add nsw i32 %25, 1
  store i32 %inc45, ptr %arrayidx44, align 4
  store i32 0, ptr %base, align 4
  store i32 1, ptr %len, align 4
  br label %for.cond46

for.cond46:                                       ; preds = %for.inc75, %if.end42
  %26 = load i32, ptr %len, align 4
  %27 = load i32, ptr @max_len, align 4
  %cmp47 = icmp sle i32 %26, %27
  br i1 %cmp47, label %for.body49, label %for.end77

for.body49:                                       ; preds = %for.cond46
  %28 = load i32, ptr %base, align 4
  %29 = load i32, ptr %len, align 4
  %idxprom50 = sext i32 %29 to i64
  %arrayidx51 = getelementptr inbounds [26 x i32], ptr @lit_base, i64 0, i64 %idxprom50
  store i32 %28, ptr %arrayidx51, align 4
  %30 = load i32, ptr %len, align 4
  %idxprom52 = sext i32 %30 to i64
  %arrayidx53 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom52
  %31 = load i32, ptr %arrayidx53, align 4
  store i32 %31, ptr %n, align 4
  br label %for.cond54

for.cond54:                                       ; preds = %for.inc73, %for.body49
  %32 = load i32, ptr %n, align 4
  %cmp55 = icmp sgt i32 %32, 0
  br i1 %cmp55, label %for.body57, label %for.end74

for.body57:                                       ; preds = %for.cond54
  %33 = load i32, ptr @inptr, align 4
  %34 = load i32, ptr @insize, align 4
  %cmp58 = icmp ult i32 %33, %34
  br i1 %cmp58, label %cond.true60, label %cond.false65

cond.true60:                                      ; preds = %for.body57
  %35 = load i32, ptr @inptr, align 4
  %inc61 = add i32 %35, 1
  store i32 %inc61, ptr @inptr, align 4
  %idxprom62 = zext i32 %35 to i64
  %arrayidx63 = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom62
  %36 = load i8, ptr %arrayidx63, align 1
  %conv64 = zext i8 %36 to i32
  br label %cond.end67

cond.false65:                                     ; preds = %for.body57
  %call66 = call i32 @fill_inbuf(i32 noundef 0)
  br label %cond.end67

cond.end67:                                       ; preds = %cond.false65, %cond.true60
  %cond68 = phi i32 [ %conv64, %cond.true60 ], [ %call66, %cond.false65 ]
  %conv69 = trunc i32 %cond68 to i8
  %37 = load i32, ptr %base, align 4
  %inc70 = add nsw i32 %37, 1
  store i32 %inc70, ptr %base, align 4
  %idxprom71 = sext i32 %37 to i64
  %arrayidx72 = getelementptr inbounds [256 x i8], ptr @literal, i64 0, i64 %idxprom71
  store i8 %conv69, ptr %arrayidx72, align 1
  br label %for.inc73

for.inc73:                                        ; preds = %cond.end67
  %38 = load i32, ptr %n, align 4
  %dec = add nsw i32 %38, -1
  store i32 %dec, ptr %n, align 4
  br label %for.cond54, !llvm.loop !149

for.end74:                                        ; preds = %for.cond54
  br label %for.inc75

for.inc75:                                        ; preds = %for.end74
  %39 = load i32, ptr %len, align 4
  %inc76 = add nsw i32 %39, 1
  store i32 %inc76, ptr %len, align 4
  br label %for.cond46, !llvm.loop !150

for.end77:                                        ; preds = %for.cond46
  %40 = load i32, ptr @max_len, align 4
  %idxprom78 = sext i32 %40 to i64
  %arrayidx79 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom78
  %41 = load i32, ptr %arrayidx79, align 4
  %inc80 = add nsw i32 %41, 1
  store i32 %inc80, ptr %arrayidx79, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @build_tree.242() #0 {
entry:
  %nodes = alloca i32, align 4
  %len = alloca i32, align 4
  %prefixp = alloca ptr, align 8
  %prefixes = alloca i32, align 4
  store i32 0, ptr %nodes, align 4
  %0 = load i32, ptr @max_len, align 4
  store i32 %0, ptr %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %len, align 4
  %cmp = icmp sge i32 %1, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %nodes, align 4
  %shr = ashr i32 %2, 1
  store i32 %shr, ptr %nodes, align 4
  %3 = load i32, ptr %nodes, align 4
  %4 = load i32, ptr %len, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [26 x i32], ptr @parents, i64 0, i64 %idxprom
  store i32 %3, ptr %arrayidx, align 4
  %5 = load i32, ptr %nodes, align 4
  %6 = load i32, ptr %len, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds [26 x i32], ptr @lit_base, i64 0, i64 %idxprom1
  %7 = load i32, ptr %arrayidx2, align 4
  %sub = sub nsw i32 %7, %5
  store i32 %sub, ptr %arrayidx2, align 4
  %8 = load i32, ptr %len, align 4
  %idxprom3 = sext i32 %8 to i64
  %arrayidx4 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom3
  %9 = load i32, ptr %arrayidx4, align 4
  %10 = load i32, ptr %nodes, align 4
  %add = add nsw i32 %10, %9
  store i32 %add, ptr %nodes, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, ptr %len, align 4
  %dec = add nsw i32 %11, -1
  store i32 %dec, ptr %len, align 4
  br label %for.cond, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr @max_len, align 4
  %cmp5 = icmp sle i32 %12, 12
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %13 = load i32, ptr @max_len, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ 12, %cond.false ]
  store i32 %cond, ptr @peek_bits, align 4
  %14 = load i32, ptr @peek_bits, align 4
  %shl = shl i32 1, %14
  %idxprom6 = sext i32 %shl to i64
  %arrayidx7 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom6
  store ptr %arrayidx7, ptr %prefixp, align 8
  store i32 1, ptr %len, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc16, %cond.end
  %15 = load i32, ptr %len, align 4
  %16 = load i32, ptr @peek_bits, align 4
  %cmp9 = icmp sle i32 %15, %16
  br i1 %cmp9, label %for.body10, label %for.end17

for.body10:                                       ; preds = %for.cond8
  %17 = load i32, ptr %len, align 4
  %idxprom11 = sext i32 %17 to i64
  %arrayidx12 = getelementptr inbounds [26 x i32], ptr @leaves, i64 0, i64 %idxprom11
  %18 = load i32, ptr %arrayidx12, align 4
  %19 = load i32, ptr @peek_bits, align 4
  %20 = load i32, ptr %len, align 4
  %sub13 = sub nsw i32 %19, %20
  %shl14 = shl i32 %18, %sub13
  store i32 %shl14, ptr %prefixes, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body10
  %21 = load i32, ptr %prefixes, align 4
  %dec15 = add nsw i32 %21, -1
  store i32 %dec15, ptr %prefixes, align 4
  %tobool = icmp ne i32 %21, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %22 = load i32, ptr %len, align 4
  %conv = trunc i32 %22 to i8
  %23 = load ptr, ptr %prefixp, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %23, i32 -1
  store ptr %incdec.ptr, ptr %prefixp, align 8
  store i8 %conv, ptr %incdec.ptr, align 1
  br label %while.cond, !llvm.loop !152

while.end:                                        ; preds = %while.cond
  br label %for.inc16

for.inc16:                                        ; preds = %while.end
  %24 = load i32, ptr %len, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, ptr %len, align 4
  br label %for.cond8, !llvm.loop !153

for.end17:                                        ; preds = %for.cond8
  br label %while.cond18

while.cond18:                                     ; preds = %while.body21, %for.end17
  %25 = load ptr, ptr %prefixp, align 8
  %cmp19 = icmp ugt ptr %25, @outbuf
  br i1 %cmp19, label %while.body21, label %while.end23

while.body21:                                     ; preds = %while.cond18
  %26 = load ptr, ptr %prefixp, align 8
  %incdec.ptr22 = getelementptr inbounds i8, ptr %26, i32 -1
  store ptr %incdec.ptr22, ptr %prefixp, align 8
  store i8 0, ptr %incdec.ptr22, align 1
  br label %while.cond18, !llvm.loop !154

while.end23:                                      ; preds = %while.cond18
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @unlzh(i32 noundef %in, i32 noundef %out) #0 {
entry:
  %in.addr = alloca i32, align 4
  %out.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %in, ptr %in.addr, align 4
  store i32 %out, ptr %out.addr, align 4
  %0 = load i32, ptr %in.addr, align 4
  store i32 %0, ptr @ifd, align 4
  %1 = load i32, ptr %out.addr, align 4
  store i32 %1, ptr @ofd, align 4
  call void @decode_start()
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr @done, align 4
  %tobool = icmp ne i32 %2, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 @decode(i32 noundef 8192, ptr noundef @window)
  store i32 %call, ptr %n, align 4
  %3 = load i32, ptr @test, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %while.body
  %4 = load i32, ptr %n, align 4
  %cmp = icmp ugt i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, ptr %out.addr, align 4
  %6 = load i32, ptr %n, align 4
  call void @write_buf(i32 noundef %5, ptr noundef @window, i32 noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  br label %while.cond, !llvm.loop !155

while.end:                                        ; preds = %while.cond
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @decode_start() #0 {
entry:
  call void @huf_decode_start()
  store i32 0, ptr @j, align 4
  store i32 0, ptr @done, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @decode(i32 noundef %count, ptr noundef %buffer) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %buffer.addr = alloca ptr, align 8
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %count, ptr %count.addr, align 4
  store ptr %buffer, ptr %buffer.addr, align 8
  store i32 0, ptr %r, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, ptr @j, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, ptr @j, align 4
  %cmp = icmp sge i32 %dec, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load ptr, ptr %buffer.addr, align 8
  %2 = load i32, ptr @decode.i, align 4
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds i8, ptr %1, i64 %idxprom
  %3 = load i8, ptr %arrayidx, align 1
  %4 = load ptr, ptr %buffer.addr, align 8
  %5 = load i32, ptr %r, align 4
  %idxprom1 = zext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds i8, ptr %4, i64 %idxprom1
  store i8 %3, ptr %arrayidx2, align 1
  %6 = load i32, ptr @decode.i, align 4
  %add = add i32 %6, 1
  %and = and i32 %add, 8191
  store i32 %and, ptr @decode.i, align 4
  %7 = load i32, ptr %r, align 4
  %inc = add i32 %7, 1
  store i32 %inc, ptr %r, align 4
  %8 = load i32, ptr %count.addr, align 4
  %cmp3 = icmp eq i32 %inc, %8
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %9 = load i32, ptr %r, align 4
  store i32 %9, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  br label %while.cond, !llvm.loop !156

while.end:                                        ; preds = %while.cond
  br label %for.cond

for.cond:                                         ; preds = %if.end37, %while.end
  %call = call i32 @decode_c()
  store i32 %call, ptr %c, align 4
  %10 = load i32, ptr %c, align 4
  %cmp4 = icmp eq i32 %10, 510
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %for.cond
  store i32 1, ptr @done, align 4
  %11 = load i32, ptr %r, align 4
  store i32 %11, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %for.cond
  %12 = load i32, ptr %c, align 4
  %cmp7 = icmp ule i32 %12, 255
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end6
  %13 = load i32, ptr %c, align 4
  %conv = trunc i32 %13 to i8
  %14 = load ptr, ptr %buffer.addr, align 8
  %15 = load i32, ptr %r, align 4
  %idxprom9 = zext i32 %15 to i64
  %arrayidx10 = getelementptr inbounds i8, ptr %14, i64 %idxprom9
  store i8 %conv, ptr %arrayidx10, align 1
  %16 = load i32, ptr %r, align 4
  %inc11 = add i32 %16, 1
  store i32 %inc11, ptr %r, align 4
  %17 = load i32, ptr %count.addr, align 4
  %cmp12 = icmp eq i32 %inc11, %17
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then8
  %18 = load i32, ptr %r, align 4
  store i32 %18, ptr %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.then8
  br label %if.end37

if.else:                                          ; preds = %if.end6
  %19 = load i32, ptr %c, align 4
  %sub = sub i32 %19, 253
  store i32 %sub, ptr @j, align 4
  %20 = load i32, ptr %r, align 4
  %call16 = call i32 @decode_p()
  %sub17 = sub i32 %20, %call16
  %sub18 = sub i32 %sub17, 1
  %and19 = and i32 %sub18, 8191
  store i32 %and19, ptr @decode.i, align 4
  br label %while.cond20

while.cond20:                                     ; preds = %if.end35, %if.else
  %21 = load i32, ptr @j, align 4
  %dec21 = add nsw i32 %21, -1
  store i32 %dec21, ptr @j, align 4
  %cmp22 = icmp sge i32 %dec21, 0
  br i1 %cmp22, label %while.body24, label %while.end36

while.body24:                                     ; preds = %while.cond20
  %22 = load ptr, ptr %buffer.addr, align 8
  %23 = load i32, ptr @decode.i, align 4
  %idxprom25 = zext i32 %23 to i64
  %arrayidx26 = getelementptr inbounds i8, ptr %22, i64 %idxprom25
  %24 = load i8, ptr %arrayidx26, align 1
  %25 = load ptr, ptr %buffer.addr, align 8
  %26 = load i32, ptr %r, align 4
  %idxprom27 = zext i32 %26 to i64
  %arrayidx28 = getelementptr inbounds i8, ptr %25, i64 %idxprom27
  store i8 %24, ptr %arrayidx28, align 1
  %27 = load i32, ptr @decode.i, align 4
  %add29 = add i32 %27, 1
  %and30 = and i32 %add29, 8191
  store i32 %and30, ptr @decode.i, align 4
  %28 = load i32, ptr %r, align 4
  %inc31 = add i32 %28, 1
  store i32 %inc31, ptr %r, align 4
  %29 = load i32, ptr %count.addr, align 4
  %cmp32 = icmp eq i32 %inc31, %29
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %while.body24
  %30 = load i32, ptr %r, align 4
  store i32 %30, ptr %retval, align 4
  br label %return

if.end35:                                         ; preds = %while.body24
  br label %while.cond20, !llvm.loop !157

while.end36:                                      ; preds = %while.cond20
  br label %if.end37

if.end37:                                         ; preds = %while.end36, %if.end15
  br label %for.cond

return:                                           ; preds = %if.then34, %if.then14, %if.then5, %if.then
  %31 = load i32, ptr %retval, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @decode_c() #0 {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  %mask = alloca i32, align 4
  %0 = load i32, ptr @blocksize, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %call = call i32 @getbits(i32 noundef 16)
  store i32 %call, ptr @blocksize, align 4
  %1 = load i32, ptr @blocksize, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 510, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  call void @read_pt_len(i32 noundef 19, i32 noundef 5, i32 noundef 3)
  call void @read_c_len()
  call void @read_pt_len(i32 noundef 14, i32 noundef 4, i32 noundef -1)
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %2 = load i32, ptr @blocksize, align 4
  %dec = add i32 %2, -1
  store i32 %dec, ptr @blocksize, align 4
  %3 = load i16, ptr @bitbuf.248, align 2
  %conv = zext i16 %3 to i32
  %shr = ashr i32 %conv, 4
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [0 x i16], ptr @d_buf, i64 0, i64 %idxprom
  %4 = load i16, ptr %arrayidx, align 2
  %conv4 = zext i16 %4 to i32
  store i32 %conv4, ptr %j, align 4
  %5 = load i32, ptr %j, align 4
  %cmp5 = icmp uge i32 %5, 510
  br i1 %cmp5, label %if.then7, label %if.end20

if.then7:                                         ; preds = %if.end3
  store i32 8, ptr %mask, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then7
  %6 = load i16, ptr @bitbuf.248, align 2
  %conv8 = zext i16 %6 to i32
  %7 = load i32, ptr %mask, align 4
  %and = and i32 %conv8, %7
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then9, label %if.else

if.then9:                                         ; preds = %do.body
  %8 = load i32, ptr %j, align 4
  %idxprom10 = zext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom10
  %9 = load i16, ptr %arrayidx11, align 2
  %conv12 = zext i16 %9 to i32
  store i32 %conv12, ptr %j, align 4
  br label %if.end16

if.else:                                          ; preds = %do.body
  %10 = load i32, ptr %j, align 4
  %idxprom13 = zext i32 %10 to i64
  %arrayidx14 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom13
  %11 = load i16, ptr %arrayidx14, align 2
  %conv15 = zext i16 %11 to i32
  store i32 %conv15, ptr %j, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.else, %if.then9
  %12 = load i32, ptr %mask, align 4
  %shr17 = lshr i32 %12, 1
  store i32 %shr17, ptr %mask, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end16
  %13 = load i32, ptr %j, align 4
  %cmp18 = icmp uge i32 %13, 510
  br i1 %cmp18, label %do.body, label %do.end, !llvm.loop !158

do.end:                                           ; preds = %do.cond
  br label %if.end20

if.end20:                                         ; preds = %do.end, %if.end3
  %14 = load i32, ptr %j, align 4
  %idxprom21 = zext i32 %14 to i64
  %arrayidx22 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom21
  %15 = load i8, ptr %arrayidx22, align 1
  %conv23 = zext i8 %15 to i32
  call void @fillbuf(i32 noundef %conv23)
  %16 = load i32, ptr %j, align 4
  store i32 %16, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end20, %if.then2
  %17 = load i32, ptr %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @decode_p() #0 {
entry:
  %j = alloca i32, align 4
  %mask = alloca i32, align 4
  %0 = load i16, ptr @bitbuf.248, align 2
  %conv = zext i16 %0 to i32
  %shr = ashr i32 %conv, 8
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [256 x i16], ptr @pt_table, i64 0, i64 %idxprom
  %1 = load i16, ptr %arrayidx, align 2
  %conv1 = zext i16 %1 to i32
  store i32 %conv1, ptr %j, align 4
  %2 = load i32, ptr %j, align 4
  %cmp = icmp uge i32 %2, 14
  br i1 %cmp, label %if.then, label %if.end14

if.then:                                          ; preds = %entry
  store i32 128, ptr %mask, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %3 = load i16, ptr @bitbuf.248, align 2
  %conv3 = zext i16 %3 to i32
  %4 = load i32, ptr %mask, align 4
  %and = and i32 %conv3, %4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then4, label %if.else

if.then4:                                         ; preds = %do.body
  %5 = load i32, ptr %j, align 4
  %idxprom5 = zext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom5
  %6 = load i16, ptr %arrayidx6, align 2
  %conv7 = zext i16 %6 to i32
  store i32 %conv7, ptr %j, align 4
  br label %if.end

if.else:                                          ; preds = %do.body
  %7 = load i32, ptr %j, align 4
  %idxprom8 = zext i32 %7 to i64
  %arrayidx9 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom8
  %8 = load i16, ptr %arrayidx9, align 2
  %conv10 = zext i16 %8 to i32
  store i32 %conv10, ptr %j, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  %9 = load i32, ptr %mask, align 4
  %shr11 = lshr i32 %9, 1
  store i32 %shr11, ptr %mask, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %10 = load i32, ptr %j, align 4
  %cmp12 = icmp uge i32 %10, 14
  br i1 %cmp12, label %do.body, label %do.end, !llvm.loop !159

do.end:                                           ; preds = %do.cond
  br label %if.end14

if.end14:                                         ; preds = %do.end, %entry
  %11 = load i32, ptr %j, align 4
  %idxprom15 = zext i32 %11 to i64
  %arrayidx16 = getelementptr inbounds [19 x i8], ptr @pt_len, i64 0, i64 %idxprom15
  %12 = load i8, ptr %arrayidx16, align 1
  %conv17 = zext i8 %12 to i32
  call void @fillbuf(i32 noundef %conv17)
  %13 = load i32, ptr %j, align 4
  %cmp18 = icmp ne i32 %13, 0
  br i1 %cmp18, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end14
  %14 = load i32, ptr %j, align 4
  %sub = sub i32 %14, 1
  %shl = shl i32 1, %sub
  %15 = load i32, ptr %j, align 4
  %sub21 = sub i32 %15, 1
  %call = call i32 @getbits(i32 noundef %sub21)
  %add = add i32 %shl, %call
  store i32 %add, ptr %j, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end14
  %16 = load i32, ptr %j, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @fillbuf(i32 noundef %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load i32, ptr %n.addr, align 4
  %1 = load i16, ptr @bitbuf.248, align 2
  %conv = zext i16 %1 to i32
  %shl = shl i32 %conv, %0
  %conv1 = trunc i32 %shl to i16
  store i16 %conv1, ptr @bitbuf.248, align 2
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %2 = load i32, ptr %n.addr, align 4
  %3 = load i32, ptr @bitcount, align 4
  %cmp = icmp sgt i32 %2, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, ptr @subbitbuf, align 4
  %5 = load i32, ptr @bitcount, align 4
  %6 = load i32, ptr %n.addr, align 4
  %sub = sub nsw i32 %6, %5
  store i32 %sub, ptr %n.addr, align 4
  %shl3 = shl i32 %4, %sub
  %7 = load i16, ptr @bitbuf.248, align 2
  %conv4 = zext i16 %7 to i32
  %or = or i32 %conv4, %shl3
  %conv5 = trunc i32 %or to i16
  store i16 %conv5, ptr @bitbuf.248, align 2
  %8 = load i32, ptr @inptr, align 4
  %9 = load i32, ptr @insize, align 4
  %cmp6 = icmp ult i32 %8, %9
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %10 = load i32, ptr @inptr, align 4
  %inc = add i32 %10, 1
  store i32 %inc, ptr @inptr, align 4
  %idxprom = zext i32 %10 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @inbuf, i64 0, i64 %idxprom
  %11 = load i8, ptr %arrayidx, align 1
  %conv8 = zext i8 %11 to i32
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %call = call i32 @fill_inbuf(i32 noundef 1)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, ptr @subbitbuf, align 4
  %12 = load i32, ptr @subbitbuf, align 4
  %cmp9 = icmp eq i32 %12, -1
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 0, ptr @subbitbuf, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  store i32 8, ptr @bitcount, align 4
  br label %while.cond, !llvm.loop !160

while.end:                                        ; preds = %while.cond
  %13 = load i32, ptr @subbitbuf, align 4
  %14 = load i32, ptr %n.addr, align 4
  %15 = load i32, ptr @bitcount, align 4
  %sub11 = sub nsw i32 %15, %14
  store i32 %sub11, ptr @bitcount, align 4
  %shr = lshr i32 %13, %sub11
  %16 = load i16, ptr @bitbuf.248, align 2
  %conv12 = zext i16 %16 to i32
  %or13 = or i32 %conv12, %shr
  %conv14 = trunc i32 %or13 to i16
  store i16 %conv14, ptr @bitbuf.248, align 2
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @getbits(i32 noundef %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load i16, ptr @bitbuf.248, align 2
  %conv = zext i16 %0 to i32
  %1 = load i32, ptr %n.addr, align 4
  %conv1 = sext i32 %1 to i64
  %sub = sub i64 16, %conv1
  %sh_prom = trunc i64 %sub to i32
  %shr = ashr i32 %conv, %sh_prom
  store i32 %shr, ptr %x, align 4
  %2 = load i32, ptr %n.addr, align 4
  call void @fillbuf(i32 noundef %2)
  %3 = load i32, ptr %x, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_pt_len(i32 noundef %nn, i32 noundef %nbit, i32 noundef %i_special) #0 {
entry:
  %nn.addr = alloca i32, align 4
  %nbit.addr = alloca i32, align 4
  %i_special.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %nn, ptr %nn.addr, align 4
  store i32 %nbit, ptr %nbit.addr, align 4
  store i32 %i_special, ptr %i_special.addr, align 4
  %0 = load i32, ptr %nbit.addr, align 4
  %call = call i32 @getbits(i32 noundef %0)
  store i32 %call, ptr %n, align 4
  %1 = load i32, ptr %n, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %nbit.addr, align 4
  %call1 = call i32 @getbits(i32 noundef %2)
  store i32 %call1, ptr %c, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, ptr %i, align 4
  %4 = load i32, ptr %nn.addr, align 4
  %cmp2 = icmp slt i32 %3, %4
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [19 x i8], ptr @pt_len, i64 0, i64 %idxprom
  store i8 0, ptr %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, ptr %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc8, %for.end
  %7 = load i32, ptr %i, align 4
  %cmp4 = icmp slt i32 %7, 256
  br i1 %cmp4, label %for.body5, label %for.end10

for.body5:                                        ; preds = %for.cond3
  %8 = load i32, ptr %c, align 4
  %conv = trunc i32 %8 to i16
  %9 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [256 x i16], ptr @pt_table, i64 0, i64 %idxprom6
  store i16 %conv, ptr %arrayidx7, align 2
  br label %for.inc8

for.inc8:                                         ; preds = %for.body5
  %10 = load i32, ptr %i, align 4
  %inc9 = add nsw i32 %10, 1
  store i32 %inc9, ptr %i, align 4
  br label %for.cond3, !llvm.loop !162

for.end10:                                        ; preds = %for.cond3
  br label %if.end50

if.else:                                          ; preds = %entry
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end40, %if.else
  %11 = load i32, ptr %i, align 4
  %12 = load i32, ptr %n, align 4
  %cmp11 = icmp slt i32 %11, %12
  br i1 %cmp11, label %while.body, label %while.end41

while.body:                                       ; preds = %while.cond
  %13 = load i16, ptr @bitbuf.248, align 2
  %conv13 = zext i16 %13 to i32
  %shr = ashr i32 %conv13, 13
  store i32 %shr, ptr %c, align 4
  %14 = load i32, ptr %c, align 4
  %cmp14 = icmp eq i32 %14, 7
  br i1 %cmp14, label %if.then16, label %if.end

if.then16:                                        ; preds = %while.body
  store i32 4096, ptr %mask, align 4
  br label %while.cond17

while.cond17:                                     ; preds = %while.body19, %if.then16
  %15 = load i32, ptr %mask, align 4
  %16 = load i16, ptr @bitbuf.248, align 2
  %conv18 = zext i16 %16 to i32
  %and = and i32 %15, %conv18
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %while.body19, label %while.end

while.body19:                                     ; preds = %while.cond17
  %17 = load i32, ptr %mask, align 4
  %shr20 = lshr i32 %17, 1
  store i32 %shr20, ptr %mask, align 4
  %18 = load i32, ptr %c, align 4
  %inc21 = add nsw i32 %18, 1
  store i32 %inc21, ptr %c, align 4
  br label %while.cond17, !llvm.loop !163

while.end:                                        ; preds = %while.cond17
  br label %if.end

if.end:                                           ; preds = %while.end, %while.body
  %19 = load i32, ptr %c, align 4
  %cmp22 = icmp slt i32 %19, 7
  br i1 %cmp22, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %20 = load i32, ptr %c, align 4
  %sub = sub nsw i32 %20, 3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 3, %cond.true ], [ %sub, %cond.false ]
  call void @fillbuf(i32 noundef %cond)
  %21 = load i32, ptr %c, align 4
  %conv24 = trunc i32 %21 to i8
  %22 = load i32, ptr %i, align 4
  %inc25 = add nsw i32 %22, 1
  store i32 %inc25, ptr %i, align 4
  %idxprom26 = sext i32 %22 to i64
  %arrayidx27 = getelementptr inbounds [19 x i8], ptr @pt_len, i64 0, i64 %idxprom26
  store i8 %conv24, ptr %arrayidx27, align 1
  %23 = load i32, ptr %i, align 4
  %24 = load i32, ptr %i_special.addr, align 4
  %cmp28 = icmp eq i32 %23, %24
  br i1 %cmp28, label %if.then30, label %if.end40

if.then30:                                        ; preds = %cond.end
  %call31 = call i32 @getbits(i32 noundef 2)
  store i32 %call31, ptr %c, align 4
  br label %while.cond32

while.cond32:                                     ; preds = %while.body35, %if.then30
  %25 = load i32, ptr %c, align 4
  %dec = add nsw i32 %25, -1
  store i32 %dec, ptr %c, align 4
  %cmp33 = icmp sge i32 %dec, 0
  br i1 %cmp33, label %while.body35, label %while.end39

while.body35:                                     ; preds = %while.cond32
  %26 = load i32, ptr %i, align 4
  %inc36 = add nsw i32 %26, 1
  store i32 %inc36, ptr %i, align 4
  %idxprom37 = sext i32 %26 to i64
  %arrayidx38 = getelementptr inbounds [19 x i8], ptr @pt_len, i64 0, i64 %idxprom37
  store i8 0, ptr %arrayidx38, align 1
  br label %while.cond32, !llvm.loop !164

while.end39:                                      ; preds = %while.cond32
  br label %if.end40

if.end40:                                         ; preds = %while.end39, %cond.end
  br label %while.cond, !llvm.loop !165

while.end41:                                      ; preds = %while.cond
  br label %while.cond42

while.cond42:                                     ; preds = %while.body45, %while.end41
  %27 = load i32, ptr %i, align 4
  %28 = load i32, ptr %nn.addr, align 4
  %cmp43 = icmp slt i32 %27, %28
  br i1 %cmp43, label %while.body45, label %while.end49

while.body45:                                     ; preds = %while.cond42
  %29 = load i32, ptr %i, align 4
  %inc46 = add nsw i32 %29, 1
  store i32 %inc46, ptr %i, align 4
  %idxprom47 = sext i32 %29 to i64
  %arrayidx48 = getelementptr inbounds [19 x i8], ptr @pt_len, i64 0, i64 %idxprom47
  store i8 0, ptr %arrayidx48, align 1
  br label %while.cond42, !llvm.loop !166

while.end49:                                      ; preds = %while.cond42
  %30 = load i32, ptr %nn.addr, align 4
  call void @make_table(i32 noundef %30, ptr noundef @pt_len, i32 noundef 8, ptr noundef @pt_table)
  br label %if.end50

if.end50:                                         ; preds = %while.end49, %for.end10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_c_len() #0 {
entry:
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i32, align 4
  %mask = alloca i32, align 4
  %call = call i32 @getbits(i32 noundef 9)
  store i32 %call, ptr %n, align 4
  %0 = load i32, ptr %n, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32 @getbits(i32 noundef 9)
  store i32 %call1, ptr %c, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, ptr %i, align 4
  %cmp2 = icmp slt i32 %1, 510
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom
  store i8 0, ptr %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, ptr %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i32, ptr %i, align 4
  %cmp4 = icmp slt i32 %4, 4096
  br i1 %cmp4, label %for.body5, label %for.end10

for.body5:                                        ; preds = %for.cond3
  %5 = load i32, ptr %c, align 4
  %conv = trunc i32 %5 to i16
  %6 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %6 to i64
  %arrayidx7 = getelementptr inbounds [0 x i16], ptr @d_buf, i64 0, i64 %idxprom6
  store i16 %conv, ptr %arrayidx7, align 2
  br label %for.inc8

for.inc8:                                         ; preds = %for.body5
  %7 = load i32, ptr %i, align 4
  %inc9 = add nsw i32 %7, 1
  store i32 %inc9, ptr %i, align 4
  br label %for.cond3, !llvm.loop !168

for.end10:                                        ; preds = %for.cond3
  br label %if.end74

if.else:                                          ; preds = %entry
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end64, %if.else
  %8 = load i32, ptr %i, align 4
  %9 = load i32, ptr %n, align 4
  %cmp11 = icmp slt i32 %8, %9
  br i1 %cmp11, label %while.body, label %while.end65

while.body:                                       ; preds = %while.cond
  %10 = load i16, ptr @bitbuf.248, align 2
  %conv13 = zext i16 %10 to i32
  %shr = ashr i32 %conv13, 8
  %idxprom14 = sext i32 %shr to i64
  %arrayidx15 = getelementptr inbounds [256 x i16], ptr @pt_table, i64 0, i64 %idxprom14
  %11 = load i16, ptr %arrayidx15, align 2
  %conv16 = zext i16 %11 to i32
  store i32 %conv16, ptr %c, align 4
  %12 = load i32, ptr %c, align 4
  %cmp17 = icmp sge i32 %12, 19
  br i1 %cmp17, label %if.then19, label %if.end32

if.then19:                                        ; preds = %while.body
  store i32 128, ptr %mask, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then19
  %13 = load i16, ptr @bitbuf.248, align 2
  %conv20 = zext i16 %13 to i32
  %14 = load i32, ptr %mask, align 4
  %and = and i32 %conv20, %14
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then21, label %if.else25

if.then21:                                        ; preds = %do.body
  %15 = load i32, ptr %c, align 4
  %idxprom22 = sext i32 %15 to i64
  %arrayidx23 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom22
  %16 = load i16, ptr %arrayidx23, align 2
  %conv24 = zext i16 %16 to i32
  store i32 %conv24, ptr %c, align 4
  br label %if.end

if.else25:                                        ; preds = %do.body
  %17 = load i32, ptr %c, align 4
  %idxprom26 = sext i32 %17 to i64
  %arrayidx27 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom26
  %18 = load i16, ptr %arrayidx27, align 2
  %conv28 = zext i16 %18 to i32
  store i32 %conv28, ptr %c, align 4
  br label %if.end

if.end:                                           ; preds = %if.else25, %if.then21
  %19 = load i32, ptr %mask, align 4
  %shr29 = lshr i32 %19, 1
  store i32 %shr29, ptr %mask, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %20 = load i32, ptr %c, align 4
  %cmp30 = icmp sge i32 %20, 19
  br i1 %cmp30, label %do.body, label %do.end, !llvm.loop !169

do.end:                                           ; preds = %do.cond
  br label %if.end32

if.end32:                                         ; preds = %do.end, %while.body
  %21 = load i32, ptr %c, align 4
  %idxprom33 = sext i32 %21 to i64
  %arrayidx34 = getelementptr inbounds [19 x i8], ptr @pt_len, i64 0, i64 %idxprom33
  %22 = load i8, ptr %arrayidx34, align 1
  %conv35 = zext i8 %22 to i32
  call void @fillbuf(i32 noundef %conv35)
  %23 = load i32, ptr %c, align 4
  %cmp36 = icmp sle i32 %23, 2
  br i1 %cmp36, label %if.then38, label %if.else59

if.then38:                                        ; preds = %if.end32
  %24 = load i32, ptr %c, align 4
  %cmp39 = icmp eq i32 %24, 0
  br i1 %cmp39, label %if.then41, label %if.else42

if.then41:                                        ; preds = %if.then38
  store i32 1, ptr %c, align 4
  br label %if.end51

if.else42:                                        ; preds = %if.then38
  %25 = load i32, ptr %c, align 4
  %cmp43 = icmp eq i32 %25, 1
  br i1 %cmp43, label %if.then45, label %if.else47

if.then45:                                        ; preds = %if.else42
  %call46 = call i32 @getbits(i32 noundef 4)
  %add = add i32 %call46, 3
  store i32 %add, ptr %c, align 4
  br label %if.end50

if.else47:                                        ; preds = %if.else42
  %call48 = call i32 @getbits(i32 noundef 9)
  %add49 = add i32 %call48, 20
  store i32 %add49, ptr %c, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.else47, %if.then45
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then41
  br label %while.cond52

while.cond52:                                     ; preds = %while.body55, %if.end51
  %26 = load i32, ptr %c, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, ptr %c, align 4
  %cmp53 = icmp sge i32 %dec, 0
  br i1 %cmp53, label %while.body55, label %while.end

while.body55:                                     ; preds = %while.cond52
  %27 = load i32, ptr %i, align 4
  %inc56 = add nsw i32 %27, 1
  store i32 %inc56, ptr %i, align 4
  %idxprom57 = sext i32 %27 to i64
  %arrayidx58 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom57
  store i8 0, ptr %arrayidx58, align 1
  br label %while.cond52, !llvm.loop !170

while.end:                                        ; preds = %while.cond52
  br label %if.end64

if.else59:                                        ; preds = %if.end32
  %28 = load i32, ptr %c, align 4
  %sub = sub nsw i32 %28, 2
  %conv60 = trunc i32 %sub to i8
  %29 = load i32, ptr %i, align 4
  %inc61 = add nsw i32 %29, 1
  store i32 %inc61, ptr %i, align 4
  %idxprom62 = sext i32 %29 to i64
  %arrayidx63 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom62
  store i8 %conv60, ptr %arrayidx63, align 1
  br label %if.end64

if.end64:                                         ; preds = %if.else59, %while.end
  br label %while.cond, !llvm.loop !171

while.end65:                                      ; preds = %while.cond
  br label %while.cond66

while.cond66:                                     ; preds = %while.body69, %while.end65
  %30 = load i32, ptr %i, align 4
  %cmp67 = icmp slt i32 %30, 510
  br i1 %cmp67, label %while.body69, label %while.end73

while.body69:                                     ; preds = %while.cond66
  %31 = load i32, ptr %i, align 4
  %inc70 = add nsw i32 %31, 1
  store i32 %inc70, ptr %i, align 4
  %idxprom71 = sext i32 %31 to i64
  %arrayidx72 = getelementptr inbounds [0 x i8], ptr @outbuf, i64 0, i64 %idxprom71
  store i8 0, ptr %arrayidx72, align 1
  br label %while.cond66, !llvm.loop !172

while.end73:                                      ; preds = %while.cond66
  call void @make_table(i32 noundef 510, ptr noundef @outbuf, i32 noundef 12, ptr noundef @d_buf)
  br label %if.end74

if.end74:                                         ; preds = %while.end73, %for.end10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @make_table(i32 noundef %nchar, ptr noundef %bitlen, i32 noundef %tablebits, ptr noundef %table) #0 {
entry:
  %nchar.addr = alloca i32, align 4
  %bitlen.addr = alloca ptr, align 8
  %tablebits.addr = alloca i32, align 4
  %table.addr = alloca ptr, align 8
  %count = alloca [17 x i16], align 16
  %weight = alloca [17 x i16], align 16
  %start = alloca [18 x i16], align 16
  %p = alloca ptr, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %len = alloca i32, align 4
  %ch = alloca i32, align 4
  %jutbits = alloca i32, align 4
  %avail = alloca i32, align 4
  %nextcode = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %nchar, ptr %nchar.addr, align 4
  store ptr %bitlen, ptr %bitlen.addr, align 8
  store i32 %tablebits, ptr %tablebits.addr, align 4
  store ptr %table, ptr %table.addr, align 8
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp ule i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %idxprom = zext i32 %1 to i64
  %arrayidx = getelementptr inbounds [17 x i16], ptr %count, i64 0, i64 %idxprom
  store i16 0, ptr %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, ptr %i, align 4
  %inc = add i32 %2, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc9, %for.end
  %3 = load i32, ptr %i, align 4
  %4 = load i32, ptr %nchar.addr, align 4
  %cmp2 = icmp ult i32 %3, %4
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1
  %5 = load ptr, ptr %bitlen.addr, align 8
  %6 = load i32, ptr %i, align 4
  %idxprom4 = zext i32 %6 to i64
  %arrayidx5 = getelementptr inbounds i8, ptr %5, i64 %idxprom4
  %7 = load i8, ptr %arrayidx5, align 1
  %idxprom6 = zext i8 %7 to i64
  %arrayidx7 = getelementptr inbounds [17 x i16], ptr %count, i64 0, i64 %idxprom6
  %8 = load i16, ptr %arrayidx7, align 2
  %inc8 = add i16 %8, 1
  store i16 %inc8, ptr %arrayidx7, align 2
  br label %for.inc9

for.inc9:                                         ; preds = %for.body3
  %9 = load i32, ptr %i, align 4
  %inc10 = add i32 %9, 1
  store i32 %inc10, ptr %i, align 4
  br label %for.cond1, !llvm.loop !174

for.end11:                                        ; preds = %for.cond1
  %arrayidx12 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 1
  store i16 0, ptr %arrayidx12, align 2
  store i32 1, ptr %i, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc25, %for.end11
  %10 = load i32, ptr %i, align 4
  %cmp14 = icmp ule i32 %10, 16
  br i1 %cmp14, label %for.body15, label %for.end27

for.body15:                                       ; preds = %for.cond13
  %11 = load i32, ptr %i, align 4
  %idxprom16 = zext i32 %11 to i64
  %arrayidx17 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom16
  %12 = load i16, ptr %arrayidx17, align 2
  %conv = zext i16 %12 to i32
  %13 = load i32, ptr %i, align 4
  %idxprom18 = zext i32 %13 to i64
  %arrayidx19 = getelementptr inbounds [17 x i16], ptr %count, i64 0, i64 %idxprom18
  %14 = load i16, ptr %arrayidx19, align 2
  %conv20 = zext i16 %14 to i32
  %15 = load i32, ptr %i, align 4
  %sub = sub i32 16, %15
  %shl = shl i32 %conv20, %sub
  %add = add nsw i32 %conv, %shl
  %conv21 = trunc i32 %add to i16
  %16 = load i32, ptr %i, align 4
  %add22 = add i32 %16, 1
  %idxprom23 = zext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom23
  store i16 %conv21, ptr %arrayidx24, align 2
  br label %for.inc25

for.inc25:                                        ; preds = %for.body15
  %17 = load i32, ptr %i, align 4
  %inc26 = add i32 %17, 1
  store i32 %inc26, ptr %i, align 4
  br label %for.cond13, !llvm.loop !175

for.end27:                                        ; preds = %for.cond13
  %arrayidx28 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 17
  %18 = load i16, ptr %arrayidx28, align 2
  %conv29 = zext i16 %18 to i32
  %and = and i32 %conv29, 65535
  %cmp30 = icmp ne i32 %and, 0
  br i1 %cmp30, label %if.then, label %if.end

if.then:                                          ; preds = %for.end27
  call void @error(ptr noundef @.str.249)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end27
  %19 = load i32, ptr %tablebits.addr, align 4
  %sub32 = sub nsw i32 16, %19
  store i32 %sub32, ptr %jutbits, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc46, %if.end
  %20 = load i32, ptr %i, align 4
  %21 = load i32, ptr %tablebits.addr, align 4
  %cmp34 = icmp ule i32 %20, %21
  br i1 %cmp34, label %for.body36, label %for.end48

for.body36:                                       ; preds = %for.cond33
  %22 = load i32, ptr %jutbits, align 4
  %23 = load i32, ptr %i, align 4
  %idxprom37 = zext i32 %23 to i64
  %arrayidx38 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom37
  %24 = load i16, ptr %arrayidx38, align 2
  %conv39 = zext i16 %24 to i32
  %shr = ashr i32 %conv39, %22
  %conv40 = trunc i32 %shr to i16
  store i16 %conv40, ptr %arrayidx38, align 2
  %25 = load i32, ptr %tablebits.addr, align 4
  %26 = load i32, ptr %i, align 4
  %sub41 = sub i32 %25, %26
  %shl42 = shl i32 1, %sub41
  %conv43 = trunc i32 %shl42 to i16
  %27 = load i32, ptr %i, align 4
  %idxprom44 = zext i32 %27 to i64
  %arrayidx45 = getelementptr inbounds [17 x i16], ptr %weight, i64 0, i64 %idxprom44
  store i16 %conv43, ptr %arrayidx45, align 2
  br label %for.inc46

for.inc46:                                        ; preds = %for.body36
  %28 = load i32, ptr %i, align 4
  %inc47 = add i32 %28, 1
  store i32 %inc47, ptr %i, align 4
  br label %for.cond33, !llvm.loop !176

for.end48:                                        ; preds = %for.cond33
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end48
  %29 = load i32, ptr %i, align 4
  %cmp49 = icmp ule i32 %29, 16
  br i1 %cmp49, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %30 = load i32, ptr %i, align 4
  %sub51 = sub i32 16, %30
  %shl52 = shl i32 1, %sub51
  %conv53 = trunc i32 %shl52 to i16
  %31 = load i32, ptr %i, align 4
  %idxprom54 = zext i32 %31 to i64
  %arrayidx55 = getelementptr inbounds [17 x i16], ptr %weight, i64 0, i64 %idxprom54
  store i16 %conv53, ptr %arrayidx55, align 2
  %32 = load i32, ptr %i, align 4
  %inc56 = add i32 %32, 1
  store i32 %inc56, ptr %i, align 4
  br label %while.cond, !llvm.loop !177

while.end:                                        ; preds = %while.cond
  %33 = load i32, ptr %tablebits.addr, align 4
  %add57 = add nsw i32 %33, 1
  %idxprom58 = sext i32 %add57 to i64
  %arrayidx59 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom58
  %34 = load i16, ptr %arrayidx59, align 2
  %conv60 = zext i16 %34 to i32
  %35 = load i32, ptr %jutbits, align 4
  %shr61 = ashr i32 %conv60, %35
  store i32 %shr61, ptr %i, align 4
  %36 = load i32, ptr %i, align 4
  %cmp62 = icmp ne i32 %36, 0
  br i1 %cmp62, label %if.then64, label %if.end74

if.then64:                                        ; preds = %while.end
  %37 = load i32, ptr %tablebits.addr, align 4
  %shl65 = shl i32 1, %37
  store i32 %shl65, ptr %k, align 4
  br label %while.cond66

while.cond66:                                     ; preds = %while.body69, %if.then64
  %38 = load i32, ptr %i, align 4
  %39 = load i32, ptr %k, align 4
  %cmp67 = icmp ne i32 %38, %39
  br i1 %cmp67, label %while.body69, label %while.end73

while.body69:                                     ; preds = %while.cond66
  %40 = load ptr, ptr %table.addr, align 8
  %41 = load i32, ptr %i, align 4
  %inc70 = add i32 %41, 1
  store i32 %inc70, ptr %i, align 4
  %idxprom71 = zext i32 %41 to i64
  %arrayidx72 = getelementptr inbounds i16, ptr %40, i64 %idxprom71
  store i16 0, ptr %arrayidx72, align 2
  br label %while.cond66, !llvm.loop !178

while.end73:                                      ; preds = %while.cond66
  br label %if.end74

if.end74:                                         ; preds = %while.end73, %while.end
  %42 = load i32, ptr %nchar.addr, align 4
  store i32 %42, ptr %avail, align 4
  %43 = load i32, ptr %tablebits.addr, align 4
  %sub75 = sub nsw i32 15, %43
  %shl76 = shl i32 1, %sub75
  store i32 %shl76, ptr %mask, align 4
  store i32 0, ptr %ch, align 4
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc148, %if.end74
  %44 = load i32, ptr %ch, align 4
  %45 = load i32, ptr %nchar.addr, align 4
  %cmp78 = icmp ult i32 %44, %45
  br i1 %cmp78, label %for.body80, label %for.end150

for.body80:                                       ; preds = %for.cond77
  %46 = load ptr, ptr %bitlen.addr, align 8
  %47 = load i32, ptr %ch, align 4
  %idxprom81 = zext i32 %47 to i64
  %arrayidx82 = getelementptr inbounds i8, ptr %46, i64 %idxprom81
  %48 = load i8, ptr %arrayidx82, align 1
  %conv83 = zext i8 %48 to i32
  store i32 %conv83, ptr %len, align 4
  %cmp84 = icmp eq i32 %conv83, 0
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %for.body80
  br label %for.inc148

if.end87:                                         ; preds = %for.body80
  %49 = load i32, ptr %len, align 4
  %idxprom88 = zext i32 %49 to i64
  %arrayidx89 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom88
  %50 = load i16, ptr %arrayidx89, align 2
  %conv90 = zext i16 %50 to i32
  %51 = load i32, ptr %len, align 4
  %idxprom91 = zext i32 %51 to i64
  %arrayidx92 = getelementptr inbounds [17 x i16], ptr %weight, i64 0, i64 %idxprom91
  %52 = load i16, ptr %arrayidx92, align 2
  %conv93 = zext i16 %52 to i32
  %add94 = add nsw i32 %conv90, %conv93
  store i32 %add94, ptr %nextcode, align 4
  %53 = load i32, ptr %len, align 4
  %54 = load i32, ptr %tablebits.addr, align 4
  %cmp95 = icmp ule i32 %53, %54
  br i1 %cmp95, label %if.then97, label %if.else

if.then97:                                        ; preds = %if.end87
  %55 = load i32, ptr %len, align 4
  %idxprom98 = zext i32 %55 to i64
  %arrayidx99 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom98
  %56 = load i16, ptr %arrayidx99, align 2
  %conv100 = zext i16 %56 to i32
  store i32 %conv100, ptr %i, align 4
  br label %for.cond101

for.cond101:                                      ; preds = %for.inc108, %if.then97
  %57 = load i32, ptr %i, align 4
  %58 = load i32, ptr %nextcode, align 4
  %cmp102 = icmp ult i32 %57, %58
  br i1 %cmp102, label %for.body104, label %for.end110

for.body104:                                      ; preds = %for.cond101
  %59 = load i32, ptr %ch, align 4
  %conv105 = trunc i32 %59 to i16
  %60 = load ptr, ptr %table.addr, align 8
  %61 = load i32, ptr %i, align 4
  %idxprom106 = zext i32 %61 to i64
  %arrayidx107 = getelementptr inbounds i16, ptr %60, i64 %idxprom106
  store i16 %conv105, ptr %arrayidx107, align 2
  br label %for.inc108

for.inc108:                                       ; preds = %for.body104
  %62 = load i32, ptr %i, align 4
  %inc109 = add i32 %62, 1
  store i32 %inc109, ptr %i, align 4
  br label %for.cond101, !llvm.loop !179

for.end110:                                       ; preds = %for.cond101
  br label %if.end144

if.else:                                          ; preds = %if.end87
  %63 = load i32, ptr %len, align 4
  %idxprom111 = zext i32 %63 to i64
  %arrayidx112 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom111
  %64 = load i16, ptr %arrayidx112, align 2
  %conv113 = zext i16 %64 to i32
  store i32 %conv113, ptr %k, align 4
  %65 = load ptr, ptr %table.addr, align 8
  %66 = load i32, ptr %k, align 4
  %67 = load i32, ptr %jutbits, align 4
  %shr114 = lshr i32 %66, %67
  %idxprom115 = zext i32 %shr114 to i64
  %arrayidx116 = getelementptr inbounds i16, ptr %65, i64 %idxprom115
  store ptr %arrayidx116, ptr %p, align 8
  %68 = load i32, ptr %len, align 4
  %69 = load i32, ptr %tablebits.addr, align 4
  %sub117 = sub i32 %68, %69
  store i32 %sub117, ptr %i, align 4
  br label %while.cond118

while.cond118:                                    ; preds = %if.end140, %if.else
  %70 = load i32, ptr %i, align 4
  %cmp119 = icmp ne i32 %70, 0
  br i1 %cmp119, label %while.body121, label %while.end142

while.body121:                                    ; preds = %while.cond118
  %71 = load ptr, ptr %p, align 8
  %72 = load i16, ptr %71, align 2
  %conv122 = zext i16 %72 to i32
  %cmp123 = icmp eq i32 %conv122, 0
  br i1 %cmp123, label %if.then125, label %if.end132

if.then125:                                       ; preds = %while.body121
  %73 = load i32, ptr %avail, align 4
  %idxprom126 = zext i32 %73 to i64
  %arrayidx127 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom126
  store i16 0, ptr %arrayidx127, align 2
  %74 = load i32, ptr %avail, align 4
  %idxprom128 = zext i32 %74 to i64
  %arrayidx129 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom128
  store i16 0, ptr %arrayidx129, align 2
  %75 = load i32, ptr %avail, align 4
  %inc130 = add i32 %75, 1
  store i32 %inc130, ptr %avail, align 4
  %conv131 = trunc i32 %75 to i16
  %76 = load ptr, ptr %p, align 8
  store i16 %conv131, ptr %76, align 2
  br label %if.end132

if.end132:                                        ; preds = %if.then125, %while.body121
  %77 = load i32, ptr %k, align 4
  %78 = load i32, ptr %mask, align 4
  %and133 = and i32 %77, %78
  %tobool = icmp ne i32 %and133, 0
  br i1 %tobool, label %if.then134, label %if.else137

if.then134:                                       ; preds = %if.end132
  %79 = load ptr, ptr %p, align 8
  %80 = load i16, ptr %79, align 2
  %idxprom135 = zext i16 %80 to i64
  %arrayidx136 = getelementptr inbounds i16, ptr getelementptr inbounds (i16, ptr @prev, i64 32768), i64 %idxprom135
  store ptr %arrayidx136, ptr %p, align 8
  br label %if.end140

if.else137:                                       ; preds = %if.end132
  %81 = load ptr, ptr %p, align 8
  %82 = load i16, ptr %81, align 2
  %idxprom138 = zext i16 %82 to i64
  %arrayidx139 = getelementptr inbounds [0 x i16], ptr @prev, i64 0, i64 %idxprom138
  store ptr %arrayidx139, ptr %p, align 8
  br label %if.end140

if.end140:                                        ; preds = %if.else137, %if.then134
  %83 = load i32, ptr %k, align 4
  %shl141 = shl i32 %83, 1
  store i32 %shl141, ptr %k, align 4
  %84 = load i32, ptr %i, align 4
  %dec = add i32 %84, -1
  store i32 %dec, ptr %i, align 4
  br label %while.cond118, !llvm.loop !180

while.end142:                                     ; preds = %while.cond118
  %85 = load i32, ptr %ch, align 4
  %conv143 = trunc i32 %85 to i16
  %86 = load ptr, ptr %p, align 8
  store i16 %conv143, ptr %86, align 2
  br label %if.end144

if.end144:                                        ; preds = %while.end142, %for.end110
  %87 = load i32, ptr %nextcode, align 4
  %conv145 = trunc i32 %87 to i16
  %88 = load i32, ptr %len, align 4
  %idxprom146 = zext i32 %88 to i64
  %arrayidx147 = getelementptr inbounds [18 x i16], ptr %start, i64 0, i64 %idxprom146
  store i16 %conv145, ptr %arrayidx147, align 2
  br label %for.inc148

for.inc148:                                       ; preds = %if.end144, %if.then86
  %89 = load i32, ptr %ch, align 4
  %inc149 = add i32 %89, 1
  store i32 %inc149, ptr %ch, align 4
  br label %for.cond77, !llvm.loop !181

for.end150:                                       ; preds = %for.cond77
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @huf_decode_start() #0 {
entry:
  call void @init_getbits()
  store i32 0, ptr @blocksize, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @init_getbits() #0 {
entry:
  store i16 0, ptr @bitbuf.248, align 2
  store i32 0, ptr @subbitbuf, align 4
  store i32 0, ptr @bitcount, align 4
  call void @fillbuf(i32 noundef 16)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #8 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind readonly willreturn }
attributes #11 = { nounwind }
attributes #12 = { noreturn nounwind }
attributes #13 = { nounwind readnone willreturn }
attributes #14 = { nounwind allocsize(0) }
attributes #15 = { nounwind allocsize(0,1) }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 15.0.7"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
!73 = distinct !{!73, !7}
!74 = distinct !{!74, !7}
!75 = distinct !{!75, !7}
!76 = distinct !{!76, !7}
!77 = distinct !{!77, !7}
!78 = distinct !{!78, !7}
!79 = distinct !{!79, !7}
!80 = distinct !{!80, !7}
!81 = distinct !{!81, !7}
!82 = distinct !{!82, !7}
!83 = distinct !{!83, !7}
!84 = distinct !{!84, !7}
!85 = distinct !{!85, !7}
!86 = distinct !{!86, !7}
!87 = distinct !{!87, !7}
!88 = distinct !{!88, !7}
!89 = distinct !{!89, !7}
!90 = distinct !{!90, !7}
!91 = distinct !{!91, !7}
!92 = distinct !{!92, !7}
!93 = distinct !{!93, !7}
!94 = distinct !{!94, !7}
!95 = distinct !{!95, !7}
!96 = distinct !{!96, !7}
!97 = distinct !{!97, !7}
!98 = distinct !{!98, !7}
!99 = distinct !{!99, !7}
!100 = distinct !{!100, !7}
!101 = distinct !{!101, !7}
!102 = distinct !{!102, !7}
!103 = distinct !{!103, !7}
!104 = distinct !{!104, !7}
!105 = distinct !{!105, !7}
!106 = distinct !{!106, !7}
!107 = distinct !{!107, !7}
!108 = distinct !{!108, !7}
!109 = distinct !{!109, !7}
!110 = distinct !{!110, !7}
!111 = distinct !{!111, !7}
!112 = distinct !{!112, !7}
!113 = distinct !{!113, !7}
!114 = distinct !{!114, !7}
!115 = distinct !{!115, !7}
!116 = distinct !{!116, !7}
!117 = distinct !{!117, !7}
!118 = distinct !{!118, !7}
!119 = distinct !{!119, !7}
!120 = distinct !{!120, !7}
!121 = distinct !{!121, !7}
!122 = distinct !{!122, !7}
!123 = distinct !{!123, !7}
!124 = distinct !{!124, !7}
!125 = distinct !{!125, !7}
!126 = distinct !{!126, !7}
!127 = distinct !{!127, !7}
!128 = distinct !{!128, !7}
!129 = distinct !{!129, !7}
!130 = distinct !{!130, !7}
!131 = distinct !{!131, !7}
!132 = distinct !{!132, !7}
!133 = distinct !{!133, !7}
!134 = distinct !{!134, !7}
!135 = distinct !{!135, !7}
!136 = distinct !{!136, !7}
!137 = distinct !{!137, !7}
!138 = distinct !{!138, !7}
!139 = distinct !{!139, !7}
!140 = distinct !{!140, !7}
!141 = distinct !{!141, !7}
!142 = distinct !{!142, !7}
!143 = distinct !{!143, !7}
!144 = distinct !{!144, !7}
!145 = distinct !{!145, !7}
!146 = distinct !{!146, !7}
!147 = distinct !{!147, !7}
!148 = distinct !{!148, !7}
!149 = distinct !{!149, !7}
!150 = distinct !{!150, !7}
!151 = distinct !{!151, !7}
!152 = distinct !{!152, !7}
!153 = distinct !{!153, !7}
!154 = distinct !{!154, !7}
!155 = distinct !{!155, !7}
!156 = distinct !{!156, !7}
!157 = distinct !{!157, !7}
!158 = distinct !{!158, !7}
!159 = distinct !{!159, !7}
!160 = distinct !{!160, !7}
!161 = distinct !{!161, !7}
!162 = distinct !{!162, !7}
!163 = distinct !{!163, !7}
!164 = distinct !{!164, !7}
!165 = distinct !{!165, !7}
!166 = distinct !{!166, !7}
!167 = distinct !{!167, !7}
!168 = distinct !{!168, !7}
!169 = distinct !{!169, !7}
!170 = distinct !{!170, !7}
!171 = distinct !{!171, !7}
!172 = distinct !{!172, !7}
!173 = distinct !{!173, !7}
!174 = distinct !{!174, !7}
!175 = distinct !{!175, !7}
!176 = distinct !{!176, !7}
!177 = distinct !{!177, !7}
!178 = distinct !{!178, !7}
!179 = distinct !{!179, !7}
!180 = distinct !{!180, !7}
!181 = distinct !{!181, !7}
