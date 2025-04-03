
#[test_only]
module dex::dex_tests{
    use dex::dex;
    
    const ENotImplemented: u64 = 0;


    #[test, expected_failure(abort_code = ::dex::dex_tests::ENotImplemented)]
    fun test_dex_fail() {
        abort ENotImplemented
    }


    public fun init_for_testing(ctx: &mut TxContext) {
        dex::init( DEX {}, ctx);
    }
}

