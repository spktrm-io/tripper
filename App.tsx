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
};

const Stack = createStackNavigator<RootStackParamList>();

function App() {
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
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
