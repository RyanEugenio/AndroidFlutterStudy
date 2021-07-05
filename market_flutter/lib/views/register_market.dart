import 'package:flutter/material.dart';
import 'package:market_flutter/model/model.dart';
import 'package:market_flutter/repository/repository.dart';
import 'package:market_flutter/views/views.dart';

class RegisterMarket extends StatefulWidget {

  final Market? market;

  RegisterMarket({this.market});

  @override
  _RegisterMarketState createState() => _RegisterMarketState();
}

class _RegisterMarketState extends State<RegisterMarket> {

  final MarketRepository _repository = MarketRepository();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameProductController = new TextEditingController();
  TextEditingController _valueProductController = new TextEditingController();
  TextEditingController _quantityProductController = new TextEditingController();
  String dropdownValue = 'Açougue e Peixaria';

  bool _isUpdate = false;

  _rowIcon() {
    return Icon(Icons.all_inbox_outlined, size: 150, color: Colors.black45,);
  }

  _rowName() {
    return new TextFormField(
      controller: _nameProductController,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(hintText: "Nome do Produto"),
      maxLength: 50,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Digite um nome válido!';
        }
        return null;
      },
    );
  }

  _rowValue() {
    return new TextFormField(
      controller: _valueProductController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Valor",
      ),
      maxLength: 20,
    );
  }

  _rowQuantity() {
    return new TextFormField(
      controller: _quantityProductController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Quantidade",
      ),
      maxLength: 10,
    );
  }

  _rowCategory() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Açougue e Peixaria', 'Bebidas', 'Frutas', 'Higiene',
        'Latícinios e Ovos', 'Mercearia', 'Verduras e Legumes']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetFields();
      },
      style: TextButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(20.0),
          backgroundColor: Theme.of(context).primaryColor
      ),
      label: Text(_isUpdate ? 'Alterar produto' : 'Cadastrar produto'),
      icon: Icon(Icons.add),
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowIcon(),
        _rowName(),
        _rowValue(),
        _rowQuantity(),
        _rowCategory(),
        _rowButton(context),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.market != null) {
      _nameProductController.text = widget.market!.nameProduct.toString();
      _valueProductController.text = widget.market!.valueProduct.toString();
      _quantityProductController.text = widget.market!.quantityProduct.toString();
      dropdownValue = widget.market!.categoryProduct.toString();
      _isUpdate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_isUpdate ? 'Alterar produto' : 'Cadastro de produtos'),),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Form(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: _formUI(context),
                            )
                        ),
                      ],
                    )
                ),
              ],
            ),
        )
    );
  }

  _register(BuildContext context) {
    print('Validou o formulário: ${_formKey.currentState!.validate()}');

    if(_formKey.currentState!.validate()) {

      if(_isUpdate) {
        //alterar

        //buscar as alterações, caso haja.
        widget.market?.nameProduct = _nameProductController.text;
        widget.market?.valueProduct = _valueProductController.text;
        widget.market?.quantityProduct = _quantityProductController.text;
        widget.market?.categoryProduct = dropdownValue;
        print('passou antes do update');
        this._repository.update(widget.market!);
        print('passou depois do update');
        _showSnackBar('Contato alterado com sucesso :-)');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ListChangeAndDelete())
        );
      } else {
        //falta codigo
        final market = Market(
            nameProduct: _nameProductController.text,
            valueProduct: _valueProductController.text,
            quantityProduct: _quantityProductController.text,
            categoryProduct: dropdownValue,
        );

        this._repository.save(market);

        _showSnackBar('Produto cadastrado com sucesso :-)');
      }
      //para atualizar na tela...
      setState(() {
        if (_isUpdate == false) {
          var _screenPageRoute;
        switch (dropdownValue) {
          case 'Frutas':
            _screenPageRoute = ListFruit();
            break;
          case 'Bebidas':
            _screenPageRoute = ListDrink();
            break;
          case 'Açougue e Peixaria':
            _screenPageRoute = ListButcherAndFishmonger();
            break;
          case 'Higiene':
            _screenPageRoute = ListHygiene();
            break;
          case 'Latícinios e Ovos':
            _screenPageRoute = ListDairyAndEggs();
            break;
          case 'Mercearia':
            _screenPageRoute = ListGrocery();
            break;
          case 'Verduras e Legumes':
            _screenPageRoute = ListVegetablesAndLegumes();
            break;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => _screenPageRoute
            )
        );
        }
      });
    } else {
      print('Digite os campos corretamente :-/');
      _showSnackBar('Digite os campos corretamente :-/');
    }
  }

  //Método com arrow function
  _resetFields() => _formKey.currentState!.reset();

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message, ),)
    );
  }
}
