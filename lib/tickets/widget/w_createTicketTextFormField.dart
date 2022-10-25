import 'package:flutter/material.dart';

import '../../util/size_config.dart';

class CreateTicketTextFormField extends StatefulWidget {
  final TextEditingController usuario;
  final TextEditingController estatus;
  final TextEditingController descripcion;

  const CreateTicketTextFormField({
    Key? key,
    required this.usuario,
    required this.estatus,
    required this.descripcion,
  }) : super(key: key);

  _CreateTicketTextFormFieldState createState() =>  _CreateTicketTextFormFieldState();
}

const List<String> list = <String>['Cerrado', 'Abierto'];

class _CreateTicketTextFormFieldState  extends State<CreateTicketTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Usuario"),
        const SizedBox(height: 8),
        SizedBox(
          width: SizeConfig.screenWidth! * 90,
          child: TextFormField(
            controller: widget.usuario,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Este campo es requerido';
            },
            style: TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),

                fillColor: Colors.transparent,
                hoverColor: Colors.amber,
                filled: true,
                hintStyle: TextStyle(color: Colors.black38),
                hintText: "Nombre",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                enabled: true
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Estado"),
        Container(
          width: SizeConfig.screenWidth! * 90,
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
               if(dropdownValue == "Abierto"){
                 widget.estatus.text = 'true';
               }else{
                 widget.estatus.text = 'false';
               }
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Descripción"),
        const SizedBox(height: 8),
        SizedBox(
          width: SizeConfig.screenWidth! * 90,
          child: TextFormField(
            maxLines: 4,
            controller: widget.descripcion,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Este campo es requerido';
            },
            style: TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                fillColor: Colors.transparent,
                hoverColor: Colors.amber,
                filled: true,
                hintStyle: TextStyle(color: Colors.black38),
                hintText: "Nombre",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                ),
                enabled: true
            ),
          ),
        ),
      ],
    );
  }

  cleanInput(input) {
    TextEditingController editInput = input;
    editInput.text = '';
  }
}
