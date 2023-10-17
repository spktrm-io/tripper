import { Keyboard, View } from "react-native";
import React, { useCallback, useImperativeHandle } from "react";
import {
  Gesture,
  GestureDetector,
  TouchableWithoutFeedback,
} from "react-native-gesture-handler";
import Animated, {
  Extrapolate,
  interpolate,
  useAnimatedStyle,
  useSharedValue,
  withSpring,
} from "react-native-reanimated";
import { SCREEN_HEIGHT } from "../../../constants/window";
import { IBottomSheetRefProps } from "../../../interfaces/BottomSheet/IBottomSheetRefProps";
import { IBottomSheetProps } from "../../../interfaces/BottomSheet/IBottomSheetProps";
import { styles } from "./BottomSheet.style";

const MAX_TRANSLATE_Y = -SCREEN_HEIGHT + 170;

const BottomSheet = React.forwardRef<IBottomSheetRefProps, IBottomSheetProps>(
  ({ children }, ref) => {
    const translateY = useSharedValue(0);
    const active = useSharedValue(false);
    const searched = useSharedValue(false);

    const scrollTo = useCallback((destination: number) => {
      "worklet";
      active.value = destination !== 0;

      translateY.value = withSpring(destination, { damping: 50 });
    }, []);

    const setIsSearched = useCallback((bool: boolean) => {
      "worklet";
      searched.value = bool;
    }, []);

    const isActive = useCallback(() => {
      return active.value;
    }, []);

    const isSearched = useCallback(() => {
      return searched.value;
    }, []);

    useImperativeHandle(
      ref,
      () => ({ scrollTo, isActive, isSearched, setIsSearched }),
      [scrollTo, isActive, isSearched, setIsSearched]
    );

    const context = useSharedValue({ y: 0 });

    const gesture = Gesture.Pan()
      .onStart(() => {
        context.value = { y: translateY.value };
      })
      .onUpdate((event) => {
        if (!searched.value) {
          translateY.value = event.translationY + context.value.y;
          translateY.value = Math.max(translateY.value, MAX_TRANSLATE_Y);
        }
      })
      .onEnd(() => {
        if (translateY.value > -SCREEN_HEIGHT / 3) {
          scrollTo(0);
        } else if (translateY.value > -SCREEN_HEIGHT / 2) {
          scrollTo(MAX_TRANSLATE_Y / 2);
        } else if (translateY.value > -SCREEN_HEIGHT) {
          scrollTo(MAX_TRANSLATE_Y);
        }
      });

    const rBottomSheetStyle = useAnimatedStyle(() => {
      const borderRadius = interpolate(
        translateY.value,
        [MAX_TRANSLATE_Y + 50, MAX_TRANSLATE_Y],
        [25, 5],
        Extrapolate.CLAMP
      );

      return {
        borderRadius,
        transform: [{ translateY: translateY.value }],
      };
    });

    const handleOnPressTouchableWithoutFeedback = () => {
      if (isActive()) {
        Keyboard.dismiss();
        setIsSearched(false);
        scrollTo(0);
      } else {
        scrollTo(-SCREEN_HEIGHT / 2);
      }
    };

    return (
      <GestureDetector gesture={gesture}>
        <Animated.View style={[styles.bottomSheetContainer, rBottomSheetStyle]}>
          <TouchableWithoutFeedback
            onPress={handleOnPressTouchableWithoutFeedback}
          >
            <View style={styles.line} />
          </TouchableWithoutFeedback>
          {children}
        </Animated.View>
      </GestureDetector>
    );
  }
);

export default BottomSheet;
