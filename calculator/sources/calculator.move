/*
/// Module: calculator
module calculator::calculator;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module calculator::calculator {
    public struct CalculatorObject has key{
        id: UID,
        result: u64,
    }

    public entry fun create(ctx: &mut TxContext){
        let object = CalculatorObject{
            id: object::new(ctx),
            result: 0
        };
        transfer::transfer(object, tx_context::sender(ctx));
    }


    public entry fun add(calc: &mut CalculatorObject, num1: u64, num2: u64) {
        let result = num1 + num2;
        calc.result = result;
    }

    public entry fun subtract(calc: &mut CalculatorObject, num1: u64, num2: u64) {
        let result = num1 - num2;
        calc.result = result;
    }

    public entry fun div(calc: &mut CalculatorObject, num1: u64, num2: u64) {
        let result = num1 / num2;
        calc.result = result;
    }

    public entry fun multiply(calc: &mut CalculatorObject, num1: u64, num2: u64) {
        let result = num1 * num2;
        calc.result = result;
    }
}