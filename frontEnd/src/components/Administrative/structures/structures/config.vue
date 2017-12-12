<template>
	<div class="m-l-50 m-t-30 w-500">
		<el-form ref="form" :model="form" :rules="rules" label-width="130px">
			<el-form-item label="MP3音频">
              <el-upload
              :action="uploadUrl"
              type="drag"
              limit="1"
              :on-exceed="onexceed"
              :thumbnail-mode="true"
              :on-remove="handleRemove"
              :on-success="uploadSuccess"
              :on-error="uploadFail"
              :default-file-list="fileList">
                <i class="el-icon-upload"></i>
                <div class="el-dragger__text">将文件拖到此处，或<em>点击上传</em></div>
                <div class="el-upload__tip" slot="tip">只能上传mp3文件</div>
              </el-upload>
            </el-form-item>
      <el-form-item label="" prop="MP3">
        <el-input v-model.trim="form.MP3" class="h-40 w-200" placeholder="将文件拖到此处上方可上传"></el-input>
      </el-form-item>
      <el-form-item label="规则描述">
        <el-input
            type="textarea"
            class="w-600"
            :autosize="{ minRows: 8, maxRows: 584}"
            placeholder="请输入内容"
            v-model="form.GUIZHE">
            </el-input>
      </el-form-item>
			<el-form-item>
				<el-button type="primary" @click="add()" :loading="isLoading">提交</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>
<script>
  import http from '../../../../assets/js/http'

  export default {
    data() {
      return {
        isLoading: false,
        fileList: [],
        propsImg: '',
        form: {
          GUIZHE: null,
          MP3: ''
        },
        uploadUrl: '',
        rules: {
          GUIZHE: [
            { required: true, message: '请输入规则描述' }
          ]
        }
      }
    },
    methods: {
      add() {
        this.$refs.form.validate((pass) => {
          if (pass) {
            this.isLoading = !this.isLoading
            this.apiPost('admin/systemConfigs', this.form).then((res) => {
              this.handelResponse(res, (data) => {
                _g.toastMsg('success', '提交成功')
                this.isLoading = !this.isLoading
              }, () => {
                this.isLoading = !this.isLoading
              })
            })
          }
        })
      },
      uploadSuccess(res, file, fileList) {
        this.form.MP3 =window.HOST +'/'+  res.data
        let data = {
          name: '音频',
          url:window.HOST +'/'+ res.data
        }
        if (this.fileList.length) {
          this.fileList[0] = data
        } else {
          this.fileList.push(data)
        }
      },
      onexceed(){
        _g.toastMsg('warning','只可上传一个音频文件');
      },
      uploadFail(err, res, file) {
        console.log('err = ', _g.j2s(err))
        console.log('res = ', _g.j2s(res))
      },
      handleRemove(file, fileList) {
        console.log('file = ', file)
        console.log('fileList = ', fileList)
      },
    },
    created() {
      this.uploadUrl = window.HOST + '/Upload'
      this.apiPost('admin/base/getConfigs').then((res) => {
        this.handelResponse(res, (data) => {
          this.form.GUIZHE = data.GUIZHE
          this.form.MP3 = data.MP3
          if (data.MP3) {
              let img = window.HOST+'/' + data.MP3
              if(data.MP3.indexOf('http')>-1){
                img = data.MP3
              }
              this.form.MP3 = img
              this.fileList[0] = { name: '音频', url: img ,status: 'finished'}
          }
        })
      })
    },
    mixins: [http]
  }
</script>