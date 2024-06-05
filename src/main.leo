program dice_roll_alexb.aleo {

    mapping random_number_map: address=>u32;


    async transition roll() -> (Future) {

        return finalize_roll(self.caller);
    }
    async function finalize_roll(caller: address) {
    let random_number: u32 = ChaCha::rand_u32();
    let random_number_mod7: u32 = random_number % 7u32; // 0 to 6
    Mapping::set(random_number_map, caller, random_number_mod7);

    }


}

