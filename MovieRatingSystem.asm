.MODEL SMALL
.STACK 400h

.DATA

admin_user   DB 'admin',0
admin_pass   DB 'admin123',0

user1_name   DB 'alice',0
user1_pass   DB 'pass1',0
user2_name   DB 'bob',0
user2_pass   DB 'pass2',0
user3_name   DB 'charlie',0
user3_pass   DB 'pass3',0
user4_name   DB 'diana',0
user4_pass   DB 'pass4',0
user5_name   DB 'eve',0
user5_pass   DB 'pass5',0


reg_count    DB 0
reg_u1_name  DB 20 DUP(0)
reg_u1_pass  DB 20 DUP(0)
reg_u2_name  DB 20 DUP(0)
reg_u2_pass  DB 20 DUP(0)
reg_u3_name  DB 20 DUP(0)
reg_u3_pass  DB 20 DUP(0)
reg_u4_name  DB 20 DUP(0)
reg_u4_pass  DB 20 DUP(0)
reg_u5_name  DB 20 DUP(0)
reg_u5_pass  DB 20 DUP(0)

pre_m1_name  DB 'The Dark Knight', 15 DUP(0)
pre_m1_genre DB 'Action', 9 DUP(0)
pre_m1_rc    DB 3
pre_m1_rs    DW 15

pre_m2_name  DB 'Inception', 21 DUP(0)
pre_m2_genre DB 'SciFi', 10 DUP(0)
pre_m2_rc    DB 2
pre_m2_rs    DW 10

pre_m3_name  DB 'The Notebook', 18 DUP(0)
pre_m3_genre DB 'Drama', 10 DUP(0)
pre_m3_rc    DB 2
pre_m3_rs    DW 8

pre_m4_name  DB 'Superbad', 22 DUP(0)
pre_m4_genre DB 'Comedy', 9 DUP(0)
pre_m4_rc    DB 3
pre_m4_rs    DW 9

pre_m5_name  DB 'The Conjuring', 17 DUP(0)
pre_m5_genre DB 'Horror', 9 DUP(0)
pre_m5_rc    DB 2
pre_m5_rs    DW 7

movie_db     DB 1680 DUP(0)
movie_count  DB 0

input_buf    DB 82 DUP(0)
temp_buf     DB 82 DUP(0)

current_role DB 0
found_flag   DB 0
best_idx     DB 0
best_avg     DB 0
search_type  DB 0
cur_movie    DB 0
cur_rating   DB 0
entry_ptr    DW 0
idx_valid    DB 0
sh_idx       DB 0

msg_welcome  DB 13,10,'====================================',13,10
             DB '   MOVIE RATING SYSTEM - EMU8086   ',13,10
             DB '====================================',13,10,'$'

msg_main     DB 13,10,'--- MAIN MENU ---',13,10
             DB '1. Admin Login',13,10
             DB '2. User Login',13,10
             DB '3. Register New User',13,10
             DB '4. Exit',13,10
             DB 'Choice: $'

msg_adm_menu DB 13,10,'--- ADMIN MENU ---',13,10
             DB '1. Add Movie',13,10
             DB '2. Manage Movies',13,10
             DB '3. View All Movies',13,10
             DB '4. Search Movie',13,10
             DB '5. Highest Rated',13,10
             DB '6. Logout',13,10
             DB 'Choice: $'

msg_usr_menu DB 13,10,'--- USER MENU ---',13,10
             DB '1. View All Movies',13,10
             DB '2. Rate a Movie',13,10
             DB '3. Add Review',13,10
             DB '4. Search Movie',13,10
             DB '5. Highest Rated',13,10
             DB '6. Logout',13,10
             DB 'Choice: $'

msg_uname    DB 13,10,'Username: $'
msg_pwd      DB 'Password: $'
msg_loginok  DB 13,10,'Login successful!',13,10,'$'
msg_loginfail DB 13,10,'Invalid credentials.',13,10,'$'
msg_logout   DB 13,10,'Logged out.',13,10,'$'

msg_addname  DB 13,10,'Movie name: $'
msg_addgenre DB 'Genre (Action/Comedy/Drama/Horror/SciFi): $'
msg_added    DB 13,10,'Movie added!',13,10,'$'
msg_dbfull   DB 13,10,'Database full.',13,10,'$'
msg_nomovies DB 13,10,'No movies in database.',13,10,'$'

msg_listhdr  DB 13,10,'=== MOVIE LIST ===',13,10,'$'
msg_sep      DB '------------------------------',13,10,'$'
msg_namelbl  DB 'Name  : $'
msg_genrelbl DB 'Genre : $'
msg_ratlbl   DB 'Rating: $'
msg_slash5   DB '/5  ('  ,'$'
msg_ratings  DB ' ratings)',13,10,'$'
msg_revlbl   DB 'Reviews:',13,10,'$'
msg_norat    DB 'No ratings yet',13,10,'$'
msg_norev    DB '  (no reviews)',13,10,'$'

msg_which    DB 13,10,'Movie number: $'
msg_ratscore DB 'Your rating (1-5): $'
msg_ratok    DB 13,10,'Rating saved!',13,10,'$'
msg_invalid  DB 13,10,'Invalid.',13,10,'$'

msg_entrev   DB 'Review (max 40 chars): $'
msg_revsaved DB 13,10,'Review saved!',13,10,'$'
msg_revfull  DB 13,10,'No review slots left.',13,10,'$'

msg_srchby   DB 13,10,'Search: 1=Name  2=Genre: $'
msg_srchtxt  DB 'Term: $'
msg_notfound DB 13,10,'No results.',13,10,'$'
msg_found    DB 13,10,'--- Results ---',13,10,'$'

