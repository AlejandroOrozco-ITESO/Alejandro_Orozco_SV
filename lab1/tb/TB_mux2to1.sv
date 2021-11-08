`timescale 10ps/1ps //`timescale <reference_time_unit>/<time_precision>
// Testbench del multiplexor 2x16
module TB_mux2x1();
    parameter DW= 4;
// Inputs
    logic [DW-1:0] d;
    logic [DW-1:0] d2;
    logic  sel;
    integer s_gold, Num_errors;
	 integer i, j, k; // i, j, k representan los operandos
// OutputS
    logic  [DW-1:0] q;
// Instanciacion del DUT
    mux_2to1 UUT (.sel(sel),.d(d),.d2(d2),.q(q));

// Inicializaci�n de las entradas
    `ifdef auto_init
        initial begin
            i = 0; j = 0;k = 0;
	    sel=i; d=j; d2=k;
				#1;
        end
    `endif

initial Num_errors = 0;

initial begin
for (i = 0; i <= 1; i = i + 1) begin
for (j = 0; j <= 15; j = j + 1)begin
for (k = 0; k <= 15; k = k + 1)begin
	sel=i; d=j; d2=k;
	if (i==1) s_gold= j;
	else s_gold=k;

	#1 if (q ^ s_gold) begin  // Observe el tiempo de espera
	Num_errors = Num_errors + 1;
	$display ("Error: select = %b", i);
	$display ("Error: d = %d   d2 = %d  sel = %b", j, k, i);
	$display ("Error: Valor Esperado = %h  Valor obtenido = %h", s_gold, q);
	end
end
end
end
	$display ("Num_errors = %d", Num_errors);
end	  // end el initial begin
endmodule

