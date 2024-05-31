program dice_roll.aleo {

    mapping account: address => u64;
    mapping random_number_map: address=>u32;


  transition roll(public player: address){
    return then finalize(self.caller);
  }
  finalize roll(public player: address) {
    let random_number: u32 = ChaCha::rand_u32();
    let random_number_mod37: u32 = random_number % 7u32; // 0 to 6
    Mapping::set(random_number_map, player, random_number_mod37);
  }

}

