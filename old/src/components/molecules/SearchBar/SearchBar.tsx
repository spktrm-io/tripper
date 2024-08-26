import { TextInput, View } from "react-native";
import React from "react";
import Button from "../../atoms/Button/Button";
import { styles } from "./SearchBar.style";

const SearchBar = ({ onPress, searchValue, setSearchValue, onPressExit }) => {
  return (
    <View style={styles.searchContainer}>
      <TextInput
        style={styles.input}
        placeholder="Pra onde deseja viajar?"
        onFocus={onPress}
        onChangeText={(text) => setSearchValue(text)}
        value={searchValue}
      />
      <Button
        height={50}
        width={50}
        icon={"close"}
        secondary
        style={styles.cancelButton}
        onPress={onPressExit}
      />
    </View>
  );
};

export default SearchBar;
