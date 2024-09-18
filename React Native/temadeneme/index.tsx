import { GluestackUIProvider, Text, Button, ButtonText, ButtonIcon, AddIcon, Box, FormControl, FormControlLabelText, FormControlLabel, InputField, Input, FormControlHelper, FormControlErrorIcon, FormControlHelperText, FormControlError, AlertCircleIcon, FormControlErrorText, View, AlertDialogBackdrop, AlertDialogContent, AlertDialogHeader, AlertDialogCloseButton, Heading, AlertDialogBody, AlertDialogFooter, ButtonGroup, AlertDialog, Icon, CloseIcon, Menu, MenuItem, GlobeIcon, MenuItemLabel, SettingsIcon } from '@gluestack-ui/themed';
import { config } from '@gluestack-ui/config'; // Optional if you want to use default theme
import React from 'react';
import { PaintBucket, PuzzleIcon } from 'lucide-react-native';

export default function App() {
  const [showAlertDialog, setShowAlertDialog] = React.useState(false)
  return (
    <GluestackUIProvider config={config}>
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>Hello World!</Text>
        <Box h="$32" w="$72" bgColor='bisque' borderRadius={"$lg"}>
          <FormControl size="md" isDisabled={false} isInvalid={false} isReadOnly={false} isRequired={false} >
            <FormControlLabel mb='$1'>
            </FormControlLabel>
            <Input borderRadius={"$xl"}>
              <InputField
                type="text"
                defaultValue="deneme"
              />
            </Input>
            <FormControlHelper>
              <FormControlHelperText>
                İsminizi giriniz
              </FormControlHelperText>
            </FormControlHelper>
            <FormControlError>
              <FormControlErrorIcon
                as={AlertCircleIcon}
              />
              <FormControlErrorText>
                isim yaz
              </FormControlErrorText>
            </FormControlError>
            <FormControlLabel mb='$1'>
            </FormControlLabel>
            <Input borderRadius={"$xl"}>
              <InputField
                type="password"
                defaultValue="12345"
                placeholder="password"
              />
            </Input>
            <FormControlHelper>
              <FormControlHelperText>
                Must be at least 6 characters.
              </FormControlHelperText>
            </FormControlHelper>
            <FormControlError>
              <FormControlErrorIcon
                as={AlertCircleIcon}
              />
              <FormControlErrorText>
                At least 6 characters are required.
              </FormControlErrorText>
            </FormControlError>
          </FormControl>
        </Box>
        <Button onPress={() => setShowAlertDialog(true)} borderRadius={'$xl'}>
          <ButtonText>Click me</ButtonText>
        </Button>
        <AlertDialog
          isOpen={showAlertDialog}
          onClose={() => {
            setShowAlertDialog(false)
          }}
        >
          <AlertDialogBackdrop />
          <AlertDialogContent>
            <AlertDialogHeader>
              <Heading size="lg">Deactivate account</Heading>
              <AlertDialogCloseButton>
                <Icon as={CloseIcon} />
              </AlertDialogCloseButton>
            </AlertDialogHeader>
            <AlertDialogBody>
              <Text size="sm">
                Are you sure you want to deactivate your account? Your data will
                be permanently removed and cannot be undone.
              </Text>
            </AlertDialogBody>
            <AlertDialogFooter>
              <ButtonGroup space="lg">
                <Button
                  variant="outline"
                  action="secondary"
                  onPress={() => {
                    setShowAlertDialog(false)
                  }}
                >
                  <ButtonText>Cancel</ButtonText>
                </Button>
                <Button
                  bg="$error600"
                  action="negative"
                  onPress={() => {
                    setShowAlertDialog(false)
                  }}
                >
                  <ButtonText>Deactivate</ButtonText>
                </Button>
              </ButtonGroup>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialog>

        <Menu
          placement="top"
          trigger={({ ...triggerProps }) => {
            return (
              <Button {...triggerProps}>
                <ButtonText>Menu</ButtonText>
              </Button>
            );
          }}
        >
          <MenuItem key="Community" textValue="Community">
            <Icon as={GlobeIcon} size="sm" mr='$2' />
            <MenuItemLabel size='sm'>
              Community
            </MenuItemLabel>
          </MenuItem>
          <MenuItem key="Plugins" textValue="Plugins">
            {/* PuzzleIcon is imported from 'lucide-react-native' */}
            <Icon as={PuzzleIcon} size="sm" mr='$2' />
            <MenuItemLabel size='sm'>
              Plugins
            </MenuItemLabel>
          </MenuItem>
          <MenuItem key="Theme" textValue="Theme">
            {/* PaintBucket is imported from 'lucide-react-native' */}
            <Icon as={PaintBucket} size="sm" mr='$2' />
            <MenuItemLabel size='sm'>
              Theme
            </MenuItemLabel>
          </MenuItem>
          <MenuItem key="Settings" textValue="Settings">
            <Icon as={SettingsIcon} size="sm" mr='$2' />
            <MenuItemLabel size='sm'>
              Settings
            </MenuItemLabel>
          </MenuItem>
          <MenuItem key="Add account" textValue="Add account">
            <Icon as={AddIcon} size="sm" mr='$2' />
            <MenuItemLabel size='sm'>
              Add account
            </MenuItemLabel>
          </MenuItem>
        </Menu>
      </View>
    </GluestackUIProvider>
  );
}