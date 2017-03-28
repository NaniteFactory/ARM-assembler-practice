		AREA main, CODE, READWRITE	; ���� ������ �ڵ� ���� main 
		ENTRY						; ENTRY~END

start	MOV r0, #1					; int i = 1; r0�� �ݺ����� ����� �ε��� ������ �մϴ�.
		ADR r7, array1				; r7�� �迭�� �ּҸ� ����ϴ�.
		MOV r6, #2					; r6�� 2�� ������ ���� ��� 2�� ����ϴ�. 
		
;���� �Ҵ��ϱ�
loop1	CMP r0, #101				; while (i<101) {
		MOVGE r0, #1				; (����) ���� ������ ���� �������͸� �ʱ�ȭ�� �ݴϴ�.
		BGE loop2					; (����) ���� ������ �Ѿ�ϴ�.

		STR r0, [r7, r0, LSL #2]	; array1[i] = i; (�迭�ǽ����ּ�+�ε���*4����Ʈ)�� �ε��� ���� �����մϴ�.

		ADD r0, r0, #1				; i++;
		B loop1						; }

;2�� ���ϱ�
loop2	CMP r0, #101				; while (i<101) {
		MOVGE r0, #1				; (����) ���� ������ ���� �������͸� �ʱ�ȭ�� �ݴϴ�.
		MOVGE r2, #0				; (����) ���� ������ ���� �������͸� �ʱ�ȭ�� �ݴϴ�.
		BGE loop3					; (����) ���� ������ �Ѿ�ϴ�.
		
		LDR r1, [r7, r0, LSL #2]	; r1 = array[i];
		MUL r2, r1, r6				; r2 = r1 * 2; 
		STR r2, [r7, r0, LSL #2]	; array[i] = r2;

		ADD r0, r0, #1				; i++;
		B loop2						; }

;�հ踦 ����		
loop3	CMP r0, #101				; while (i<101) {
		BGE fin						; (����) �� ������ �ǳʶݴϴ�.
		
		LDR r1, [r7, r0, LSL #2]	; r1 = array[i];
		ADD r2, r2, r1				; r2 += r1;

		ADD r0, r0, #1				; i++;
		B loop3						; }

;��� ǥ��
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