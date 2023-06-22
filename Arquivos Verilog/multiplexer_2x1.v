/*                      --------MULTIPLEXADOR 2x1--------*/

/*  BASE LITERARIA: Ronald J. Tocci, Neal S. Widmer, Gregory L. Moss. “Sistemas digitais : princípios e aplicações”; revisão técnica Renato Giacomini ; tradução Jorge Ritter. – 11ª edição – São Paulo : Pearson Prentice Hall, 2011;
 */

module multiplexer_2x1(out, l0, l1, s); // RECEBER 2 ENTRADAS (l0 e l1)  E DEPENDENDO DO VALOR DO SELETOR "S" SELECIONAR UMA DAS DUAS ENTRADAS;
   
    input l0, l1, s;  
    output out;
   
    wire w_and1, w_and2, not_s;
   
    not INVERSAO_DO_VALOR_DO_SELETOR(not_s, s);
   
    and LIBERAR_O_VALOR_DE_L0(w_and1, l0, not_s); // LIBERAR O VALOR DE "L0", CAS0 "S" TENHA SINAL BAIXO;
    and LIBERAR_O_VALOR_DE_L1(w_and2, l1, s); // LIBERAR O VALOR DE "L1", CASO "S" TENHA SINAL ALTO;
   
    or JUNTAR_OS_DOIS_RESULTADOS_DAS_ANDs(out, w_and1, w_and2); // SINAL SELECIONADO;
endmodule 