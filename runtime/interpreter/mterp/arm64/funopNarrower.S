%default {"srcreg":"s0", "tgtreg":"d0"}
    /*
     * Generic 64bit-to-32bit floating point unary operation.  Provide an
     * "instr" line that specifies an instruction that performs "$tgtreg = op $srcreg".
     *
     * For: int-to-double, float-to-double, float-to-long
     */
    /* unop vA, vB */
    lsr     w3, wINST, #12              // w3<- B
    ubfx    w4, wINST, #8, #4           // w4<- A
    GET_VREG_WIDE $srcreg, w3
    FETCH_ADVANCE_INST 1                // advance rPC, load wINST
    $instr                              // d0<- op
    GET_INST_OPCODE ip                  // extract opcode from wINST
    SET_VREG $tgtreg, w4                // vA<- d0
    GOTO_OPCODE ip                      // jump to next instruction
