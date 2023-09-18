import React from "react";
import {
  NavigationContainer,
  ParamListBase,
  useNavigation,
} from "@react-navigation/native";
import {
  CardStyleInterpolators,
  StackCardInterpolationProps,
  StackNavigationProp,
  createStackNavigator,
} from "@react-navigation/stack";
import "react-native-reanimated";

import LoginScreen from "./src/screens/Login";
import HomeScreen from "./src/screens/Home";
import SplashScreen from "./src/screens/SplashScreen";
import Roads from "./src/screens/Roads/Roads";
import Button from "./src/ui/Button";

const Stack = createStackNavigator();

interface IHeaderProps {
  iconName: string;
}

const ButtonGoBack = ({ iconName }: IHeaderProps) => {
  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();

  return (
    <Button
      mx={16}
      icon={iconName}
      secondary
      height={50}
      width={50}
      onPress={() => navigation.goBack()}
    />
  );
};

const screenAnimations = {
  // Tela desliza da direita para a esquerda (padrão)
  slideFromRight: CardStyleInterpolators.forHorizontalIOS,

  // Tela desliza de baixo para cima
  slideFromBottom: CardStyleInterpolators.forVerticalIOS,

  // Tela aparece com um efeito de zoom
  zoomIn: CardStyleInterpolators.forScaleFromCenterAndroid,

  // Tela aparece com um efeito de fade-in
  fadeIn: CardStyleInterpolators.forFadeFromBottomAndroid,

  // Tela desliza da esquerda para a direita
  slideFromLeft: ({
    current,
    inverted,
    layouts,
  }: StackCardInterpolationProps) => {
    const progress = inverted
      ? current.progress.interpolate({
          inputRange: [0, 1],
          outputRange: [0, 1],
        })
      : current.progress;

    const translateX = progress.interpolate({
      inputRange: [0, 1],
      outputRange: [layouts.screen.width, 0],
    });

    return {
      cardStyle: {
        transform: [{ translateX }],
      },
    };
  },
};

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
            headerLeft: () => <ButtonGoBack iconName="chevron-left" />,
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={LoginScreen}
        />
        <Stack.Screen
          name="Roads"
          options={{
            headerRight: () => <ButtonGoBack iconName="chevron-right" />,
            gestureDirection: "horizontal-inverted",
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={Roads}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
