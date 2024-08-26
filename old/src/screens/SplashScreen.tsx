import { ParamListBase, useNavigation } from "@react-navigation/native";
import { StackNavigationProp } from "@react-navigation/stack";
import React, { useEffect } from "react";
import { View, StyleSheet } from "react-native";
import Animated, {
  withSpring,
  useSharedValue,
  useAnimatedStyle,
  withRepeat,
  withSequence,
} from "react-native-reanimated";

const SplashScreen = () => {
  const navigation = useNavigation<StackNavigationProp<ParamListBase>>();

  const scale = useSharedValue(1);

  useEffect(() => {
    setTimeout(() => {
      navigation.navigate("Home");
    }, 3000);

    scale.value = withRepeat(
      withSequence(withSpring(1.1, { damping: 10, stiffness: 1 })),
      0,
      true
    );
  }, []);

  const animatedStyle = useAnimatedStyle(() => {
    return {
      transform: [{ scale: scale.value }],
    };
  });

  return (
    <View style={styles.container}>
      <Animated.Image
        source={require("../../assets/tripper-logo.png")}
        style={[styles.logo, animatedStyle]}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#000", // Cor de fundo da tela de boas-vindas
    alignItems: "center",
    justifyContent: "center",
  },
  logo: {
    width: 200, // Largura da logo
    height: 200, // Altura da logo
    resizeMode: "contain", // Ajusta a imagem à sua área
  },
});

export default SplashScreen;
