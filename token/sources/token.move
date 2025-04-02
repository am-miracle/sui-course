/*
/// Module: token
module token::token;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module token::parley {
    use sui::coin;
    use sui::url;

    public struct PARLEY has drop{}


    fun init(witness: PARLEY, ctx: &mut TxContext){
        let (treasury, metadata) = coin::create_currency(
            witness,
            9,
            b"PAR",
            b"Parley",
            b"Parley token for the Parley game",
            option::some(url::new_unsafe_from_bytes(b"https://silver-blushing-woodpecker-143.mypinata.cloud/ipfs/Qmed2qynTAszs9SiZZpf58QeXcNcYgPnu6XzkD4oeLacU4")),
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(treasury: &mut coin::TreasuryCap<PARLEY>, amount: u64, recipient: address ,ctx: &mut TxContext){
        coin::mint_and_transfer(treasury, amount, recipient, ctx);
    }
}