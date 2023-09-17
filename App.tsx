import React from "react";
import {
  NavigationContainer,
  ParamListBase,
  useNavigation,
} from "@react-navigation/native";
import {
  StackNavigationProp,
  createStackNavigator,
} from "@react-navigation/stack";
import { Text, TouchableOpacity } from "react-native";
import Icon from "react-native-vector-icons/FontAwesome";
import "react-native-reanimated";

import LoginScreen from "./src/screens/Login";
import HomeScreen from "./src/screens/Home";

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
      onPress={() =>
        goBack
          ? navigation.goBack()
          : navigate
          ? navigation.navigate(navigate)
          : null
      }
    >
      <Icon name={iconName} size={15} />
    </TouchableOpacity>
  );
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
          headerLeft: () => (
            <LeftHeaderIcon iconName="chevron-left" rounded goBack />
          ),
        }}
        initialRouteName="Home"
      >
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen
          options={{
            headerStyle: {
              height: 130,
            },
            headerLeft: () => null,
            headerRight: () => (
              <LeftHeaderIcon iconName="bars" navigate="Login" />
            ),
          }}
          name="Home"
          component={HomeScreen}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
