----------------------
---- bindump (body) --
----------------------
--
with ada.text_io;
with ada.sequential_io;
with interfaces;	use interfaces;
with ada.command_line;	use ada.command_line;
with binary;	use binary;
with gnat.os_lib;
with ada.environment_variables;
use ada;

procedure bindump is

	package tio renames text_io;

	subtype column_type is positive range 1 .. 100;

	function narg return positive is
	begin
		return positive'value(argument(2));
	exception
		when constraint_error =>
			begin
				return positive'value(environment_variables.value("COLUMNS"));
			exception
				when constraint_error =>
					begin
						return positive'value(gnat.os_lib.getenv("COLUMNS").all);
					exception
					 	when others =>
					 		return 80;
					end;
			end;
	end narg;

	--todo something like
	--type block_type is mod 2**alignarg;
	subtype block_type is unsigned_32;

	package seqio is new sequential_io(block_type);
	use seqio;

	package u32io is new text_io.modular_io(unsigned_32);

	fd : file_type;

	file_name  : constant string   := argument(1);

	term_ncol  : constant positive := narg;

begin

	open(fd, in_file, file_name);
	declare
		blk   : block_type;
		rblk  : block_type    := 0;
		nrep  : natural       := 0;
		lmono : boolean       := false;
		col   : column_type   := (term_ncol-30)/block_type'size;
		cols  : array (column_type'first .. col) of block_type;
		i_blk : unsigned_32   := 0;
	begin

		loop

			lmono := true;

			for i in column_type'first .. col 
			loop

				read(fd, blk);
				cols(i) := blk;

				if rblk /= blk then
					lmono := false;
				end if;

				rblk := blk;

			end loop;

			if lmono then
				nrep := nrep+1;
			else
				if nrep > 1 then
					tio.put_line("             x " & nrep'img);
				end if;
				nrep := 0;
			end if;

			if nrep < 2 then

				if nrep = 1 then 
					tio.put("+");
				else
					tio.put(" ");
				end if;

				u32io.put(
					item  => i_blk,
					width => 11,
					base  => 16);

				for b in cols'range
				loop
					tio.put(" " & bitfield_image(cols(b))); 
				end loop;
				tio.new_line;

			end if;

			i_blk := i_blk+unsigned_32(col);

		end loop;

	exception
		when end_error =>
			tio.new_line;
			close(fd);
	end;
end bindump;




