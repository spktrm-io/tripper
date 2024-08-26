import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import {
  CardStyleInterpolators,
  createStackNavigator,
} from "@react-navigation/stack";
import "react-native-reanimated";

import LoginScreen from "./src/screens/Login";
import HomeScreen from "./src/screens/Home";
import SplashScreen from "./src/screens/SplashScreen";
import Roads from "./src/screens/Roads/Roads";
import SignUpStart from "./src/screens/SignUp/SignUpStart";
import EmailSignUp from "./src/screens/SignUp/EmailSignUp";
import NumberSignUp from "./src/screens/SignUp/NumberSignUp";
import UsernameSignUp from "./src/screens/SignUp/UsernameSignUp";
import PasswordSignUp from "./src/screens/SignUp/PasswordSignUp";
import Profile from "./src/screens/Profile/Profile";
import EmailEdit from "./src/screens/Profile/Edit/EmailEdit";
import NumberEdit from "./src/screens/Profile/Edit/NumberEdit";
import UsernameEdit from "./src/screens/Profile/Edit/UsernameEdit";
import PasswordEdit from "./src/screens/Profile/Edit/PasswordEdit";
import RoadDetails from "./src/screens/Roads/RoadDetails/RoadDetails";

const screenAnimations = {
  // Tela desliza da direita para a esquerda (padrão)
  slideFromRight: CardStyleInterpolators.forHorizontalIOS,

  // Tela desliza de baixo para cima
  slideFromBottom: CardStyleInterpolators.forVerticalIOS,

  // Tela aparece com um efeito de zoom
  zoomIn: CardStyleInterpolators.forScaleFromCenterAndroid,

  // Tela aparece com um efeito de fade-in
  fadeIn: CardStyleInterpolators.forFadeFromBottomAndroid,
};

export type RootStackParamList = {
  UsernameSignUp: {
    email?: string;
    number?: string;
  };
  PasswordSignUp: {
    email?: string;
    number?: string;
    username: string;
  };
  Splash: undefined;
  Home: undefined;
  Login: undefined;
  Roads: undefined;
  SignUpStart: undefined;
  EmailSignUp: undefined;
  NumberSignUp: undefined;
  Profile: undefined;
  EmailEdit: undefined;
  NumberEdit: undefined;
  UsernameEdit: undefined;
  PasswordEdit: undefined;
  RoadDetails: {
    id: string;
    name: string;
    address: string;
    source: any;
    description: string;
  };
};

const Stack = createStackNavigator<RootStackParamList>();

function Routes() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        screenOptions={{
          headerTitle: "",
          headerTransparent: true,
          headerStyle: {
            height: 130,
          },
          headerLeft: () => null,
        }}
        initialRouteName="Splash"
      >
        <Stack.Screen
          options={{
            headerLeft: () => null,
          }}
          name="Splash"
          component={SplashScreen}
        />
        <Stack.Screen
          options={{
            cardStyleInterpolator: screenAnimations.fadeIn,
          }}
          name="Home"
          component={HomeScreen}
        />
        <Stack.Screen
          name="Login"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={LoginScreen}
        />
        <Stack.Screen
          name="Roads"
          options={{
            gestureDirection: "horizontal-inverted",
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={Roads}
        />
        <Stack.Screen
          name="SignUpStart"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={SignUpStart}
        />
        <Stack.Screen
          name="EmailSignUp"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={EmailSignUp}
        />
        <Stack.Screen
          name="NumberSignUp"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={NumberSignUp}
        />
        <Stack.Screen
          name="UsernameSignUp"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={UsernameSignUp}
        />
        <Stack.Screen
          name="PasswordSignUp"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={PasswordSignUp}
        />
        <Stack.Screen
          name="Profile"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={Profile}
        />
        <Stack.Screen
          name="EmailEdit"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={EmailEdit}
        />
        <Stack.Screen
          name="NumberEdit"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={NumberEdit}
        />
        <Stack.Screen
          name="UsernameEdit"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={UsernameEdit}
        />
        <Stack.Screen
          name="PasswordEdit"
          options={{
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={PasswordEdit}
        />
        <Stack.Screen
          name="RoadDetails"
          options={{
            gestureDirection: "horizontal-inverted",
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={RoadDetails}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default Routes;
