<template>
  <div class="m-l-50 m-t-30 w-900">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px">
      <el-form-item label="轮播图名称" prop="name">
        <el-input v-model.trim="form.name" class="h-40 w-200"></el-input>
      </el-form-item>
            <el-form-item label="logo图片">
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
                <div class="el-upload__tip" slot="tip">只能上传jpg/png文件</div>
              </el-upload>
            </el-form-item>
            
      <el-form-item label="" prop="logo">
        <el-input v-model.trim="form.logo" class="h-40 w-200" placeholder="将文件拖到此处上方可上传"></el-input>
        <!-- <a href="http://wantu.taobao.com/mediaportal/index.htm" target="_blank" class="btn-link el-button el-button--success">上传图片 注册后点击[立即使用]</a> -->
      </el-form-item>
            
        <el-form-item label="所在页面" prop="type">
          <el-select v-model="form.type" placeholder="点击查看选项" class="h-40 w-200">
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
      <!-- <el-form-item label="备注">
        <el-input
          type="textarea"
          class="w-200"
          :autosize="{ minRows: 2, maxRows: 4}"
          placeholder="请输入内容"
          v-model="form.remark">
        </el-input>
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" @click="edit('form')" :loading="isLoading">提交</el-button>
        <el-button @click="goback()">返回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
  import http from '../../../../assets/js/http'
  import fomrMixin from '../../../../assets/js/form_com'
  import preview from '../../system/config/preview.vue'

  export default {
    data() {
      return {
        isLoading: false,
        fileList: [],
        propsImg: '',
        uploadUrl: '',
        options: [{
          value: '首页',
          label: '首页'
        }, {
          value: '回收页',
          label: '回收页'
        }, {
          value: '规则页',
          label: '规则页'
        }],
        form: {
          name: '',
          logo: '',
          type: '',
          remark: ''
        },
        rules: {
          name: [
            { required: true, message: '请输入轮播图名称', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      edit(form) {
        this.$refs[form].validate((valid) => {
          if (valid) {
            this.isLoading = !this.isLoading
            this.apiPut('admin/posts/', this.form.id, this.form).then((res) => {
              this.handelResponse(res, (data) => {
                _g.toastMsg('success', '编辑成功')
                setTimeout(() => {
                  this.goback()
                }, 1500)
              }, () => {
                this.isLoading = !this.isLoading
              })
            })
          }
        })
      },
      getPosInfo() {
        this.form.id = this.$route.params.id
        this.apiGet('admin/posts/' + this.form.id).then((res) => {
          this.handelResponse(res, (data) => {
            this.form.name = data.name
            this.form.remark = data.remark
            this.form.logo = data.logo
            this.form.type = data.type
            // this.form.flday = data.flday
            // this.form.maxmoney = data.maxmoney
            // this.form.limitday = data.limitday
            // this.form.squrl = data.squrl
            if (data.logo) {
              let img = window.HOST+'/' + data.logo
              if(data.logo.indexOf('http')>-1){
                img = data.logo
              }
              this.form.logo =img
              this.fileList[0] = { name: '图片', url: img ,status: 'finished'}
              //this.viewPic();
              // this.fileList.push({ name: '图片', url: img })
            }
          })
        })
      },
      uploadSuccess(res, file, fileList) {
        this.form.logo = res.data
        let data = {
          name: '图片',
          url: window.HOST + res.data
        }
        if (this.fileList.length) {
          this.fileList[0] = data
        } else {
          this.fileList.push(data)
        }
      },
      onexceed(){
        _g.toastMsg('warning','只可上传一张图片');
      },
      uploadFail(err, res, file) {
        console.log('err = ', _g.j2s(err))
        console.log('res = ', _g.j2s(res))
      },
      handleRemove(file, fileList) {
        console.log('file = ', file)
        console.log('fileList = ', fileList)
        this.form.logo = ''
      },
      viewPic() {
        this.propsImg = this.fileList[0].url
        this.$refs.preview.open()
      }
    },
    created() {
      this.uploadUrl = window.HOST + '/Upload'
      this.getPosInfo()
     
    },
    components: {
      preview
    },
    mixins: [http, fomrMixin]
  }
</script>