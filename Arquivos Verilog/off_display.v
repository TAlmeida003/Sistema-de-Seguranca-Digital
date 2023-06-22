/*      */
module off_display(e1, e2, s1, s2, s3);
   
    input e1, e2;
    output s1, s2, s3;

    and DESLIGAR_DIGITO_1(s1, e1, e2);
    and DESLIGAR_DIGITO_2(s2, e1, e2);
    and DESLIGAR_DIGITO_3(s3, e1, e2);

endmodule 