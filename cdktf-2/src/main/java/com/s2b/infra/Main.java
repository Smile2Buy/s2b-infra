package com.s2b.infra;

import com.hashicorp.cdktf.App;
import com.hashicorp.cdktf.CloudBackend;
import com.hashicorp.cdktf.CloudBackendConfig;
import com.hashicorp.cdktf.NamedCloudWorkspace;


public class Main {
    public static void main(String[] args) {
        final App app = new App();
        MainStack stack = new MainStack(app, "s2b-infra-simple");
        new CloudBackend(stack, CloudBackendConfig.builder()
                .hostname("app.terraform.io")
                .organization("smile2buy")
                .workspaces(new NamedCloudWorkspace("s2b-infra-bootstrap")).build());
        app.synth();
    }
}
