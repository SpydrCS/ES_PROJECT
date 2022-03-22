# 2LEIC03T3

# Team name

## Members
- António José Salazar Correia - 201804832
- Shirley Fermino Rodrigues Fortes - 201808614
- Tomás Pereira Maciel - 202006845
- Simao Queirós Rodrigues - 202005700


# EasyFood

## Vision Stament
Feup students who require a more convenient and practical means of accessing information about the cantine and providing feedback.
EasyFood is an app that displays cantieen service hours, the number of people in the canteen, and menus, as well as allowing you to do  a compliment to the food and service.
Students will benefit much from this access, and the developers team will be capable of performing software engineering.

## Main Features
### Canteen information 
- Show service hours
- Number of people in the canteen
- Menus (Meet, Fish, Vegetarian) 

### Feeback
- Select the food consumed and a give a feedback (1-5 stars + a commentary)
- Sugestion about the menu

### Check-in and check-out
- User can say if they are on the canteen or not.

## Required API's
- Mobile GPS.
- Look for information about the canteen (menu, price, service hours) on the sigarra page.


|||
| --- | --- |
| *Name* | Check-in |
| *Actor* |  User | 
| *Description* | - The user registers his access to the canteen. |
| *Preconditions* | - User GPS location must be within the limits of the canteen. <br> - The canteen must be in its working hours. |
| *Postconditions* | - Check-out available. <br> - The information on the number of people in the canteen is updated. |
| *Normal flow* | 1. The user enters the canteen section of the application. <br> 2. The system checks the canteen's schedules. <br> 3. The system shows the check-in option. <br> 4. The user selects the check-in option. <br> 5. The system checks the user's GPS location. <br> 6. The system displays a check-in successfully message. |
| *Alternative flows and exceptions* | 1. [Check-in outside canteen hours] If step 2 fails because the user tries to check-in outside the canteen's hours, the system disables the check-in option and displays the next day and time the canteen opens on the interface. <br> 2. [User's GPS location unavailable] If step 5 fails because the user does not have GPS enabled on their device, the system asks the user to activate their location and retry the check-in. <br> 3. [User's invalid GPS location] If step 5 fails because the user is in a place outside the limits of the canteen, the system displays a message informing the user that it is necessary to be in the canteen area to check-in. |