msg_highest  DB 13,10,'=== HIGHEST RATED ===',13,10,'$'
msg_norated  DB 13,10,'No movies rated yet.',13,10,'$'

msg_manage   DB 13,10,'--- MANAGE ---',13,10
             DB '1. Edit Name/Genre',13,10
             DB '2. Delete Movie',13,10
             DB '3. Delete Review',13,10
             DB '4. Back',13,10
             DB 'Choice: $'
msg_delwh    DB 13,10,'Movie # to delete: $'
msg_delok    DB 13,10,'Deleted.',13,10,'$'
msg_newname  DB 'New name (Press enter to confirm): $'
msg_newgenre DB 'New genre (Action/Comedy/Drama/Horror/SciFi): $'
msg_editok   DB 13,10,'Updated.',13,10,'$'
msg_delrevno DB 'Review # to delete (1-3): $'
msg_delrevok DB 13,10,'Review deleted.',13,10,'$'
msg_anykey   DB 13,10,'Press any key...$'
msg_numhash  DB '#$'

msg_reg_hdr  DB 13,10,'--- REGISTER NEW USER ---',13,10,'$'
msg_reg_full DB 13,10,'User limit reached (max 5 new users).',13,10,'$'
msg_reg_ok   DB 13,10,'Registration successful! You can now login.',13,10,'$'
msg_reg_dup  DB 13,10,'Username already exists.',13,10,'$'
msg_reg_unm  DB 'New username (max 19 chars): $'
msg_reg_pwd  DB 'New password (max 19 chars): $'
msg_reg_cnf  DB 'Confirm password: $'
msg_reg_mism DB 13,10,'Passwords do not match.',13,10,'$'
msg_reg_sht  DB 13,10,'Username/password must be at least 3 chars.',13,10,'$'

.CODE

CALC_ENTRY_PTR PROC
    PUSH BX
    MOV  AH, 0
    MOV  BX, 168
    MUL  BX
    LEA  BX, movie_db
    ADD  AX, BX
    MOV  [entry_ptr], AX
    POP  BX
    RET
CALC_ENTRY_PTR ENDP

PRINT_STR PROC
    PUSH AX
    MOV  AH, 09h
    INT  21h
    POP  AX
    RET
PRINT_STR ENDP

PRINT_NL PROC
    PUSH AX
    PUSH DX
    MOV  AH, 02h
    MOV  DL, 13
    INT  21h
    MOV  DL, 10
    INT  21h
    POP  DX
    POP  AX
    RET
PRINT_NL ENDP

PRINT_CHAR PROC
    PUSH AX
    PUSH DX
    MOV  AH, 02h
    MOV  DL, AL
    INT  21h
    POP  DX
    POP  AX
    RET
PRINT_CHAR ENDP

PRINT_DIGIT PROC
    PUSH AX
    PUSH DX
    ADD  AL, '0'
    MOV  AH, 02h
    MOV  DL, AL
    INT  21h
    POP  DX
    POP  AX
    RET
PRINT_DIGIT ENDP

PRINT_BYTE_DEC PROC
    PUSH AX
    PUSH BX
    PUSH DX
    MOV  AH, 0
    MOV  BL, 10
    DIV  BL
    CMP  AL, 0
    JE   pbd_skip_tens
    MOV  DL, AL
    ADD  DL, '0'
    MOV  AH, 02h
    INT  21h
pbd_skip_tens:
    MOV  AL, AH
    MOV  DL, AL
    ADD  DL, '0'
    MOV  AH, 02h
    INT  21h
    POP  DX
    POP  BX
    POP  AX
    RET
PRINT_BYTE_DEC ENDP

PRINT_ZSTR PROC
    PUSH AX
    PUSH BX
    PUSH DX
pzs_lp:
    MOV  AL, [BX]
    CMP  AL, 0
    JE   pzs_done
    MOV  AH, 02h
    MOV  DL, AL
    INT  21h
    INC  BX
    JMP  pzs_lp
pzs_done:
    POP  DX
    POP  BX
    POP  AX
    RET
PRINT_ZSTR ENDP

GET_CHAR PROC
    MOV  AH, 01h
    INT  21h
    RET
GET_CHAR ENDP

READ_STRING PROC
    PUSH SI
    PUSH CX
    PUSH DX
    PUSH AX
    MOV  SI, DI
    MOV  CX, 0
rds_lp:
    MOV  AH, 01h
    INT  21h
    CMP  AL, 13
    JE   rds_done
    CMP  AL, 8
    JE   rds_bs
    CMP  CX, BX
    JGE  rds_lp
    MOV  [DI], AL
    INC  DI
    INC  CX
    JMP  rds_lp
rds_bs:
    CMP  CX, 0
    JE   rds_lp
    DEC  DI
    DEC  CX
    MOV  AH, 02h
    MOV  DL, ' '
    INT  21h
    MOV  DL, 8
    INT  21h
    JMP  rds_lp
rds_done:
    MOV  AL, 0
    MOV  [DI], AL
    CALL PRINT_NL
    MOV  DI, SI
    POP  AX
    POP  DX
    POP  CX
    POP  SI
    RET
READ_STRING ENDP


STR_CMP PROC
    PUSH SI
    PUSH DI
    PUSH AX
    PUSH BX
scmp_lp:
    MOV  AL, [SI]
    MOV  BL, [DI]
    CMP  AL, BL
    JNE  scmp_ne
    CMP  AL, 0
    JE   scmp_eq
    INC  SI
    INC  DI
    JMP  scmp_lp
scmp_eq:
    POP  BX
    POP  AX
    POP  DI
    POP  SI
    PUSH AX
    MOV  AX, 0
    CMP  AX, 0
    POP  AX
    RET
