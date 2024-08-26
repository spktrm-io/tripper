export interface IBottomSheetRefProps {
  scrollTo: (destination: number) => void;
  isActive: () => boolean;
  isSearched: () => boolean;
  setIsSearched: (bool: boolean) => void;
}
