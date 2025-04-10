require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  test "check dynamic fields" do
    visit store_index_url

    click_on 'Adicionar ao Carrinho', match: :first

    click_on 'Finalizar'

    assert has_no_field? 'Número de roteamento bancário'
    assert has_no_field? 'Número da conta'
    assert has_no_field? 'Número do cartão de crédito'
    assert has_no_field? 'Data de validade'
    assert has_no_field? 'Número do pedido de compra'

    select 'Cheque', from: 'Forma de pagamento'

    assert has_field? 'Número de roteamento bancário'
    assert has_field? 'Número da conta'
    assert has_no_field? 'Número do cartão de crédito'
    assert has_no_field? 'Data de validade'
    assert has_no_field? 'Número do pedido de compra'

    select 'Cartão de Credito', from: 'Forma de pagamento'

    assert has_no_field? 'Número de roteamento bancário'
    assert has_no_field? 'Número da conta'
    assert has_field? 'Número do cartão de crédito'
    assert has_field? 'Data de validade'
    assert has_no_field? 'Número do pedido de compra'

    select 'Pedido de compra', from: 'Forma de pagamento'

    assert has_no_field? 'Número de roteamento bancário'
    assert has_no_field? 'Número da conta'
    assert has_no_field? 'Número do cartão de crédito'
    assert has_no_field? 'Data de validade'
    assert has_field? 'Número do pedido de compra'
  end
end