scmp_ne:
    POP  BX
    POP  AX
    POP  DI
    POP  SI
    PUSH AX
    MOV  AX, 1
    CMP  AX, 0
    POP  AX
    RET
STR_CMP ENDP

TO_UPPER PROC
    CMP  AL, 'a'
    JL   tup_done
    CMP  AL, 'z'
    JG   tup_done
    SUB  AL, 32
tup_done:
    RET
TO_UPPER ENDP

STR_CONTAINS PROC
    PUSH BX
    PUSH DX
    PUSH SI
    PUSH DI
    PUSH CX

sc_outer:
    MOV  AL, [BX]
    CMP  AL, 0
    JE   sc_no

    MOV  SI, BX
    MOV  DI, DX

sc_inner:
    MOV  AL, [DI]
    CMP  AL, 0
    JE   sc_yes
    MOV  CL, [SI]
    CMP  CL, 0
    JE   sc_nx
    CALL TO_UPPER
    MOV  CH, AL
    MOV  AL, CL
    CALL TO_UPPER
    CMP  AL, CH
    JNE  sc_nx
    INC  SI
    INC  DI
    JMP  sc_inner

sc_nx:
    INC  BX
    JMP  sc_outer

sc_yes:
    POP  CX
    POP  DI
    POP  SI
    POP  DX
    POP  BX
    MOV  AL, 1
    RET
sc_no:
    POP  CX
    POP  DI
    POP  SI
    POP  DX
    POP  BX
    MOV  AL, 0
    RET
STR_CONTAINS ENDP

COPY_STR PROC
    PUSH SI
    PUSH DI
    PUSH CX
    PUSH AX
cps_lp:
    CMP  CX, 0
    JE   cps_done
    MOV  AL, [SI]
    MOV  [DI], AL
    CMP  AL, 0
    JE   cps_done
    INC  SI
    INC  DI
    DEC  CX
    JMP  cps_lp
cps_done:
    POP  AX
    POP  CX
    POP  DI
    POP  SI
    RET
COPY_STR ENDP

ZERO_MEM PROC
    PUSH DI
    PUSH CX
zm_lp:
    CMP  CX, 0
    JE   zm_done
    MOV  AL, 0
    MOV  [DI], AL
    INC  DI
    DEC  CX
    JMP  zm_lp
zm_done:
    POP  CX
    POP  DI
    RET
ZERO_MEM ENDP

LOAD_PRESET_MOVIES PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH SI
    PUSH DI

    MOV  AL, 0
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  DI, [entry_ptr]
    LEA  SI, pre_m1_name
    MOV  CX, 30
    CALL COPY_STR
    MOV  DI, [entry_ptr]
    ADD  DI, 30
    LEA  SI, pre_m1_genre
    MOV  CX, 15
    CALL COPY_STR
    MOV  BX, [entry_ptr]
    MOV  AL, [pre_m1_rc]
    MOV  [BX + 45], AL
    MOV  AX, [pre_m1_rs]
    MOV  [BX + 46], AX

    MOV  AL, 1
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  DI, [entry_ptr]
    LEA  SI, pre_m2_name
    MOV  CX, 30
    CALL COPY_STR
    MOV  DI, [entry_ptr]
    ADD  DI, 30
    LEA  SI, pre_m2_genre
    MOV  CX, 15
    CALL COPY_STR
    MOV  BX, [entry_ptr]
    MOV  AL, [pre_m2_rc]
    MOV  [BX + 45], AL
    MOV  AX, [pre_m2_rs]
    MOV  [BX + 46], AX

    MOV  AL, 2
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  DI, [entry_ptr]
    LEA  SI, pre_m3_name
    MOV  CX, 30
    CALL COPY_STR
    MOV  DI, [entry_ptr]
    ADD  DI, 30
    LEA  SI, pre_m3_genre
    MOV  CX, 15
    CALL COPY_STR
    MOV  BX, [entry_ptr]
    MOV  AL, [pre_m3_rc]
    MOV  [BX + 45], AL
    MOV  AX, [pre_m3_rs]
    MOV  [BX + 46], AX

    MOV  AL, 3
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  DI, [entry_ptr]
    LEA  SI, pre_m4_name
    MOV  CX, 30
    CALL COPY_STR
    MOV  DI, [entry_ptr]
    ADD  DI, 30
    LEA  SI, pre_m4_genre
    MOV  CX, 15
    CALL COPY_STR
    MOV  BX, [entry_ptr]
    MOV  AL, [pre_m4_rc]
    MOV  [BX + 45], AL
    MOV  AX, [pre_m4_rs]
    MOV  [BX + 46], AX

    MOV  AL, 4
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  DI, [entry_ptr]
    LEA  SI, pre_m5_name
    MOV  CX, 30
    CALL COPY_STR
    MOV  DI, [entry_ptr]
    ADD  DI, 30
    LEA  SI, pre_m5_genre
    MOV  CX, 15
    CALL COPY_STR
    MOV  BX, [entry_ptr]
    MOV  AL, [pre_m5_rc]
    MOV  [BX + 45], AL
    MOV  AX, [pre_m5_rs]
    MOV  [BX + 46], AX

    MOV  AL, 5
    MOV  [movie_count], AL

    POP  DI
    POP  SI
    POP  CX
    POP  BX
    POP  AX
    RET
LOAD_PRESET_MOVIES ENDP

LIST_NAMES PROC
    PUSH AX
    PUSH BX
    PUSH CX
    MOV  CX, 0
