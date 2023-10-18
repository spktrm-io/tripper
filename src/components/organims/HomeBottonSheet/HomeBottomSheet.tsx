import {
  FlatList,
  Keyboard,
  StyleSheet,
  TextInput,
  TouchableWithoutFeedback,
  View,
} from "react-native";
import React, { useCallback, useRef, useState } from "react";
import BottomSheet from "../BottomSheet/BottomSheet";
import Button from "../../atoms/Button/Button";
import { placeList } from "../../../mock/placesList";
import CardItemBottomSheet from "../../molecules/CardItemBottomSheet/CardItemBottomSheet";
import { SCREEN_HEIGHT } from "../../../constants/window";
import { IBottomSheetRefProps } from "../../../interfaces/BottomSheet/IBottomSheetRefProps";
import { styles } from "./HomeBottomSheet.style";
import SearchBar from "../../molecules/SearchBar/SearchBar";

const HomeBottomSheet = () => {
  const ref = useRef<IBottomSheetRefProps>(null);
  const [search, setSearch] = useState<string>("");

  const onPress = useCallback(() => {
    ref?.current?.setIsSearched(true);
    ref?.current?.scrollTo(-SCREEN_HEIGHT + 170);
  }, []);

  const onPressExit = useCallback(() => {
    Keyboard.dismiss();
    setSearch("");
    ref?.current?.setIsSearched(false);
    const isActive = ref?.current?.isActive();
    if (isActive) ref?.current?.scrollTo(0);
  }, []);

  return (
    <BottomSheet ref={ref}>
      <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
        <View style={styles.bottomSheetContainer}>
          <SearchBar
            onPress={onPress}
            onPressExit={onPressExit}
            searchValue={search}
            setSearchValue={setSearch}
          />
          <FlatList
            data={placeList}
            renderItem={CardItemBottomSheet}
            keyExtractor={(item) => item.id}
          />
        </View>
      </TouchableWithoutFeedback>
    </BottomSheet>
  );
};

export default HomeBottomSheet;
