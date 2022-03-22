# 2LEIC03T3

# Team name

## Members
- António José Salazar Correia - 201804832
- Shirley Fermino Rodrigues Fortes - 201808614
- Tomás Pereira Maciel - 202006845
- Simao Queirós Rodrigues - 202005700


# EasyFood

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC03T3/blob/main/n.drawio.png"/>
</p>

|||
| --- | --- |
| *Name* | Check-in |
| *Actor* |  User | 
| *Description* | - The user registers his access to the canteen. |
| *Preconditions* | - User GPS location must be within the limits of the canteen. <br> - The canteen must be within its working hours. |
| *Postconditions* | - Check-out available. <br> - The information on the number of people in the canteen is updated. |
| *Normal flow* | 1. The user enters the canteen section of the application. <br> 2. The system checks the canteen's schedules. <br> 3. The system shows the check-in option. <br> 4. The user selects the check-in option. <br> 5. The system checks the user's GPS location. <br> 6. The system displays a check-in successfully message. |
| *Alternative flows and exceptions* | 1. [Check-in outside canteen hours] If step 2 fails because the user tries to check-in outside the canteen's hours, the system disables the check-in option and displays the next day and time the canteen opens on the interface. <br> 2. [User's GPS location unavailable] If step 5 fails because the user does not have GPS enabled on their device, the system asks the user to activate their location and retry the check-in. <br> 3. [User's invalid GPS location] If step 5 fails because the user is in a place outside the limits of the canteen, the system displays a message informing the user that it is necessary to be in the canteen area to check-in. |

|||
| --- | --- |
| *Name* | Get information |
| *Actor* |  User | 
| *Description* | - Description	Have access to informations about canteen on the app |
| *Preconditions* | - The user has to been logged in. |
| *Postconditions* | - The user can see the information |
| *Normal flow* | 1.	The user opens the app <br> 2. 2.	The user logs in on the system. <br> 3. The user does the check-in <br> 4.	The app shows the available informations. <br> 5.	The user selects the information that it needs. <br> 6. 5.	The user can see the selected information |
| *Alternative flows and exceptions* |  |

