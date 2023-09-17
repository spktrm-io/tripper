import React from "react";
import {
  NavigationContainer,
  ParamListBase,
  useNavigation,
} from "@react-navigation/native";
import {
  CardStyleInterpolators,
  StackNavigationProp,
  createStackNavigator,
} from "@react-navigation/stack";
import { Text, TouchableOpacity } from "react-native";
import Icon from "react-native-vector-icons/FontAwesome";
import "react-native-reanimated";

import LoginScreen from "./src/screens/Login";
import HomeScreen from "./src/screens/Home";
import SplashScreen from "./src/screens/SplashScreen";
import Roads from "./src/screens/Roads/Roads";

const Stack = createStackNavigator();

interface IHeaderProps {
  iconName: string;
  rounded?: boolean;
  goBack?: boolean;
  navigate?: string;
}

const LeftHeaderIcon = ({
  iconName,
  rounded,
  goBack,
  navigate,
}: IHeaderProps) => {
  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();

  return (
    <TouchableOpacity
      style={{
        borderRadius: rounded ? 100 : 10,
        backgroundColor: "#e8e8e8",
        marginHorizontal: 15,
        padding: 15,
      }}
      onPress={() => {
        if (goBack) navigation.goBack();
        if (navigate) navigation.navigate(navigate);
      }}
    >
      <Icon name={iconName} size={15} />
    </TouchableOpacity>
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
  slideFromLeft: ({ current, inverted, layouts }) => {
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
            headerStyle: {
              height: 130,
            },
            headerLeft: () => (
              <LeftHeaderIcon iconName="road" navigate="Roads" />
            ),
            headerRight: () => (
              <LeftHeaderIcon iconName="bars" navigate="Login" />
            ),
            cardStyleInterpolator: screenAnimations.fadeIn,
          }}
          name="Home"
          component={HomeScreen}
        />
        <Stack.Screen
          name="Login"
          options={{
            headerLeft: () => (
              <LeftHeaderIcon iconName="chevron-left" rounded goBack />
            ),
            cardStyleInterpolator: screenAnimations.slideFromRight,
          }}
          component={LoginScreen}
        />
        <Stack.Screen
          name="Roads"
          options={{
            headerRight: () => (
              <LeftHeaderIcon iconName="chevron-right" rounded goBack />
            ),
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
