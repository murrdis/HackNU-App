# HackNU-App

The service our team developed during the hackathon is a document delivery service for clients of Centralized Service Centers (CSCs) (ЦОН) in Kazakhstan. The service consists of a website and a mobile application.

The client of (ЦОН) receives a SMS which says that their document is ready to be delivered to him snd provides a link to our web-site where he can fill in his delivery details, choose his preferred delivery service, and make a payment.

Receiving the SMS       |   Filling all the necessary information       |   Making a Payment
:--------------------------------:|:--------------------------------:|:------------------------------------------------:
 <img width="908" alt="Screenshot 2023-05-12 at 21 16 27" src="https://github.com/murrdis/HackNU-App/assets/121186235/2bb97709-9915-4c5f-b0ee-8d1762a1b951">   |   <img width="860" alt="Screenshot 2023-05-12 at 21 03 29" src="https://github.com/murrdis/HackNU-App/assets/121186235/e141ba31-4156-4b04-9efd-b07b66331b49">   |   <img width="861" alt="Screenshot 2023-05-12 at 21 03 48" src="https://github.com/murrdis/HackNU-App/assets/121186235/afbf0e15-ab91-400a-ad01-b650258f416f">

The mobile application serves as a platform for couriers belonging to delivery companies such as Yandex and others to take orders. 
They can view the orders information in my application and choose the ones that are suitable for them to fulfill. 
Once a courier accepts an order, both the courier and the CSC(ЦОН) employee receive an SMS notification containing a unique code.

In the application, the courier is shown only those orders that match his delivery service in which he works

LogIn and viewing the available orders       |   Accepting the particular order
:--------------------------------:|:------------------------------------------------:
<img width="818" alt="Screenshot 2023-05-12 at 21 30 57" src="https://github.com/murrdis/HackNU-App/assets/121186235/266ce0ae-8544-4480-8ee0-9a9113921acc">   |   <img width="819" alt="Screenshot 2023-05-12 at 21 31 13" src="https://github.com/murrdis/HackNU-App/assets/121186235/0360424a-6079-4d68-8a59-bd8522faa3ae">

The courier then goes to the specified CSC(ЦОН) to collect the document, where the unique code received in SMS by the courier is checked against the code provided by the CSC employee. The courier can only collect the document after the codes match. After collecting the document, the courier delivers it to the client, who also receives a code via SMS. The courier verifies this code with the client, and upon successful verification, hands over the document to the client. The courier then proceeds to other pending orders.

Also, CSC(ЦОН) can edit the accounts of the verified couriers and should confirm the delivery of the document to the courier

Editing the accounts of the verified couriers by CSC(ЦОН)       |   Confirming the delivery of the document to the courier
:--------------------------------:|:------------------------------------------------:
 <img width="809" alt="Screenshot 2023-05-12 at 21 41 14" src="https://github.com/murrdis/HackNU-App/assets/121186235/f3cc2107-a857-4cd3-987d-1987ab0ca671">  |   <img width="871" alt="Screenshot 2023-05-12 at 21 49 23" src="https://github.com/murrdis/HackNU-App/assets/121186235/ca5000e0-9ea4-4c85-9f04-a9514653bc94">