lsn_lp:
    MOV  AL, CL
    CMP  AL, [movie_count]
    JGE  lsn_done
    CALL CALC_ENTRY_PTR
    MOV  AL, CL
    INC  AL
    CALL PRINT_DIGIT
    MOV  AL, '.'
    CALL PRINT_CHAR
    MOV  AL, ' '
    CALL PRINT_CHAR
    MOV  BX, [entry_ptr]
    CALL PRINT_ZSTR
    CALL PRINT_NL
    INC  CX
    JMP  lsn_lp
lsn_done:
    POP  CX
    POP  BX
    POP  AX
    RET
LIST_NAMES ENDP

PRINT_MOVIE PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV  BX, [entry_ptr]
    LEA  DX, msg_namelbl
    CALL PRINT_STR
    CALL PRINT_ZSTR
    CALL PRINT_NL

    MOV  BX, [entry_ptr]
    ADD  BX, 30
    LEA  DX, msg_genrelbl
    CALL PRINT_STR
    CALL PRINT_ZSTR
    CALL PRINT_NL

    LEA  DX, msg_ratlbl
    CALL PRINT_STR
    MOV  BX, [entry_ptr]
    MOV  CL, [BX + 45]
    CMP  CL, 0
    JE   pm_norat
    MOV  AX, [BX + 46]
    MOV  AH, 0
    MOV  CH, 0
    DIV  CL
    CALL PRINT_DIGIT
    LEA  DX, msg_slash5
    CALL PRINT_STR
    MOV  AL, CL
    CALL PRINT_BYTE_DEC
    LEA  DX, msg_ratings
    CALL PRINT_STR
    JMP  pm_revs
pm_norat:
    LEA  DX, msg_norat
    CALL PRINT_STR

pm_revs:
    LEA  DX, msg_revlbl
    CALL PRINT_STR
    MOV  BX, [entry_ptr]
    ADD  BX, 48
    MOV  CL, 0
    MOV  CH, 0
pm_rlp:
    CMP  CL, 3
    JGE  pm_rdone
    MOV  AL, [BX]
    CMP  AL, 0
    JE   pm_rskip
    INC  CH
    MOV  AL, CL
    INC  AL
    CALL PRINT_DIGIT
    MOV  AL, '.'
    CALL PRINT_CHAR
    MOV  AL, ' '
    CALL PRINT_CHAR
    PUSH BX
    CALL PRINT_ZSTR
    CALL PRINT_NL
    POP  BX
pm_rskip:
    ADD  BX, 40
    INC  CL
    JMP  pm_rlp
pm_rdone:
    CMP  CH, 0
    JNE  pm_done
    LEA  DX, msg_norev
    CALL PRINT_STR
pm_done:
    POP  DX
    POP  CX
    POP  BX
    POP  AX
    RET
PRINT_MOVIE ENDP

GET_VALID_IDX PROC
    LEA  DX, msg_which
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    SUB  AL, '0'
    CMP  AL, 1
    JL   gvi_bad
    CMP  AL, [movie_count]
    JG   gvi_bad
    DEC  AL
    MOV  BL, 1
    MOV  [idx_valid], BL
    RET
gvi_bad:
    LEA  DX, msg_invalid
    CALL PRINT_STR
    MOV  BL, 0
    MOV  [idx_valid], BL
    RET
GET_VALID_IDX ENDP

MAIN PROC
    MOV  AX, @DATA
    MOV  DS, AX
    MOV  ES, AX

    CALL LOAD_PRESET_MOVIES
    LEA  DX, msg_welcome
    CALL PRINT_STR

main_lp:
    LEA  DX, msg_main
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    CMP  AL, '1'
    JE   do_admin
    CMP  AL, '2'
    JE   do_user
    CMP  AL, '3'
    JE   do_reg
    CMP  AL, '4'
    JE   do_exit
    JMP  main_lp
do_admin:
    CALL ADMIN_LOGIN
    MOV  AL, [current_role]
    CMP  AL, 1
    JNE  main_lp
    CALL ADMIN_LOOP
    JMP  main_lp
do_user:
    CALL USER_LOGIN
    MOV  AL, [current_role]
    CMP  AL, 2
    JNE  main_lp
    CALL USER_LOOP
    JMP  main_lp
do_reg:
    CALL REGISTER_USER
    JMP  main_lp
do_exit:
    MOV  AX, 4C00h
    INT  21h
MAIN ENDP

ADMIN_LOGIN PROC
    LEA  DX, msg_uname
    CALL PRINT_STR
    LEA  DI, input_buf
    MOV  BX, 79
    CALL READ_STRING
    LEA  SI, admin_user
    LEA  DI, input_buf
    CALL STR_CMP
    JNE  ali_fail
    LEA  DX, msg_pwd
    CALL PRINT_STR
    LEA  DI, input_buf
    MOV  BX, 79
    CALL READ_STRING
    LEA  SI, admin_pass
    LEA  DI, input_buf
    CALL STR_CMP
    JNE  ali_fail
    MOV  AL, 1
    MOV  [current_role], AL
    LEA  DX, msg_loginok
    CALL PRINT_STR
    RET
ali_fail:
    MOV  AL, 0
    MOV  [current_role], AL
    LEA  DX, msg_loginfail
    CALL PRINT_STR
    RET
ADMIN_LOGIN ENDP

USER_LOGIN PROC
    PUSH SI
    PUSH DI

    LEA  DX, msg_uname
    CALL PRINT_STR
    LEA  DI, input_buf
    MOV  BX, 79
    CALL READ_STRING

    LEA  SI, user1_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_match1

    LEA  SI, user2_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_match2

    LEA  SI, user3_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_match3

    LEA  SI, user4_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_match4

    LEA  SI, user5_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_match5


    MOV  AL, [reg_count]
    CMP  AL, 1
    JL   uli_fail
    LEA  SI, reg_u1_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_dmatch1

    CMP  AL, 2
    JL   uli_fail
    LEA  SI, reg_u2_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_dmatch2

    CMP  AL, 3
    JL   uli_fail
    LEA  SI, reg_u3_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_dmatch3

    CMP  AL, 4
    JL   uli_fail
    LEA  SI, reg_u4_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_dmatch4

    CMP  AL, 5
    JL   uli_fail
    LEA  SI, reg_u5_name
    LEA  DI, input_buf
    CALL STR_CMP
    JE   uli_dmatch5

    JMP  uli_fail

