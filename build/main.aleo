program dice_roll_alexb.aleo;



mapping random_number_map:
	key as address.public;
	value as u32.public;


function roll:
    async roll self.caller into r0;
    output r0 as dice_roll_alexb.aleo/roll.future;

finalize roll:
    input r0 as address.public;
    rand.chacha into r1 as u32;
    rem r1 7u32 into r2;
    set r2 into random_number_map[r0];

