module dex::eth {
    use sui::coin;
    use sui::url;

    public struct ETH has drop {}

    fun init(witness: ETH, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency(
            witness,
            9,
            b"ETH",
            b"ETH token",
            b"Ethereum token for the dex swap",
            option::some(url::new_unsafe_from_bytes(b"https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png")),
            ctx
        );
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_share_object(metadata);
    }
}