uli_dmatch1: LEA  SI, reg_u1_pass
             JMP  uli_check_pass
uli_dmatch2: LEA  SI, reg_u2_pass
             JMP  uli_check_pass
uli_dmatch3: LEA  SI, reg_u3_pass
             JMP  uli_check_pass
uli_dmatch4: LEA  SI, reg_u4_pass
             JMP  uli_check_pass
uli_dmatch5: LEA  SI, reg_u5_pass
             JMP  uli_check_pass

uli_match1:
    LEA  SI, user1_pass
    JMP  uli_check_pass
uli_match2:
    LEA  SI, user2_pass
    JMP  uli_check_pass
uli_match3:
    LEA  SI, user3_pass
    JMP  uli_check_pass
uli_match4:
    LEA  SI, user4_pass
    JMP  uli_check_pass
uli_match5:
    LEA  SI, user5_pass

uli_check_pass:
    LEA  DX, msg_pwd
    CALL PRINT_STR
    LEA  DI, input_buf
    MOV  BX, 79
    CALL READ_STRING
    LEA  DI, input_buf
    CALL STR_CMP
    JNE  uli_fail
    MOV  AL, 2
    MOV  [current_role], AL
    LEA  DX, msg_loginok
    CALL PRINT_STR
    JMP  uli_done

uli_fail:
    MOV  AL, 0
    MOV  [current_role], AL
    LEA  DX, msg_loginfail
    CALL PRINT_STR
uli_done:
    POP  DI
    POP  SI
    RET
USER_LOGIN ENDP

ADMIN_LOOP PROC
adl_top:
    LEA  DX, msg_adm_menu
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    CMP  AL, '1'
    JE   adl_add
    CMP  AL, '2'
    JE   adl_man
    CMP  AL, '3'
    JE   adl_view
    CMP  AL, '4'
    JE   adl_srch
    CMP  AL, '5'
    JE   adl_high
    CMP  AL, '6'
    JE   adl_out
    JMP  adl_top
adl_add:   CALL ADD_MOVIE
           JMP  adl_top
adl_man:   CALL MANAGE_MOVIES
           JMP  adl_top
adl_view:  CALL VIEW_MOVIES
           JMP  adl_top
adl_srch:  CALL SEARCH_MOVIE
           JMP  adl_top
adl_high:  CALL SHOW_HIGHEST
           JMP  adl_top
adl_out:
    MOV  AL, 0
    MOV  [current_role], AL
    LEA  DX, msg_logout
    CALL PRINT_STR
    RET
ADMIN_LOOP ENDP

USER_LOOP PROC
usl_top:
    LEA  DX, msg_usr_menu
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    CMP  AL, '1'
    JE   usl_view
    CMP  AL, '2'
    JE   usl_rate
    CMP  AL, '3'
    JE   usl_rev
    CMP  AL, '4'
    JE   usl_srch
    CMP  AL, '5'
    JE   usl_high
    CMP  AL, '6'
    JE   usl_out
    JMP  usl_top
usl_view:  CALL VIEW_MOVIES
           JMP  usl_top
usl_rate:  CALL RATE_MOVIE
           JMP  usl_top
usl_rev:   CALL ADD_REVIEW
           JMP  usl_top
usl_srch:  CALL SEARCH_MOVIE
           JMP  usl_top
usl_high:  CALL SHOW_HIGHEST
           JMP  usl_top
usl_out:
    MOV  AL, 0
    MOV  [current_role], AL
    LEA  DX, msg_logout
    CALL PRINT_STR
    RET
USER_LOOP ENDP

ADD_MOVIE PROC
    MOV  AL, [movie_count]
    CMP  AL, 10
    JL   am_ok
    LEA  DX, msg_dbfull
    CALL PRINT_STR
    RET
am_ok:
    LEA  DX, msg_addname
    CALL PRINT_STR
    LEA  DI, temp_buf
    MOV  BX, 29
    CALL READ_STRING
    MOV  AL, [temp_buf]
    CMP  AL, 0
    JE   am_inv
    LEA  DX, msg_addgenre
    CALL PRINT_STR
    LEA  DI, input_buf
    MOV  BX, 14
    CALL READ_STRING
    MOV  AL, [input_buf]
    CMP  AL, 0
    JE   am_inv
    MOV  AL, [movie_count]
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  DI, [entry_ptr]
    LEA  SI, temp_buf
    MOV  CX, 30
    CALL COPY_STR
    MOV  DI, [entry_ptr]
    ADD  DI, 30
    LEA  SI, input_buf
    MOV  CX, 15
    CALL COPY_STR
    MOV  AL, [movie_count]
    INC  AL
    MOV  [movie_count], AL
    LEA  DX, msg_added
    CALL PRINT_STR
    RET
am_inv:
    LEA  DX, msg_invalid
    CALL PRINT_STR
    RET
ADD_MOVIE ENDP

VIEW_MOVIES PROC
    MOV  AL, [movie_count]
    CMP  AL, 0
    JNE  vm_ok
    LEA  DX, msg_nomovies
    CALL PRINT_STR
    RET
vm_ok:
    PUSH CX
    LEA  DX, msg_listhdr
    CALL PRINT_STR
    MOV  CX, 0
