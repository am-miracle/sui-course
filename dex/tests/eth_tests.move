#[test_only]
module dex::eth_tests{
    use dex::eth;

    const ENotImplemented: u64 = 0;

    #[test]
    public fun init_for_testing(ctx: &mut TxContext){
        eth::init(ETH {}, ctx)
    }

    #[test, expected_failure(abort_code = ::dex::eth_tests::ENotImplemented)]
    fun test_dex_fail() {
        abort ENotImplemented
    }
}



