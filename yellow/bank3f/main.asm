SECTION "bank3f",ROMX,BANK[$3f]

INCLUDE "yellow/bank3f/data/map_songs.asm"
INCLUDE "yellow/bank3f/data/map_header_pointers.asm"
INCLUDE "yellow/bank3f/data/map_header_banks.asm"

Func_fc4dd:: ; fc4dd (3f:44dd)
; possibly to test if pika should be out?
	ld a,[wd430]
	bit 5,a
	jr nz,.asm_fc4f8 ; 3f:44f8
	ld a,[wd430]
	bit 7,a
	jr nz,.asm_fc4f8
	call Func_fcdb8
	jr nc,.asm_fc4f8
	ld a,[wWalkBikeSurfState]
	and a
	jr nz,.asm_fc4f8
	scf
	ret
.asm_fc4f8
	and a
	ret
	
Func_fc5fa:: ; fc5fa (3f:44fa)
	ld hl,wd430
	bit 4,[hl]
	res 4,[hl]
	jr nz,.asm_fc515
	call Func_1542
	call Func_fc523
	ld a,$ff
	ld [wSpriteStateData1 + $f2],a
	call Func_fcb84
	call Func_fc5bc
	ret
	
.asm_fc515
	call Func_fc53f
	xor a
	ld [wd431],a
	ld a,[wSpriteStateData1 + $9]
	ld [wSpriteStateData1 + $f9],a
	ret
	
Func_fc523:: ; fc523 (3f:4523)
	ld hl,wSpriteStateData1 + $f0
	call Func_fc52c
	ld hl,wSpriteStateData2 + $f0
Func_fc52c:: ; fc52c (3f:4523)
	ld bc,$10
	xor a
	call FillMemory
	ret

Func_fc534:: ; fc534 (3f:4534)
	call Func_fc53f
	call Func_fc5bc
	xor a
	ld [wd431],a
	ret
	
Func_fc53f:: ; fc53f (3f:453f)
	ld bc,wSpriteStateData1 + $10
	ld a,[W_YCOORD]
	add $4
	ld e,a
	ld a,[W_XCOORD]
	add $4
	ld d,a
	ld a,[wd431]
	and a
	jr z,.asm_fc5aa
	cp $1
	jr z,.asm_fc59e
	cp $2
	jr z,.asm_fc584
	cp $3
	jr z,.asm_fc5aa
	cp $4
	jr z,.asm_fc5a4
	cp $5
	jr z,.asm_fc5a7
	cp $6
	jr z,.asm_fc5a1
	cp $7
	jr z,.asm_fc572
	jr .asm_fc59e
	
.asm_fc572
	ld a,[wSpriteStateData1 + $9]
	and a ; SPRITE_FACING_DOWN
	jr z,.asm_fc5a4
	cp SPRITE_FACING_UP 
	jr z,.asm_fc5a7
	cp SPRITE_FACING_LEFT
	jr z,.asm_fc5a1
	cp SPRITE_FACING_RIGHT
	jr z,.asm_fc59e
.asm_fc584
	ld a,[wSpriteStateData1 + $9]
	and a
	jr nz,.asm_fc58d
	dec e
	jr .asm_fc5aa
.asm_fc58d
	cp SPRITE_FACING_UP
	jr nz,.asm_fc594
	inc e
	jr .asm_fc5aa
.asm_fc594
	cp SPRITE_FACING_LEFT
	jr nz,.asm_fc59b
	inc d
	jr .asm_fc5aa
.asm_fc59b
	dec d
	jr .asm_fc5aa
.asm_fc59e
	inc d
	jr .asm_fc5aa
.asm_fc5a1
	dec d
	jr .asm_fc5aa
.asm_fc5a4
	inc e
	jr .asm_fc5aa
.asm_fc5a7
	dec e
	jr .asm_fc5aa ; useless jr
.asm_fc5aa
	ld hl,$104
	add hl,bc
	ld [hl],e
	inc hl
	ld [hl],d
	inc hl
	ld [hl],$ff
	push hl
	ld hl,wd472
	set 5,[hl]
	pop hl
	ret
	
Func_fc65b:: ; fc65b (3f:465b)

Func_fc69a:: ; fc69a (3f:469a)

Func_fcc08:: ; fcc08 (3f:4c08)

Func_fcf0c:: ; fcf0c (3f:4f0c)