vm_lp:
    MOV  AL, CL
    CMP  AL, [movie_count]
    JGE  vm_done
    LEA  DX, msg_sep
    CALL PRINT_STR
    LEA  DX, msg_numhash
    CALL PRINT_STR
    MOV  AL, CL
    INC  AL
    CALL PRINT_DIGIT
    CALL PRINT_NL
    MOV  AL, CL
    CALL CALC_ENTRY_PTR
    CALL PRINT_MOVIE
    INC  CX
    JMP  vm_lp
vm_done:
    POP  CX
    LEA  DX, msg_anykey
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    RET
VIEW_MOVIES ENDP

RATE_MOVIE PROC
    MOV  AL, [movie_count]
    CMP  AL, 0
    JNE  rm_ok
    LEA  DX, msg_nomovies
    CALL PRINT_STR
    RET
rm_ok:
    CALL LIST_NAMES
    CALL GET_VALID_IDX
    MOV  BL, [idx_valid]
    CMP  BL, 0
    JE   rm_ret
    MOV  [cur_movie], AL
    LEA  DX, msg_ratscore
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    SUB  AL, '0'
    CMP  AL, 1
    JL   rm_inv
    CMP  AL, 5
    JG   rm_inv
    MOV  [cur_rating], AL
    MOV  AL, [cur_movie]
    CALL CALC_ENTRY_PTR
    MOV  BX, [entry_ptr]
    MOV  AL, [BX + 45]
    INC  AL
    MOV  [BX + 45], AL
    MOV  AL, [cur_rating]
    MOV  AH, 0
    ADD  [BX + 46], AX
    LEA  DX, msg_ratok
    CALL PRINT_STR
    RET
rm_inv:
    LEA  DX, msg_invalid
    CALL PRINT_STR
rm_ret:
    RET
RATE_MOVIE ENDP

ADD_REVIEW PROC
    MOV  AL, [movie_count]
    CMP  AL, 0
    JNE  ar_ok
    LEA  DX, msg_nomovies
    CALL PRINT_STR
    RET
ar_ok:
    CALL LIST_NAMES
    CALL GET_VALID_IDX
    MOV  BL, [idx_valid]
    CMP  BL, 0
    JE   ar_ret
    MOV  [cur_movie], AL
    LEA  DX, msg_entrev
    CALL PRINT_STR
    LEA  DI, temp_buf
    MOV  BX, 39
    CALL READ_STRING
    MOV  AL, [cur_movie]
    CALL CALC_ENTRY_PTR
    MOV  BX, [entry_ptr]
    ADD  BX, 48
    MOV  CL, 0
ar_slp:
    CMP  CL, 3
    JGE  ar_full
    MOV  AL, [BX]
    CMP  AL, 0
    JE   ar_found
    ADD  BX, 40
    INC  CL
    JMP  ar_slp
ar_full:
    LEA  DX, msg_revfull
    CALL PRINT_STR
    RET
ar_found:
    MOV  DI, BX
    LEA  SI, temp_buf
    MOV  CX, 40
    CALL COPY_STR
    LEA  DX, msg_revsaved
    CALL PRINT_STR
ar_ret:
    RET
ADD_REVIEW ENDP

SEARCH_MOVIE PROC
    MOV  AL, [movie_count]
    CMP  AL, 0
    JNE  sm_ok
    LEA  DX, msg_nomovies
    CALL PRINT_STR
    RET
sm_ok:
    LEA  DX, msg_srchby
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    MOV  [search_type], AL

    LEA  DX, msg_srchtxt
    CALL PRINT_STR
    LEA  DI, temp_buf
    MOV  BX, 29
    CALL READ_STRING

    MOV  AL, 0
    MOV  [found_flag], AL
    PUSH CX
    MOV  CX, 0

sm_lp:
    MOV  AL, CL
    CMP  AL, [movie_count]
    JGE  sm_end

    CALL CALC_ENTRY_PTR

    MOV  BX, [entry_ptr]
    MOV  AL, [search_type]
    CMP  AL, '2'
    JNE  sm_do_search
    ADD  BX, 30

sm_do_search:
    LEA  DX, temp_buf
    CALL STR_CONTAINS
    CMP  AL, 1
    JNE  sm_next

    MOV  AL, [found_flag]
    CMP  AL, 0
    JNE  sm_not_first
    LEA  DX, msg_found
    CALL PRINT_STR
sm_not_first:
    MOV  AL, 1
    MOV  [found_flag], AL
    LEA  DX, msg_sep
    CALL PRINT_STR
    CALL PRINT_MOVIE

sm_next:
    INC  CX
    JMP  sm_lp

sm_end:
    POP  CX
    MOV  AL, [found_flag]
    CMP  AL, 0
    JNE  sm_ret
    LEA  DX, msg_notfound
    CALL PRINT_STR
sm_ret:
    RET
SEARCH_MOVIE ENDP

SHOW_HIGHEST PROC
    MOV  AL, [movie_count]
    CMP  AL, 0
    JNE  sh_ok
    LEA  DX, msg_norated
    CALL PRINT_STR
    RET
sh_ok:
    MOV  AL, 0
    MOV  [found_flag], AL
    MOV  AL, 0
    MOV  [best_avg], AL
    MOV  AL, 0
    MOV  [best_idx], AL
    MOV  AL, 0
    MOV  [sh_idx], AL
sh_lp:
    MOV  AL, [sh_idx]
    CMP  AL, [movie_count]
    JGE  sh_end
    CALL CALC_ENTRY_PTR
    MOV  BX, [entry_ptr]
    MOV  AL, [BX + 45]
    CMP  AL, 0
    JE   sh_next
    PUSH CX
    MOV  CL, AL
    MOV  AX, [BX + 46]
    MOV  AH, 0
    MOV  CH, 0
    DIV  CL
    POP  CX
    CMP  AL, [best_avg]
    JLE  sh_next
    MOV  [best_avg], AL
    MOV  AL, [sh_idx]
    MOV  [best_idx], AL
    MOV  AL, 1
    MOV  [found_flag], AL
