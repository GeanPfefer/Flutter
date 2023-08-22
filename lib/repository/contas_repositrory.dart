import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    await Future.delayed(Duration(seconds: 5)); // Simulação de carregamento
    return [
      Conta(
        id: '1',
        bancoId: 'bb',
        descricao: 'Conta Corrente',
        tipoConta: TipoConta.contaCorrente,
      ),
      Conta(
        id: '2',
        bancoId: 'nubank',
        descricao: 'Conta Digital',
        tipoConta: TipoConta.contaCorrente,
      ),
      Conta(
        id: '1',
        bancoId: 'caixa',
        descricao: 'Conta Pupança',
        tipoConta: TipoConta.contaPoupanca,
      ),
      Conta(
        id: '1',
        bancoId: 'c6bank',
        descricao: 'Conta Investimento',
        tipoConta: TipoConta.contaInvestimento,
      )
    ];
  }
}
