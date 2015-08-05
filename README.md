# textfield_delegate_notification_kvo

self.m_TextField setText:这个方法，不能触发代理textField:shouldChangeCharactersInRange:replacementString
            方和通知UITextFieldTextDidChangeNotification，可以用kvo解决
