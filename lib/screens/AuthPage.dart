import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFCC00),
        body: Center(

          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Welcome to \n Happy Belly', 
                      style:TextStyle(
                        fontSize: 40
                      ),
                    ),
                  ],
                ),


                Container(
                 width: MediaQuery.of(context).size.width,
                height: 420, 
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/foodtray.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  child: Center(
                    child: OutlinedButton(
                        onPressed: () {
                          
                          _showBottomSheet(context);

                        },
                        
                        style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color(0xFFE84B1D), 
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(color: Color(0xFFE84B1D))       
                                      ), 
                        child: const Padding(
                          padding: EdgeInsets.only(left: 100, right: 100, top: 16, bottom: 16),// Adjust padding as needed
                          child: Text(
                            'sign in/sign up',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                  )
                ),
              ],
            ),
          ),
        ),
      );
  }
}


  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              _buildForm(),
            ],
          ),
        );
      },
    );
  }


  Widget _buildForm() {
  return Form(
  child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Add this to align items to the start (left)

    children: <Widget>[

         const SizedBox(height: 16.0),

        const Text('Email', textAlign: TextAlign.left,),

        const SizedBox(height: 16.0),
      
      Container(
        
        decoration: BoxDecoration(
          color: Colors.grey[200], // Set the background color
          borderRadius: BorderRadius.circular(8.0),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
         
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none, // Remove the border
              hintText: 'Enter your email', // Placeholder text
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),

      
      const SizedBox(height: 16.0),

      const Text('Password', textAlign: TextAlign.left,),

      const SizedBox(height: 16.0),



      Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Set the background color
            borderRadius: BorderRadius.circular(8.0),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none, // Remove the border
                hintText: 'Password', // Placeholder text
              ),
              obscureText: true,
              // keyboardType: TextInputType.visiblePassword,
            ),

          ),

        ),
    
     
      // TextFormField(
      //   decoration: InputDecoration(
      //     labelText: 'Password',
      //   ),
      //   obscureText: true,
      // ),

      const SizedBox(height: 40.0),

      Center(
        child:  ElevatedButton(
        onPressed: () {
          // Perform form submission logic here
        },
        child: const Text('Submit'),
      ),
      )

     
    ],
  ),
);
}
