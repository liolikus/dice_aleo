program dice_roll.aleo;

mapping account:
	key as address.public;
	value as u64.public;

mapping random_number_map:
	key as address.public;
	value as u32.public;

function roll:
    input r0 as address.public;
    async roll self.caller into r1;
    output r1 as dice_roll.aleo/roll.future;

finalize roll:
    input r0 as address.public;
    rand.chacha into r1 as u32;
    rem r1 7u32 into r2;
    set r2 into random_number_map[r0];