sh_next:
    MOV  AL, [sh_idx]
    INC  AL
    MOV  [sh_idx], AL
    JMP  sh_lp
sh_end:
    MOV  AL, [found_flag]
    CMP  AL, 0
    JNE  sh_print
    LEA  DX, msg_norated
    CALL PRINT_STR
    RET
sh_print:
    LEA  DX, msg_highest
    CALL PRINT_STR
    MOV  AL, [best_idx]
    CALL CALC_ENTRY_PTR
    CALL PRINT_MOVIE
    RET
SHOW_HIGHEST ENDP

MANAGE_MOVIES PROC
    MOV  AL, [movie_count]
    CMP  AL, 0
    JNE  mm_ok
    LEA  DX, msg_nomovies
    CALL PRINT_STR
    RET
mm_ok:
    LEA  DX, msg_manage
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    CMP  AL, '1'
    JE   mm_edit
    CMP  AL, '2'
    JE   mm_del
    CMP  AL, '3'
    JE   mm_drev
    RET

mm_edit:
    CALL LIST_NAMES
    CALL GET_VALID_IDX
    MOV  BL, [idx_valid]
    CMP  BL, 0
    JE   mm_ret
    MOV  [cur_movie], AL
    MOV  AL, [cur_movie]
    CALL CALC_ENTRY_PTR
    LEA  DX, msg_newname
    CALL PRINT_STR
    LEA  DI, temp_buf
    MOV  BX, 29
    CALL READ_STRING
    MOV  AL, [temp_buf]
    CMP  AL, 0
    JE   mm_e_genre
    MOV  BX, [entry_ptr]
    MOV  DI, BX
    MOV  CX, 30
    CALL ZERO_MEM
    MOV  BX, [entry_ptr]
    MOV  DI, BX
    LEA  SI, temp_buf
    MOV  CX, 30
    CALL COPY_STR
mm_e_genre:
    LEA  DX, msg_newgenre
    CALL PRINT_STR
    LEA  DI, temp_buf
    MOV  BX, 14
    CALL READ_STRING
    MOV  AL, [temp_buf]
    CMP  AL, 0
    JE   mm_e_done
    MOV  BX, [entry_ptr]
    MOV  DI, BX
    ADD  DI, 30
    MOV  CX, 15
    CALL ZERO_MEM
    MOV  BX, [entry_ptr]
    MOV  DI, BX
    ADD  DI, 30
    LEA  SI, temp_buf
    MOV  CX, 15
    CALL COPY_STR
mm_e_done:
    LEA  DX, msg_editok
    CALL PRINT_STR
    RET

mm_del:
    CALL LIST_NAMES
    LEA  DX, msg_delwh
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    SUB  AL, '0'
    CMP  AL, 1
    JL   mm_inv
    CMP  AL, [movie_count]
    JG   mm_inv
    DEC  AL
    MOV  [cur_movie], AL
    MOV  AL, [cur_movie]
mm_dshift:
    MOV  AH, AL
    INC  AH
    CMP  AH, [movie_count]
    JGE  mm_dzero
    PUSH AX
    MOV  AL, AH
    CALL CALC_ENTRY_PTR
    MOV  SI, [entry_ptr]
    POP  AX
    PUSH AX
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
mm_dcpy:
    MOV  BL, [SI]
    MOV  [DI], BL
    INC  SI
    INC  DI
    DEC  CX
    JNE  mm_dcpy
    POP  AX
    INC  AL
    JMP  mm_dshift
mm_dzero:
    MOV  AL, [movie_count]
    DEC  AL
    CALL CALC_ENTRY_PTR
    MOV  DI, [entry_ptr]
    MOV  CX, 168
    CALL ZERO_MEM
    MOV  AL, [movie_count]
    DEC  AL
    MOV  [movie_count], AL
    LEA  DX, msg_delok
    CALL PRINT_STR
    RET

mm_drev:
    CALL LIST_NAMES
    CALL GET_VALID_IDX
    MOV  BL, [idx_valid]
    CMP  BL, 0
    JE   mm_ret
    MOV  [cur_movie], AL
    MOV  AL, [cur_movie]
    CALL CALC_ENTRY_PTR
    MOV  BX, [entry_ptr]
    ADD  BX, 48
    MOV  CL, 0
mm_srloop:
    CMP  CL, 3
    JGE  mm_srend
    MOV  AL, CL
    INC  AL
    CALL PRINT_DIGIT
    MOV  AL, '.'
    CALL PRINT_CHAR
    MOV  AL, ' '
    CALL PRINT_CHAR
    MOV  AL, [BX]
    CMP  AL, 0
    JE   mm_srempty
    PUSH BX
    CALL PRINT_ZSTR
    CALL PRINT_NL
    POP  BX
    JMP  mm_srnx
mm_srempty:
    LEA  DX, msg_norev
    CALL PRINT_STR
mm_srnx:
    ADD  BX, 40
    INC  CL
    JMP  mm_srloop
mm_srend:
    LEA  DX, msg_delrevno
    CALL PRINT_STR
    CALL GET_CHAR
    CALL PRINT_NL
    SUB  AL, '0'
    CMP  AL, 1
    JL   mm_inv
    CMP  AL, 3
    JG   mm_inv
    DEC  AL
    MOV  AH, 0
    MOV  CX, 40
    MUL  CX
    MOV  BX, [entry_ptr]
    ADD  BX, 48
    ADD  BX, AX
    MOV  DI, BX
    MOV  CX, 40
    CALL ZERO_MEM
    LEA  DX, msg_delrevok
    CALL PRINT_STR
    RET

