		AREA main, CODE, READWRITE	; 쓰기 가능한 코드 섹션 main 
		ENTRY						; ENTRY~END

start	MOV r0, #1					; int i = 1; r0를 반복문에 사용할 인덱스 변수로 합니다.
		ADR r7, array1				; r7은 배열의 주소를 담습니다.
		MOV r6, #2					; r6은 2배 곱셈에 쓰일 상수 2를 담습니다. 
		
;값을 할당하기
loop1	CMP r0, #101				; while (i<101) {
		MOVGE r0, #1				; (종료) 다음 루프에 쓰일 레지스터를 초기화해 줍니다.
		BGE loop2					; (종료) 다음 루프로 넘어갑니다.

		STR r0, [r7, r0, LSL #2]	; array1[i] = i; (배열의시작주소+인덱스*4바이트)에 인덱스 값을 저장합니다.

		ADD r0, r0, #1				; i++;
		B loop1						; }

;2를 곱하기
loop2	CMP r0, #101				; while (i<101) {
		MOVGE r0, #1				; (종료) 다음 루프에 쓰일 레지스터를 초기화해 줍니다.
		MOVGE r2, #0				; (종료) 다음 루프에 쓰일 레지스터를 초기화해 줍니다.
		BGE loop3					; (종료) 다음 루프로 넘어갑니다.
		
		LDR r1, [r7, r0, LSL #2]	; r1 = array[i];
		MUL r2, r1, r6				; r2 = r1 * 2; 
		STR r2, [r7, r0, LSL #2]	; array[i] = r2;

		ADD r0, r0, #1				; i++;
		B loop2						; }

;합계를 내기		
loop3	CMP r0, #101				; while (i<101) {
		BGE fin						; (종료) 이 루프를 건너뜁니다.
		
		LDR r1, [r7, r0, LSL #2]	; r1 = array[i];
		ADD r2, r2, r1				; r2 += r1;

		ADD r0, r0, #1				; i++;
		B loop3						; }

;결과 표시
fin		MOV r0, r2					
		MOV r1, r2
		MOV r3, r2
		MOV r4, r2
		MOV r5, r2
		MOV r6, r2
		MOV r7, r2
		MOV r8, r2
		MOV r9, r2
		
stop	MOV r0, #0x18				; return;
		LDR r1, =0x20026
		SWI 0x123456	
		
array1	

		END							; ENTRY~END