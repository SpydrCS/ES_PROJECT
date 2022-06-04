import 'package:easy_food/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key:key);
  @override
  State<StatefulWidget> createState() => _FeedBackDialogState();

}

enum MenuChoice { carne, peixe, vegetariano, dieta }

class _FeedBackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  MenuChoice? _character = MenuChoice.carne;

  @override
  void dispose() {
  _controller.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              children: <Widget> [
                const SizedBox(height: 100),
                const Text("Tell us about you experience",
                      style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black87, fontSize: 20)),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Enter your feedback here',
                      filled: true,
                    ),
                    maxLines: 5 ,
                    maxLength: 1000,
                    textInputAction: TextInputAction.done,
                    validator: (String? text) {
                      if(text == null || text.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Menu Carne'),
                  leading: Radio<MenuChoice>(
                    value: MenuChoice.carne,
                    groupValue: _character,
                    onChanged: (MenuChoice? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Menu Peixe'),
                  leading: Radio<MenuChoice>(
                    value: MenuChoice.peixe,
                    groupValue: _character,
                    onChanged: (MenuChoice? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Menu Vegetariano'),
                  leading: Radio<MenuChoice>(
                    value: MenuChoice.vegetariano,
                    groupValue: _character,
                    onChanged: (MenuChoice? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Menu Dieta'),
                  leading: Radio<MenuChoice>(
                    value: MenuChoice.dieta,
                    groupValue: _character,
                    onChanged: (MenuChoice? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(height: 10),
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              ]
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  async {   },// code to send database),
          child: const Text('Send'),
        ),

    );



  return AlertDialog(

    content: Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          hintText: 'Enter your feedback here',
          filled: true,
        ),
        maxLines: 3 ,
        maxLength: 400,
        textInputAction: TextInputAction.done,
        validator: (String? text) {
          if(text == null || text.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
      ),
    ),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
      TextButton(
          child: const Text('Send'),
          onPressed: () async {
            /* code to send data to database */
          },
      ),
      Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 3 ,
          maxLength: 400,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if(text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
    ],
    );
  }
}

// showDialog(context: context, builder: (context) => const FeedbackDialog());
