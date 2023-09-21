

import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map <String,Map<String,String>> get keys=>{
     'en_US':{
       'email_hint':'Enter Email',
       'internet_exception':"we are unable to show results.\nPlease check your data\n connection.",
       'general_exception':"we are unable to process your request\n please try again",
       'welcome_back':"Welcome\n Back",
       'login':'Login',
       'password_hint':'Password'
     },
    'bn_BD':{
      'email_hint':' আপনার ইমেল',
      'internet_exception':"আমরা ফলাফল দেখাতে অক্ষম \nঅনুগ্রহ করে আপনার ডেটা সংযোগ\n পরীক্ষা করুন",
      'general_exception':"আমরা আপনার অনুরোধ সম্পূর্ণ করতে অক্ষম\nঅনুগ্রহপূর্বক আবার চেষ্টা করুন",
      'welcome_back':"ফিরে আসার জন্য\nস্বাগতম",
      'login':'প্রবেশ করুন',
      'password_hint':'পাসওয়ার্ড'

    }
   };
}