#[test_only]
module dex::usdc_tests{
    use dex::usdc;

    const ENotImplemented: u64 = 0;

    #[test]
    public fun init_for_testing(ctx: &mut TxContext){
        usdc::init(USDC {}, ctx)
    }

    #[test, expected_failure(abort_code = ::dex::eth_tests::ENotImplemented)]
    fun test_dex_fail() {
        abort ENotImplemented
    }
}



