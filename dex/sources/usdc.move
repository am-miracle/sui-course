module dex::usdc {
    use sui::coin;
    use sui::url;

    public struct USDC has drop{}

    fun init(witness: USDC, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"USDC",
            b"USD Coin",
            b"USD Coin for the dex swap",
            option::some(url::new_unsafe_from_bytes(b"https://s3.coinmarketcap.com/static-gravity/image/5a8229787b5e4c809b5914eef709b59a.png")), // An image of the Coin
            ctx
        );
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_share_object(metadata);
    }
}