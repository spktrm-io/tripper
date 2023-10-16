import React, { useState, useEffect } from "react";
import { Text, View } from "react-native";
import { Magnetometer } from "expo-sensors";

export default function Compass() {
  const [data, setData] = useState({
    x: 0,
    y: 0,
    z: 0,
  });

  useEffect(() => {
    Magnetometer.setUpdateInterval(100);
    const alpha = 0.2; // Smoothing factor, you can adjust this value

    const subscribe = Magnetometer.addListener((result) => {
      // Apply a simple low-pass filter to the data
      setData((prevData) => ({
        x: prevData.x * (1 - alpha) + result.x * alpha,
        y: prevData.y * (1 - alpha) + result.y * alpha,
        z: prevData.z * (1 - alpha) + result.z * alpha,
      }));
    });

    return () => {
      subscribe.remove();
    };
  }, []);

  const angle = Math.atan2(data.y, data.x);
  const degree = (angle * 180) / Math.PI;
  const compassDirection = (degree + 360) % 360;

  return (
    <View>
      <Text>Compass Direction: {compassDirection}°</Text>
    </View>
  );
}
