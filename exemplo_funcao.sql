create or replace function teste()
returns integer as $total$
declare
	total integer;

begin
	select count(*) into total from ep2.usuario;
	return total;
end;
$total$ LANGUAGE plpgsql;

create function soma(ax integer, bx integer) 
returns integer as $total$
begin
	return ax + bx;
end;
$total$ language plpgsql;

select soma(1, 2);