mm_inv:
    LEA  DX, msg_invalid
    CALL PRINT_STR
mm_ret:
    RET
MANAGE_MOVIES ENDP















REGISTER_USER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH SI
    PUSH DI

    LEA  DX, msg_reg_hdr
    CALL PRINT_STR


    MOV  AL, [reg_count]
    CMP  AL, 5
    JL   ru_slots_ok
    LEA  DX, msg_reg_full
    CALL PRINT_STR
    JMP  ru_done

ru_slots_ok:

    LEA  DX, msg_reg_unm
    CALL PRINT_STR
    LEA  DI, temp_buf
    MOV  BX, 19
    CALL READ_STRING


    LEA  SI, temp_buf
    MOV  CX, 0
ru_len_lp:
    MOV  AL, [SI]
    CMP  AL, 0
    JE   ru_len_done
    INC  SI
    INC  CX
    JMP  ru_len_lp
ru_len_done:
    CMP  CX, 3
    JGE  ru_len_ok
    LEA  DX, msg_reg_sht
    CALL PRINT_STR
    JMP  ru_done
ru_len_ok:


    LEA  SI, admin_user
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    LEA  SI, user1_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    LEA  SI, user2_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    LEA  SI, user3_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    LEA  SI, user4_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    LEA  SI, user5_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup


    MOV  AL, [reg_count]
    CMP  AL, 1
    JL   ru_dup_done
    LEA  SI, reg_u1_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    CMP  AL, 2
    JL   ru_dup_done
    LEA  SI, reg_u2_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    CMP  AL, 3
    JL   ru_dup_done
    LEA  SI, reg_u3_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    CMP  AL, 4
    JL   ru_dup_done
    LEA  SI, reg_u4_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

    CMP  AL, 5
    JL   ru_dup_done
    LEA  SI, reg_u5_name
    LEA  DI, temp_buf
    CALL STR_CMP
    JE   ru_dup

ru_dup_done:


    LEA  DX, msg_reg_pwd
    CALL PRINT_STR
    LEA  DI, input_buf
    MOV  BX, 19
    CALL READ_STRING


    LEA  SI, input_buf
    MOV  CX, 0
ru_plen_lp:
    MOV  AL, [SI]
    CMP  AL, 0
    JE   ru_plen_done
    INC  SI
    INC  CX
    JMP  ru_plen_lp
ru_plen_done:
    CMP  CX, 3
    JGE  ru_plen_ok
    LEA  DX, msg_reg_sht
    CALL PRINT_STR
    JMP  ru_done
ru_plen_ok:




    LEA  DX, msg_reg_cnf
    CALL PRINT_STR
    LEA  DI, temp_buf
    ADD  DI, 40
    MOV  BX, 19
    CALL READ_STRING


    LEA  SI, input_buf
    LEA  DI, temp_buf
    ADD  DI, 40
    CALL STR_CMP
    JE   ru_pass_ok
    LEA  DX, msg_reg_mism
    CALL PRINT_STR
    JMP  ru_done

ru_pass_ok:



    MOV  AL, [reg_count]
    CMP  AL, 0
    JE   ru_write1
    CMP  AL, 1
    JE   ru_write2
    CMP  AL, 2
    JE   ru_write3
    CMP  AL, 3
    JE   ru_write4
    JMP  ru_write5

ru_write1:
    LEA  DI, reg_u1_name
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u1_name
    LEA  SI, temp_buf
    MOV  CX, 20
    CALL COPY_STR
    LEA  DI, reg_u1_pass
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u1_pass
    LEA  SI, input_buf
    MOV  CX, 20
    CALL COPY_STR
    JMP  ru_written

ru_write2:
    LEA  DI, reg_u2_name
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u2_name
    LEA  SI, temp_buf
    MOV  CX, 20
    CALL COPY_STR
    LEA  DI, reg_u2_pass
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u2_pass
    LEA  SI, input_buf
    MOV  CX, 20
    CALL COPY_STR
    JMP  ru_written

ru_write3:
    LEA  DI, reg_u3_name
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u3_name
    LEA  SI, temp_buf
    MOV  CX, 20
    CALL COPY_STR
    LEA  DI, reg_u3_pass
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u3_pass
    LEA  SI, input_buf
    MOV  CX, 20
    CALL COPY_STR
    JMP  ru_written

ru_write4:
    LEA  DI, reg_u4_name
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u4_name
    LEA  SI, temp_buf
    MOV  CX, 20
    CALL COPY_STR
    LEA  DI, reg_u4_pass
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u4_pass
    LEA  SI, input_buf
    MOV  CX, 20
    CALL COPY_STR
    JMP  ru_written

ru_write5:
    LEA  DI, reg_u5_name
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u5_name
    LEA  SI, temp_buf
    MOV  CX, 20
    CALL COPY_STR
    LEA  DI, reg_u5_pass
    MOV  CX, 20
    CALL ZERO_MEM
    LEA  DI, reg_u5_pass
    LEA  SI, input_buf
    MOV  CX, 20
    CALL COPY_STR

ru_written:

    MOV  AL, [reg_count]
    INC  AL
    MOV  [reg_count], AL
    LEA  DX, msg_reg_ok
    CALL PRINT_STR
    JMP  ru_done

ru_dup:
    LEA  DX, msg_reg_dup
    CALL PRINT_STR

ru_done:
    POP  DI
    POP  SI
    POP  CX
    POP  BX
    POP  AX
    RET
REGISTER_USER ENDP

END MAIN